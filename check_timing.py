#!/usr/bin/env python
#
#  check_timing.py
#
#  Copyright (C) 2012 Russ Dill <Russ.Dill@asu.edu>
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.

# For some timing measurements, we need to subtract ref buffer layout
# rise/fall to Vmeas time.

import sys
import math
import argparse
import spice_read
import bisect

def parse_si(val):
    if isinstance(val, float) or isinstance(val, int) or val == "inf":
        return float(val)

    ext = val.lstrip('+-0123456789.eE')
    e = 1
    if len(ext):
        val = val[0:-len(ext)]
        e = 'fpnum.kMGT'.find(ext[0])
        if e == -1:
            e = 5
        e = 10**((e - 5) * 3)
    return float(val) * e

def print_si(val, sig=4):
    exp = int(math.log10(abs(val)) // 3) if val else 0
    si = ''
    if exp >= -5 and exp <= 4 and exp:
        si = 'fpnum.kMGT'[exp + 5]
        val /= math.pow(10, exp * 3)
    return '{:.{}g}{}'.format(val, sig, si)

def get_vector(vectors, n):
    try:
        return filter(lambda vect: vect.name == n,
                vectors.get_datavectors())[0].get_data()
    except:
        raise Exception("Could not find vector {}".format(n))

def valid(data):
    return data == 0 or data == 1

parser = argparse.ArgumentParser(conflict_handler='resolve')
parser.add_argument('input', type=argparse.FileType('rb'),
    help='Spice3f5 input file')

parser.add_argument('-r', '--rising', type=str,
    help="Spice rising edge clock vector")
parser.add_argument('-f', '--falling', type=str,
    help="Spice falling edge clock vector")
parser.add_argument('-b', '--both', type=str,
    help="Spice falling edge clock vector")
parser.add_argument('-d', '--delay', default='0', type=str,
    help="Clock trigger delay")

parser.add_argument('-v', '--vector', type=str,
    help="Spice data vector")
parser.add_argument('-s', '--setup', default='0', type=str,
    help="Minimum setup time")
parser.add_argument('-h', '--hold', default='0', type=str,
    help="Minimum hold time")
parser.add_argument('-i', '--ignore-data-change', action='store_true',
    help="Ignore transitions of data during clock transition")

parser.add_argument('-V', '--violation', type=str,
    help="Spice violation vector")

parser.add_argument('-A', '--ac-margin', type=str,
    help="Spice AC margin vector")
parser.add_argument('-D', '--dc-margin', type=str,
    help="Spice DC margin vector")
parser.add_argument('-M', '--margin', type=str,
    help="Spice margin vector")

parser.add_argument('-S', '--start', default='0', type=str,
    help="Simulation start time")

parser.add_argument('-n', '--number', default=10, type=int,
    help="Number of violations to print (-1 for all)")

violations = dict()
slacks = dict()

args = parser.parse_args()
vectors = spice_read.spice_read(args.input).get_plots()[0]

if args.violation:
    violations["Spec"] = []
    violation = get_vector(vectors, args.violation)
time_vector = vectors.get_scalevector().get_data()

rising_clock = None
falling_clock = None

if args.rising:
    rising_clock = get_vector(vectors, args.rising)
    if args.falling or args.both:
        raise Exception("Specify only one clock")
elif args.falling:
    falling_clock = get_vector(vectors, args.falling)
    if args.rising or args.both:
        raise Exception("Specify only one clock")
elif args.both:
    rising_clock = get_vector(vectors, args.both)
    falling_clock = get_vector(vectors, args.both)

if rising_clock is not None or falling_clock is not None:
    if not args.ignore_data_change:
        violations["Data change"] = []
    violations["Clock delay"] = []

if args.ac_margin is None != args.dc_margin is None:
    raise Exception("AC margin requires DC margin and vice-versa")
if args.ac_margin and args.margin:
    raise Exception("AC/DC margin cannot be used with margin")
if (args.ac_margin or args.margin) and rising_clock is None and falling_clock is None:
    raise Exception("Margins require rising and/or falling clock")

if args.ac_margin:
    ac_margin = get_vector(vectors, args.ac_margin)
if args.dc_margin:
    dc_margin = get_vector(vectors, args.dc_margin)
if args.margin:
    dc_margin = get_vector(vectors, args.margin)

delay = parse_si(args.delay)
setup = parse_si(args.setup)
hold = parse_si(args.hold)
start = parse_si(args.start)

if args.vector:
    data = get_vector(vectors, args.vector)

violations["Setup time"] = []
slacks["Setup time"] = float("inf")
violations["Hold time"] = []
slacks["Hold time"] = float("inf")
if args.margin or args.ac_margin:
    slacks["Setup margin"] = float("inf")
    slacks["Hold margin"] = float("inf")

# Time when data became good
first_good = None

# Last late edge time (including delay)
last_edge = None

# Clock currently invalid, no data switching allowed (including delay)
clock_invalid = False

# Last valid->unknown clock transition (excluding delay)
edge_early = None

# Last unknown->valid clock transition (excluding delay)
edge_late = None

# Last time value
last_time = 0

# Currently in vector violation
vector_violation = False

margin_value = 0
margins = []

end = time_vector[-1]

# Precompute margin values
for idx, time in enumerate(time_vector):
    if time < start:
        pass
    elif args.ac_margin:
        margin_value = max(margin_value, ac_margin[idx])
        margin_value = min(margin_value, dc_margin[idx])
    elif args.margin:
        margin_value = dc_margin[idx]
    margins.append(margin_value)

for idx, time in enumerate(time_vector):
    if args.violation and violation[idx] > 0:
        if not vector_violation:
            violations["Spec"].append(time)
        vector_violation = True
    else:
        vector_violation = False

    if idx and args.vector and data[idx - 1] != data[idx]:
        # Data transition
        if valid(data[idx]):
            # Data good first
            first_good = time

        if valid(data[idx - 1]) and last_edge is not None:
            # Data good last
            slack = last_time - last_edge - hold
            if slack < 0:
                # Hold violation
                violations["Hold time"].append(time)
            slacks["Hold time"] = min(slacks["Hold time"], slack)

    next_edge_early = None
    next_edge_late = None
    if args.rising or args.both and idx:
        if rising_clock[idx - 1] == 0 and rising_clock[idx] > 0:
            # Positive edge (early)
            next_edge_early = last_time
        if rising_clock[idx - 1] < 1 and rising_clock[idx]  == 1:
            # Positive edge (late)
            next_edge_late = time

    if args.falling or args.both and idx:
        if falling_clock[idx - 1] == 1 and falling_clock[idx] < 1:
            # Negative edge (early)
            next_edge_early = last_time
        if falling_clock[idx - 1] > 0 and falling_clock[idx] == 0:
            # Negative edge (late)
            next_edge_late = time

    if next_edge_early is not None:
        if edge_early is not None:
            # Clock edge before delay
            violations["Clock delay"].append(time)
        edge_early = next_edge_early

    if next_edge_late is not None:
        if edge_late is not None:
            # Clock edge before delay
            violations["Clock delay"].append(time)
        edge_late = next_edge_late

    if edge_early is not None and edge_early + delay <= last_time:
        edge_early = None
        clock_invalid = True
        if not args.vector:
            pass
        elif not valid(data[idx - 1]):
            # Data not valid violation
            clock_invalid = False
            if not args.ignore_data_change:
                violations["Data change"].append(time)
        elif first_good is not None:
            slack = last_time - first_good - setup
            if slack < 0:
                # Setup time violation
                violations["Setup time"].append(time)
            slacks["Setup time"] = min(slacks["Setup time"], slack)

    if clock_invalid:
        def calc_margin(at):
            margin = None
            if at > start and at < end:
                past = bisect.bisect_right(time_vector, at) - 1
                margin = margins[past]
                if time_vector[past] != at and past + 1 < len(time_vector):
                    margin = min(margins[past + 1], margin)
            return margin

        if args.margin or args.ac_margin:
            margin = calc_margin(time + delay - setup)
            if margin is not None:
                slacks["Setup margin"] = min(margin, slacks["Setup margin"])

            margin = calc_margin(time + delay + hold)
            if margin is not None:
                slacks["Hold margin"] = min(margin, slacks["Hold margin"])

        if args.vector and data[idx] != data[idx - 1]:
            # Data changing during clock change violation
            if not args.ignore_data_change:
                violations["Data change"].append(time)
            clock_invalid = False

    if edge_late is not None and edge_late + delay <= time:
        clock_invalid = False
        edge_late = None
        last_edge = time

    last_time = time

for name, value in slacks.iteritems():
    if math.isinf(value):
        value = 'No data'
    else:
        value = print_si(value) + 's'
    print '{} slack: {}'.format(name, value)

total = 0
for name, violation in violations.iteritems():
    total += len(violation)
    if len(violation):
        print '{} violated {} time(s)!'.format(name, len(violation))
        if args.number != 0:
            print 'Violations:'
    for n, time in enumerate(violation):
        if args.number != -1 and n >= args.number:
            print ' ...'
            break
        print ' {}s'.format(print_si(time))

print 'Total violations: {}'.format(total)

sys.exit(total != 0)

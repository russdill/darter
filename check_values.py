#!/usr/bin/env python3
#
#  check_values.py
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

import sys
import math
import argparse
import spice_read

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
    return f'{val:.{sig}g}{si}'

def get_vector(vectors, n):
    return [vect for vect in vectors.get_datavectors() if vect.name == n][0].get_data()

parser = argparse.ArgumentParser(conflict_handler='resolve')
parser.add_argument('input', type=argparse.FileType('r'),
    help='Spice3f5 input file')

parser.add_argument('-v', '--vector', type=str, required=True,
    help="Spice data vector")
parser.add_argument('-l', '--low', type=str,
    help="Minimum voltage")
parser.add_argument('-h', '--high', type=str,
    help="Maximum voltage")
parser.add_argument('-S', '--start', default='0', type=str,
    help="Simulation start time")
parser.add_argument('-n', '--number', default=10, type=int,
    help="Number of violations to print (-1 for all)")

args = parser.parse_args()
vectors = spice_read.spice_read(args.input).get_plots()[0]
data = get_vector(vectors, args.vector)
time = vectors.get_scalevector().get_data()

violations = dict()
slack = dict()

start = parse_si(args.start)

if args.low:
    low = parse_si(args.low)
    violations["Minimum voltage"] = []
    slack["Minimum voltage"] = float("inf")
if args.high:
    high = parse_si(args.high)
    violations["Maximum voltage"] = []
    slack["Maximum voltage"] = float("inf")

high_violation = False
low_violation = False

for idx, time in enumerate(time):
    if time < start:
        continue

    if args.low:
        if data[idx] - low < 0:
            # low violation
            if not low_violation:
                violations["Minimum voltage"].append(time)
                low_violation = True
        else:
            low_violation = False
        slack["Minimum voltage"] = min(slack["Minimum voltage"], data[idx] - low)

    if args.high:
        if high - data[idx] < 0:
            # high violation
            if not high_violation:
                violations["Maximum voltage"].append(time)
                high_violation = True
        else:
            high_violation = False
        slack["Maximum voltage"] = min(slack["Maximum voltage"], high - data[idx])

for name, v in slack.items():
    print(f'{name} slack: {print_si(v)}V')

total = 0
for name, violation in violations.items():
    total += len(violation)
    if len(violation):
        print(f'{name} violated!')
        if args.number != 0:
            print('Violations:')
    for n, time in enumerate(violation):
        if args.number != -1 and n >= args.number:
            print(' ...')
            break
        print(f' {print_si(time)}s')

print(f'Total violations: {total}')

sys.exit(total != 0)

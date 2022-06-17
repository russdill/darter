#!/usr/bin/env python3
#
#  eye-pattern.py
#
#  Copyright (C) 2011 Russ Dill <Russ.Dill@asu.edu>
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

# TODO: Version that generates timing information.
#   latest state to good (x1)
#   earliest state to unk (x2)
# - Draw trapazoid on eye diagram
#   (x1, vinh_ac)         (x2, vinh_dc)
#   (x1, vinl_ac)         (x2, vinl_dc)

import sys
import argparse
import spice_read
import bisect
from pylab import *

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

def get_vector(vectors, n):
	return [vect for vect in vectors.get_datavectors() if vect.name == n][0].get_data()

def plot_at(vector, at):
	begin = max(bisect.bisect_right(time, at - width / 2) - 1, 0)
	end = min(bisect.bisect_left(time, at + width / 2), len(time) - 1)
	x = [ x - at for x in time[begin:end] ]
	plot(x, vector[begin:end], color='blue')

parser = argparse.ArgumentParser(conflict_handler='resolve')
parser.add_argument('-w', '--width', type=str, required=True,
	help="Plot width in seconds")
parser.add_argument('-v', '--vector', type=str, required=True,
	help="Spice vector to plot")
parser.add_argument('input', type=argparse.FileType('r'),
	help='Spice3f5 input file')
parser.add_argument('output', type=argparse.FileType('wb'), nargs='?',
	help='Plot output file')
parser.add_argument('-o', '--offset', default='0', type=str,
	help='Display offset (default: %(default)s)')
parser.add_argument('-s', '--start', default='0', type=str,
	help='Time start value (default: %(default)s)')
parser.add_argument('-e', '--end', default='inf', type=str,
	help='Time end value (default: %(default)s)')
parser.add_argument('-p', '--period', type=str,
	help='Manual trigger period')
parser.add_argument('-t', '--trigger', type=str,
	help="Auto trigger")
parser.add_argument('-r', '--rising-trigger', type=str,
	help="Auto rising trigger voltage")
parser.add_argument('-f', '--falling-trigger', type=str,
	help="Auto falling trigger voltage")
parser.add_argument('-h', '--hysteresis', default='0', type=str,
	help='Auto trigger voltage hysteresis (default: %(default)s)')

args = parser.parse_args()
vectors = spice_read.spice_read(args.input).get_plots()[0]
vector = get_vector(vectors, args.vector)
time = vectors.get_scalevector().get_data()
offset = parse_si(args.offset)
width = parse_si(args.width)
start = parse_si(args.start)
end = min(parse_si(args.end), time[-1])

xlim(-width / 2, width / 2)

samples = 0

if args.period:
	period = parse_si(args.period)
	center = offset + start
	while center < end:
		samples += 1
		plot_at(vector, center)
		center += period

elif args.trigger:
	hyst = parse_si(args.hysteresis)
	try:
		vect = get_vector(vectors, args.trigger)
	except:
		print("For {}".format(args.trigger), file=sys.stderr)
		raise

	if not args.falling_trigger and not args.rising_trigger:
		raise Exception('No trigger value given')
	both = args.falling_trigger and args.rising_trigger

	start_idx = max(bisect.bisect_right(time, start) - 1, 0)
	end_idx = min(bisect.bisect_left(time, end), len(time))

	if args.falling_trigger:
		fv = parse_si(args.falling_trigger)
		fstate = vect[start_idx] <= fv
	if args.rising_trigger:
		rv = parse_si(args.rising_trigger)
		rstate = vect[start_idx] >= rv

	for idx in range(start_idx, end_idx):
		curr = time[idx] + offset
		if both:
			if (rstate and vect[idx] <= fv) or (not rstate and vect[idx] >= rv):
				rstate = not rstate
				samples += 1
				plot_at(vector, curr)
		if args.falling_trigger and not both:
			if fstate and vect[idx] > fv + hyst:
				fstate = False
			elif not fstate and fvect[idx] <= fv:
				fstate = True
				samples += 1
				plot_at(vector, curr)
		if args.rising_trigger and not both:
			if rstate and vect[idx] < rv - hyst:
				rstate = False
			elif not rstate and vect[idx] >= rv:
				rstate = True
				samples += 1
				plot_at(vector, curr)
else:
	raise Exception('No stimulus given')

title(args.vector)
ylabel('Volts')
xlabel('Time (s)')
grid()

print('Processed {} samples'.format(samples))

if args.output:
	savefig(args.output)
else:
	show()
close()

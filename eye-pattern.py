#!/usr/bin/env python
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

import sys
import argparse
import spice_read
from pylab import *

def parse_num(val):
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
	return filter(lambda vect: vect.name == n,
			vectors.get_datavectors())[0].get_data()

def plot_at(vector, idx, timestep, steps):
	x_end = int(steps / 2)
	x_begin = x_end - steps

	begin = idx + x_begin
	if begin < 0:
		x_begin -= begin
		begin = 0

	end = idx + x_end
	if end > len(vector):
		x_end -= end - len(vector)
		end = len(vector)

	x = [ x * timestep for x in range(x_begin, x_end) ]
	plot(x, vector[begin:end], color='blue')

parser = argparse.ArgumentParser(conflict_handler='resolve')
parser.add_argument('-w', '--width', type=str, required=True,
	help="Plot width in seconds")
parser.add_argument('-v', '--vector', type=str, required=True,
	help="Spice vector to plot")
parser.add_argument('input', type=argparse.FileType('rb'),
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
timestep = time[1] - time[0]
end_time = time[-1] + timestep

width = parse_num(args.width)
steps = int(width / timestep)
offset = parse_num(args.offset)

start = parse_num(args.start)
end = parse_num(args.end)

xlim(-width / 2, width / 2)

samples = 0

if args.period:
	period = parse_num(args.period)
	center = offset + start
	while center < min(end, end_time):
		samples += 1
		plot_at(vector, int(center / timestep), timestep, steps)
		center += period

elif args.trigger:
	hyst = parse_num(args.hysteresis)
	vect = get_vector(vectors, args.trigger)

	if not args.falling_trigger and not args.rising_trigger:
		raise Exception('No trigger value given')
	both = args.falling_trigger and args.rising_trigger

	if start < 0:
		start_idx = 0
	else:
		start_idx = int(start / timestep)
	if end > end_time:
		end_idx = len(time)
	else:
		end_idx = int(math.ceil(end / timestep))

	if args.falling_trigger:
		fv = parse_num(args.falling_trigger)
		fstate = vect[start_idx] <= fv
	if args.rising_trigger:
		rv = parse_num(args.rising_trigger)
		rstate = vect[start_idx] >= rv

	idx = start_idx
	while idx < end_idx:
 		curr = int(idx + offset / timestep)
		if both:
			if (rstate and vect[idx] <= fv) or (not rstate and vect[idx] >= rv):
				rstate = not rstate
				samples += 1
				plot_at(vector, curr, timestep, steps)
		if args.falling_trigger and not both:
			if fstate and vect[idx] > fv + hyst:
				fstate = False
			elif not fstate and fvect[idx] <= fv:
				fstate = True
				samples += 1
				plot_at(vector, curr, timestep, steps)
		if args.rising_trigger and not both:
			if rstate and vect[idx] < rv - hyst:
				rstate = False
			elif not rstate and vect[idx] >= rv:
				rstate = True
				samples += 1
				plot_at(vector, curr, timestep, steps)
		idx += 1
else:
	raise Exception('No stimulus given')

title(args.vector)
ylabel('Volts')
xlabel('Time (s)')
grid()

print 'Processed {} samples'.format(samples)

if args.output:
	savefig(args.output)
else:
	show()
close()

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
	if isinstance(val, float) or isinstance(val, int):
		return val

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

	y = [ x * timestep for x in range(x_begin, x_end) ]
	plot(y, vector[begin:end], color='blue')

parser = argparse.ArgumentParser(conflict_handler='resolve')
parser.add_argument('-w', '--width', type=str, required=True,
	help="Plot width in seconds")
parser.add_argument('-v', '--vector', type=str, required=True,
	help="Spice vector to plot")
parser.add_argument('input', type=argparse.FileType('rb'),
	help='Spice3f5 input file')
parser.add_argument('output', type=argparse.FileType('wb'), nargs='?',
	help='Plot output file')
parser.add_argument('-s', '--start', default='0', type=str,
	help='First manual trigger (default: %(default)s)')
parser.add_argument('-p', '--period', type=str,
	help='Manual trigger period')
parser.add_argument('-r', '--rising-trigger', type=str, nargs=2,
	help="Auto rising trigger <vector> <voltage>")
parser.add_argument('-f', '--falling-trigger', type=str, nargs=2,
	help="Auto falling trigger <vector> <voltage>")
parser.add_argument('-h', '--hysteresis', default='0', type=str,
	help='Auto trigger voltage hysteresis (default: %(default)s)')

args = parser.parse_args()
vectors = spice_read.spice_read(args.input).get_plots()[0]
vector = get_vector(vectors, args.vector)
time = vectors.get_scalevector().get_data()
timestep = time[1]
end_time = time[-1] + timestep

width = parse_num(args.width)
steps = int(width / timestep)
start = parse_num(args.start)

xlim(-width / 2, width / 2)

if args.period:
	period = parse_num(args.period)
	center = start
	while center < end_time:
		plot_at(vector, int(center / timestep), timestep, steps)
		center += period
else:
	hyst = parse_num(args.hysteresis)
	fvect = None
	rvect = None
	if args.falling_trigger:
		fvect = get_vector(vectors, args.falling_trigger[0])
		fv = parse_num(args.falling_trigger[1])
		fstate = fvect[0] <= fv
	if args.rising_trigger:
		rvect = get_vector(vectors, args.rising_trigger[0])
		rv = parse_num(args.rising_trigger[1])
		rstate = rvect[0] >= rv
	both = False
	if len(fvect) and len(rvect):
		both = args.rising_trigger[0] == args.falling_trigger[0]
	idx = 0
	while idx < len(time):
		curr = int(idx + start / timestep)
		if both:
			if (rstate and fvect[idx] <= fv) or (not rstate and rvect[idx] >= rv):
				rstate = not rstate
				plot_at(vector, curr, timestep, steps)
		if len(fvect) and not both:
			print fstate, fv, vector[idx]
			if fstate and fvect[idx] > fv + hyst:
				fstate = False
			elif not fstate and fvect[idx] <= fv:
				fstate = True
				plot_at(vector, curr, timestep, steps)
		if len(rvect) and not both:
			print rstate, rv, rvect[idx]
			if rstate and vector[idx] < rv - hyst:
				rstate = False
			elif not rstate and rvect[idx] >= rv:
				rstate = True
				plot_at(vector, curr, timestep, steps)
		idx += 1


title(args.vector)
ylabel('Volts')
xlabel('Time (s)')

grid()
if args.output:
	savefig(args.output)
else:
	show()
close()

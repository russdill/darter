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


parser = argparse.ArgumentParser()
parser.add_argument('-p', '--period', type=str, required=True,
		help="Eye period")
parser.add_argument('-v', '--vector', type=str, required=True,
		help="Spice vector to process")
parser.add_argument('-s', '--start', default=0, type=str,
		help='Start offset, not counting overlap (default: %(default)s)')
parser.add_argument('-o', '--overlap', default=1.1, type=float,
		help='Overlap factor (default: %(default)s)')
parser.add_argument('input', type=argparse.FileType('rb'),
		help='Spice3f5 input file')
parser.add_argument('output', type=argparse.FileType('wb'), nargs='?',
		help='Plot output file')

args = parser.parse_args()
vectors = spice_read.spice_read(args.input).get_plots()[0]
vector = filter(lambda vect: vect.name == args.vector, vectors.get_datavectors())[0].get_data()
time = vectors.get_scalevector().get_data()
timestep = time[1]
end_time = time[-1] + timestep

period = parse_num(args.period)
start = parse_num(args.start)
width = period * args.overlap
pre = period * (args.overlap - 1) / 2

curr = start - pre
while curr < end_time:
	first = int(curr / timestep)
	last = int((curr + width) / timestep)
	x_start = 0
	x_last = last - first
	if first < 0:
		x_start -= first
		first = 0
	if last > len(vector):
		x_last -= last - len(vector)
		last = len(vector)
	plot(time[x_start:x_last], vector[first:last], color='blue')
	curr += period;

ylabel('Volts')
xlabel('Time (s)')

grid()
if args.output:
	savefig(args.output)
else:
	show()
close()

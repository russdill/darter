#!/usr/bin/env python3
#
#  plot.py
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
	return [vect for vect in vectors.get_datavectors() if vect.name == n][0].get_data()

parser = argparse.ArgumentParser(conflict_handler='resolve')
parser.add_argument('-w', '--width', type=float, required=False,
	help="Plot width in pixels")
parser.add_argument('-h', '--height', type=float, required=False,
	help="Plot height in pixels")
parser.add_argument('-X', '--xmax', type=str, required=False,
	help="X axis max dimension")
parser.add_argument('-x', '--xmin', type=str, required=False,
	help="X axis min dimension")
parser.add_argument('-Y', '--ymax', type=str, required=False,
	help="Y max axis dimension")
parser.add_argument('-y', '--ymin', type=str, required=False,
	help="Y min axis dimension")
parser.add_argument('-c', '--color', type=str, required=False,
	help="Color", default='blue')
parser.add_argument('-v', '--vector', type=str, required=True,
	help="Spice vector to plot")
parser.add_argument('input', type=argparse.FileType('r'),
	help='Spice3f5 input file')
parser.add_argument('output', type=argparse.FileType('wb'), nargs='?',
	help='Plot output file')

args = parser.parse_args()

if (args.width is None) != (args.height is None):
	raise Exception("Width and height mest be defined together")

vectors = spice_read.spice_read(args.input).get_plots()[0]
vector = get_vector(vectors, args.vector)
time = vectors.get_scalevector().get_data()
timestep = time[1] - time[0]
end_time = time[-1] + timestep

plot(time, vector, color=args.color, linewidth=2)

if args.xmin or args.xmax:
	xlim(parse_num(args.xmin), parse_num(args.xmax))
if args.ymin or args.ymax:
	ylim(parse_num(args.ymin), parse_num(args.ymax))

if args.width:
	dpi = gcf().get_dpi()
	gcf().set_size_inches(args.width*1.295/dpi, args.height*1.25/dpi)

if args.output:
	savefig(args.output, dpi=gcf().get_dpi(), transparent=True)
else:
	show()
close()


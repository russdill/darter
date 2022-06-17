#!/usr/bin/env python3
#
#  gen_dat.py - Generate d_source tabular data from simplified input
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
#
#
# The ngspice d_source reads data from a file with a repeatative format:
#
# <time> <node0> <node1> <node2> ....
#
# At each time unit, the value of each node must be listed. gen_dat.py
# allows each line to only contain nodes that have changed:
#
# <abs time|+offset> [<nodename>=<val>]* [~<nodenome>]*
#
# The first line must contain all nodenames and their initial values.
#
# 0	ab=0 bc=1 ee=0 tc=0
# +5n	ab=1
# +10n	~bc
# 20n	tc=1
#
# Would output:
#
# * t		ab	bc	ee	tc
# 0.0		0s	1s	0s	0s
# 5e-09		1s	1s	0s	0s
# 1.5e-08	1s	0s	0s	0s
# 2e-08		1s	0s	0s	1s
#
# Note that the nodenames do not actually make it into the output.

import sys
import math
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

def parse_dig(val):
	if len(val) == 1:
		val += 's'

	if not val[0] in '01U' or not val[1] in 'srzu' or len(val) > 2:
		raise Exception('{} not valid'.format(val))

	return val

if len(sys.argv) > 1 and sys.argv[1] != '-':
	sys.stdin = open(sys.argv[1], 'r', encoding='utf-8')

if len(sys.argv) > 2 and sys.argv[2] != '-':
	sys.stdout = open(sys.argv[2], 'w', encoding='utf-8')

vars = dict()
order = list()
first = True
now = 0

for line in sys.stdin:
	line, _, _ = line.partition('#')
	line, _, _ = line.partition('*')
	line, _, _ = line.partition('//')
	line = line.strip()
	if len(line) == 0:
		continue
	items = line.split()
	time = items[0]
	for item in line.split()[1:]:
		if item[0] == '~':
			var = item[1:]
			val = vars[var]
			if val[0] == '0':
				val = '1' + val[1]
			elif val[0] == '1':
				val = '0' + val[1]
			vars[var] = val
		else:
			var, _, val = item.partition('=')
			vars[var] = parse_dig(val);
		if first and var not in order:
			order.append(var)
	if first:
		out = '{:12}'.format('* t')
		for var in order:
			out += ' {{:{}}}'.format(len(var)).format(var)
		print(out)
		first = False
	if time[0] == '+':
		now += parse_num(time[1:])
	else:
		now = parse_num(time)
	out = '{:<12}'.format(now)
	for var in order:
		out += ' {{:{}}}'.format(len(var)).format(vars[var])
	print(out)


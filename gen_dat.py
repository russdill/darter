#!/usr/bin/env python
#
#  gen_dat.py
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
	sys.stdin = open(sys.argv[1], 'rb')

if len(sys.argv) > 2 and sys.argv[2] != '-':
	sys.stdout = open(sys.argv[2], 'wb')

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
		out = '* t\t'
		for var in order:
			out += '\t{}'.format(var)
		print out
		first = False
	if time[0] == '+':
		now += parse_num(time[1:])
	else:
		now = parse_num(time)
	out = '{}\t'.format(now)
	for var in order:
		out += '\t{}'.format(vars[var])
	print out

#!/usr/bin/env python3
#
#  gen_stream.py
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

import sys
import argparse
from struct import unpack

def parse(item, state, prev):
	if 'x' in item:
		bits = (len(item) - 2) * 4
		item = '{{:0{}b}}'.format(bits).format(int(item, 16))
	for c in item:
		if prev:
			print('{} {}s -> {}'.format(state, prev, state + 1))
			state += 1
		prev = c
	return state, prev


parser = argparse.ArgumentParser()
parser.add_argument('-t', '--text-input', type=argparse.FileType('r'))
parser.add_argument('-b', '--binary-input', type=argparse.FileType('rb'))
parser.add_argument('-o', '--output', type=argparse.FileType('w'))
parser.add_argument('data', nargs='*', type=str)
args = parser.parse_args()

state = 0
prev = None

if args.output:
	sys.stdout = args.output

if args.text_input:
	for line in args.text_input:
		line, _, _ = line.partition('#')
		line, _, _ = line.partition('*')
		line, _, _ = line.partition('//')
		line = line.strip()
		if len(line) == 0:
			continue
		for item in line.split():
			state, prev = parse(item, state, prev)

elif args.binary_input:
	byte = args.binary_input.read(1)
	while byte:
		item = unpack('B', byte)[0]
		state, prev = parse('{:08b}'.format(item), state, prev)
		byte = args.binary_input.read(1)
elif args.data:
	for item in args.data:
		state, prev = parse(item, state, prev)

else:
	parser.print_help()

if prev:
	print('{} {}s -> {}'.format(state, prev, 0))

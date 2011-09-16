#!/usr/bin/env python
#
#  darter.py - Process IBIS models into SPICE models.
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
from string import Template
from string import maketrans
from scipy.interpolate import interp1d
from scipy.misc import derivative

# table of sections
supported_sections = set([
	'.ibis_ver',
	'.file_name',
	'.file_rev',
	'.date',
	'.source',
	'.notes',
	'.disclaimer',
	'.copyright',
	'.component',
	'.component.package_model',
	'.component.package',
	'.component.manufacturer',
	'.component.pin',
	'.model_selector',
	'.model',
	'.model.model_spec',
	'.model.add_submodel',
	'.model.voltage_range',
	'.model.pullup_reference',
	'.model.pulldown_reference',
	'.model.power_clamp_reference',
	'.model.gnd_clamp_reference',
	'.model.pulldown',
	'.model.pullup',
	'.model.gnd_clamp',
	'.model.power_clamp',
	'.model.rgnd',
	'.model.rpower',
	'.model.rac',
	'.model.cac',
	'.model.rising_waveform',
	'.model.falling_waveform',
	'.submodel',
	'.submodel.submodel_spec',
	'.submodel.power_pulse_table',
	'.submodel.gnd_pulse_table',
	'.submodel.gnd_clamp',
	'.submodel.power_clamp',
	'.define_package_model',
	'.define_package_model.manufacturer',
	'.define_package_model.oem',
	'.define_package_model.description',
	'.define_package_model.number_of_pins',
	'.define_package_model.pin_numbers',
	'.define_package_model.model_data',
	'.define_package_model.model_data.resistance_matrix',
	'.define_package_model.model_data.resistance_matrix.bandwidth',
	'.define_package_model.model_data.resistance_matrix.row',
	'.define_package_model.model_data.inductance_matrix',
	'.define_package_model.model_data.inductance_matrix.bandwidth',
	'.define_package_model.model_data.inductance_matrix.row',
	'.define_package_model.model_data.capacitance_matrix',
	'.define_package_model.model_data.capacitance_matrix.bandwidth',
	'.define_package_model.model_data.capacitance_matrix.row',
	'.define_package_model.model_data.end_model_data',
	'.define_package_model.end_package_model',
	'.begin_board_description',
	'.begin_board_description.manufacturer',
	'.begin_board_description.number_of_pins',
	'.begin_board_description.pin_list',
	'.begin_board_description.path_description',
	'.begin_board_description.end_board_description',
	'.end'
])

ignored_sections = set([
	'.comment_char',
	'.component.package_model.alternate_package_models',
	'.component.package_model.alternate_package_models.end_alternate_package_models',
	'.component.pin_mapping',
	'.component.diff_pin',
	'.component.series_pin_mapping',
	'.component.series_switch_groups',
	'.component.node_declarations',
	'.component.node_declarations.end_node_declarations',
	'.component.circuit_call',
	'.component.circuit_call.end_circuit_call',
	'.component.begin_emi_component',
	'.component.begin_emi_component.pin_emi',
	'.component.begin_emi_component.pin_domain_emi',
	'.component.begin_emi_component.end_emi_component',
	'.model.ttgnd',
	'.model.ttpower',
	'.model.receiver_thresholds',
	'.model.temperature_range',
	'.model.external_reference',
	'.model.isso_pu',
	'.model.isso_pd',
	'.model.ramp',
	'.model.rising_waveform.composite_current',
	'.model.falling_waveform.composite_current',
	'.model.test_data',
	'.model.test_data.rising_waveform_near',
	'.model.test_data.falling_waveform_near',
	'.model.test_data.rising_waveform_far',
	'.model.test_data.falling_waveform_far',
	'.model.test_data.diff_rising_waveform_near',
	'.model.test_data.diff_falling_waveform_near',
	'.model.test_data.diff_rising_waveform_far',
	'.model.test_data.diff_falling_waveform_far',
	'.model.test_data.test_load',
	'.begin_board_description.reference_designator_map',
])

unsupported_sections = set([
	'.model.driver_schedule',
	'.model.r_series',
	'.model.l_series',
	'.model.rl_series',
	'.model.c_series',
	'.model.lc_series',
	'.model.rc_series',
	'.model.series_current',
	'.model.series_mosfet',
	'.model.on',
	'.model.on.r_series',
	'.model.on.l_series',
	'.model.on.rl_series',
	'.model.on.c_series',
	'.model.on.lc_series',
	'.model.on.rc_series',
	'.model.on.series_current',
	'.model.on.series_mosfet',
	'.model.off',
	'.model.off.r_series',
	'.model.off.l_series',
	'.model.off.rl_series',
	'.model.off.c_series',
	'.model.off.lc_series',
	'.model.off.rc_series',
	'.model.off.series_current',
	'.model.off.series_mosfet',
	'.model.external_model',
	'.model.external_model.end_external_model',
	'.model.algorithmic_model'
	'.model.algorithmic_model.end_algorithmic_model'
	'.model.begin_emi_model.end_emi_model'
	'.submodel.pulldown',
	'.submodel.pullup',
	'.submodel.ramp',
	'.submodel.rising_waveform',
	'.submodel.falling_waveform',
	'.external_circuit',
	'.external_circuit.end_external_circuit',
	'.define_package_model.number_of_sections',
])

sections = frozenset(supported_sections | unsupported_sections | ignored_sections)

# Parse IBIS number to float
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

def parse_matrix(matrix, pin_forward, pin_reverse):
	rows = dict()

	type = matrix.header.lower()
	if type == 'banded_matrix' or type == 'full_matrix':
		for row in matrix.sections['row']:
			pin = row.header
			curr_row = dict()
			idx = pin_reverse[pin]
			vals = []
			for line in row.data:
				vals += line
			for val in vals:
				curr_row[pin_forward[idx]] = parse_num(val)
				idx += 1
				if idx == len(pin_forward):
					idx = 0
			rows[pin] = curr_row

	elif type == 'sparse_matrix':
		for row in matrix.sections['row']:
			pin = row.header
			curr_row = dict()
			for sub_pin, val in row.param.iteritems():
				curr_row[sub_pin] = parse_num(val)
			rows[pin] = curr_row

	else:
		raise Exception('Unknown matrix type')

	return rows

def parse_values(line):
	line = [v for v in line if v != '=']
	args = []
	for item in line:
		for a in item.split('='):
			if a:
				args.append(a)
	return dict(zip(args[0::2], [parse_num(v) for v in args[1::2]]))

# Print out a SPICE param
def param(n, val):
	print '.param {}={}'.format(n, parse_num(val))

def range_list(row, invert):
	typ, rmin, rmax = row
	if rmin == 'NA':
		rmin = typ
	if rmax == 'NA':
		rmax = typ
	typ = parse_num(typ)
	rmin = parse_num(rmin)
	rmax = parse_num(rmax)
	if (rmin > rmax) != invert:
		rmin, rmax = rmax, rmin
	return typ, rmin, rmax

# Print out a SPICE param that can vary between typ, min, and max based on spec
# The function ensures that min is less then max if invert is false,
# and max is less then min otherwise.
def range_param(n, row, invert):
	typ, min, max = range_list(row, invert)
	print '.param {}={{modv({}, {}, {})}}'.format(n, typ, min, max)

def parse_tbl_model(name, sections):
	ret = []
	if name in sections:
		for i, tbl in enumerate(sections[name]):
			data = [ [], [], [], [] ]

			for idx, row in enumerate(tbl.data):
				if row[2] == 'NA':
					tbl.data[idx][2] = row[1]
				if row[3] == 'NA':
					tbl.data[idx][3] = row[1]

			# The 'NA' rules are rather annoying and require interpolating
			# between points, we just do a linear interpolation
			for s in [ 1, 2, 3 ]:
				for idx, row in enumerate(tbl.data):
					if row[s] != 'NA':
						nv = parse_num(row[0])
						ni = parse_num(row[s])
						back = idx - 1
						while tbl.data[back][s] == 'NA':
							v = parse_num(tbl.data[back][0])
							tbl.data[back][s] = li + (ni - li) * (v - lv) / (nv - lv)
							back -= 1
						lv = nv
						li = ni

			last = None
			for row in tbl.data:
				num = parse_num(row[0])
				if last != None and num <= last:
					raise Exception('Non ascending')
				last = num
				for j in 0, 1, 2, 3:
					data[j].append(parse_num(row[j]))
			ret.append(data)
	else:
		ret.append([ [0, 1], [0, 0], [0, 0], [0, 0] ])
	return ret

# Print out a series of max x .params for tabular data
# Return a set of strings that can be used to emit
# a pwl B-source based on the table of data.
def dump_tbl_models(name, table):
	maxval = 0
	ret = dict()
	if table:
		for n, tbl in enumerate(table):
			for i, type in enumerate([ 'typ', 'min', 'max' ]):
				data = ''.join(map(lambda x, y: '\n+    ,{},{}'.format(x, y), tbl[0], tbl[i + 1]))
				ret['{}{}_{}'.format(name, n, type)] = data
			maxval = max(maxval, max(tbl[0]))
	else:
		for type in [ 'typ', 'min', 'max' ]:
			ret['{}0_{}'.format(name, type)] = ', 0, 0, 1, 0'

	# Maximum x value, useful for time based tables.
	param('{}_max'.format(name), maxval)

	return ret

# Make the IV functions extend out from -100 to 100
def interp_iv(_x, _y):
	x, y = list(_x), list(_y)
	x_min, x_max = -100, 100
	if x_min < _x[0]:
		y.insert(0, (_x[0] - x_min) * (_y[1] - _y[0]) / (_x[1] - _x[0]))
		x.insert(0, x_min)
	if x_max > _x[-1]:
		y.append((x_max -_x[-1]) * (_y[-2] - _y[-1]) / (_x[-2] - _x[-1]))
		x.append(x_max)
	return interp1d(x, y, kind=1)

# Make the waveform extent out far enough to take the derivative at endpoints
def interp_wfm(_x, _y):
	x, y = list(_x), list(_y)
	x.insert(0, 2 * _x[0] - _x[1])
	x.append(2 * _x[-1] - _x[-2])
	y.insert(0, _y[0])
	y.append(_y[-1])
	return interp1d(x, y, kind='cubic')

def fixture(refs, data, nfixtures):
	ret = dict()
	pd = [lambda x: 0] * 3
	pu = [lambda x: 0] * 3
	gc = [lambda x: 0] * 3
	pc = [lambda x: 0] * 3
	for i in range(3):
		pc[i] = interp_iv(data['power_clamp'][0][0], data['power_clamp'][0][i + 1])
		gc[i] = interp_iv(data['gnd_clamp'][0][0], data['gnd_clamp'][0][i + 1])
		pu[i] = interp_iv(data['pullup'][0][0], data['pullup'][0][i + 1])
		pd[i] = interp_iv(data['pulldown'][0][0], data['pulldown'][0][i + 1])
	for name in [ 'rising', 'falling' ]:
		waveform = data[name + '_waveform']
		time = set()
		for n in range(nfixtures):
			time = time | set(waveform[n][0])
		time = list(time)
		time.sort()

		kpu = None
		kpd = None
		if nfixtures > 1:
			kpu = [ time, [], [], [] ]
			kpd = [ time, [], [], [] ]

		for i in range(3):
			c_comp = []
			wfm = []
			for n in range(nfixtures):
				c_comp.append(refs['c_comp'][i] + refs['C_fixture'][n])
				wfm.append(interp_wfm(waveform[n][0], waveform[n][i + 1]))

			curr_x = list()
			last_dx = list()
			dx = list()
			next_x = list()
			idx = list()
			for n in range(nfixtures):
				curr_x.append(waveform[n][0][0])
				last_dx.append(float("inf"))
				dx.append(0)
				next_x.append(0)
				idx.append(0)
			for t in time:
				Ifx = []
				Ipu = []
				Ipd = []
				for n in range(nfixtures):
					y = wfm[n](t)
					I = (refs['V_fixture'][n][i] - y) / refs['R_fixture'][n]
					if math.isnan(I):
						raise Exception('I')
					Igc = gc[i](y - refs['gnd_clamp'][i])
					Ipc = pc[i](refs['power_clamp'][i] - y)

					# Don't put dx past the next or prev time point
					while idx[n] < len(waveform[n][0]) and waveform[n][0][idx[n]] <= t:
						dx = None
						idx[n] += 1
					if not dx:
						if idx[n] < len(waveform[n][0]):
							next_x[n] = waveform[n][0][idx[n]]
							next_dx = next_x[n] - curr_x[n]
						dx = min(next_dx, last_dx[n]) / 2
						last_dx[n] = next_dx
						curr_x[n] = next_x[n]

					Icomp = derivative(wfm[n], t, dx=dx) * c_comp[n]
					Ifx.append(I - (Igc + Ipc + Icomp))
					Ipu.append(pu[i](refs['pullup'][i] - y))
					Ipd.append(pd[i](y - refs['pulldown'][i]))
				if nfixtures > 1:
					denom = Ipd[1] * Ipu[0] - Ipd[0] * Ipu[1]
					kpu[i + 1].append((Ifx[0] * Ipd[1] - Ifx[1] * Ipd[0]) / denom)
					kpd[i + 1].append((Ifx[1] * Ipu[0] - Ifx[0] * Ipu[1]) / denom)
				else:
					if not kpu and not kpd:
						if Ipu[0] != 0 and Ipd[0] != 0:
							raise Exception('Insufficient waveforms for fixture')
						elif Ipu[0] != 0:
							isos = True
							kpu = [ time, [], [], [] ]
							kpd = [[0, 1], [0, 0], [0, 0], [0, 0]]
						elif Ipd[0] != 0:
							isos = False
							kpu = [[0, 1], [0, 0], [0, 0], [0, 0]]
							kpd = [ time, [], [], [] ]
						else:
							raise Exception('Too many waveforms for fixture')
					if isos:
						kpu[i + 1].append(Ifx[0] / Ipu[0])
					else:
						kpd[i + 1].append(Ifx[0] / Ipd[0])
		ret[name + '_kpu'] = [ kpu ]
		ret[name + '_kpd'] = [ kpd ]
	return ret

def ibis_translate(str):
	str = str.translate(maketrans('<>', '__'))
	str = str.translate(maketrans('#', 'c'))
	return str

# Convert a SPICE include file, substituting $<var> for vars in 'tables'
def include(lib, tables):
	print Template(open(lib, 'rb').read()).substitute(tables)

# An IBIS section, eg, '[Model]'
class section:
	def __init__(self):
		self.sections = dict()		# Sub-sections
		self.name = ''			# String in []
		self.header = ''		# Text after []
		self.columns = []		# Text after [] broken into list
		self.text = []		# list of all lines, including header
		self.lines = []		# list of all lines, excluding header
		self.data = []		# list of all lines, not including header broken into words
		self.param = dict()		# dict of strings '<str> [=] <text....>'
		self.param_row = dict()		# dict of lists '<str> <item0> <item1> <item2>...'
		self.param_vert = dict()	# dict of dict, similar to param_row, but indexed by column name
		self.parent = None		# Parent section
		self.unsupported = False	# True if this section is unsupported or contains an unsupported section

# Pick typ, min, max based on spec -1, 0, 1
modv_func = '.func modv(typ, minv, maxv) {ternary_fcn(spec > 0, maxv, ternary_fcn(spec < 0, minv, typ))} '

# IBIS parser
main = section()

curr_sect = main
curr_key = ''

infile = sys.argv[1]
outfile = sys.argv[2]

sys.stdout = open(outfile, 'wb')

already_ignored = set()

file = open(infile, 'rb')
for line in file:
	# Ignore comment only lines
	if len(line) and line[0] == '|':
		continue

	# Strip off comment text
	line, _, _ = line.partition('|')

	# Is this a new section?
	if len(line) and line[0] == '[':
		name, _, line = line[1:].partition(']')
		line = line.strip()	
		key = name.replace(' ', '_').lower()

		# Find it in the sections set. First assume it is a child of the
		# current section, and then work up through parents
		while not '{}.{}'.format(curr_key, key) in sections:
			if curr_sect.parent != None:
				curr_sect = curr_sect.parent
				curr_key, _, _ = curr_key.rpartition('.')
			else:
				raise Exception('Could not find [{}]'.format(name))

		# Initialize new section
		curr_key = '{}.{}'.format(curr_key, key)
		new_section = section()
		new_section.parent = curr_sect
		new_section.header = line.strip()
		new_section.columns = line.split()
		new_section.name = name
		if not key in curr_sect.sections:
			curr_sect.sections[key] = []
		curr_sect.sections[key].append(new_section)
		curr_sect = new_section

		if curr_key in ignored_sections and not curr_key in already_ignored:
			print >> sys.stderr, 'Warning: {} is ignored'.format(curr_key)
			already_ignored.add(curr_key)
		elif curr_key in unsupported_sections:
			iter = curr_sect
			while iter != None:
				if not iter.unsupported and iter.parent != None:
					print >> sys.stderr, 'Error: Unsupported section {} in {}'.format(name, curr_key)
				iter.unsupported = True
				iter = iter.parent

	else:
		line = line.strip()

		if len(line):
			curr_sect.lines.append(line)

		if '=' in line:
			key, _, val = line.partition('=')
			curr_sect.param[key.strip()] = val.strip()

		elif len(line):
			row = line.split()
			curr_sect.data.append(row)
			curr_sect.param_row[row[0]] = row[1:]

			vert = dict()
			for n, item in enumerate(row[1:]):
				if n < len(curr_sect.columns):
					vert[curr_sect.columns[n]] = item
			curr_sect.param_vert[row[0]] = vert
			row = line.split(None, 1)
			if len(row) > 1:
				curr_sect.param[row[0]] = row[1]


	curr_sect.text.append(line.strip())

# Prune unsupported sections
for name, sect in main.sections.iteritems():
	for item in sect:
		if item.unsupported:
			sect.remove(time)

print '* Generated by darter.py'

# Print out header information
for n in [ 'ibis_ver', 'file_name', 'file_rev', 'date',
           'source', 'notes', 'disclaimer', 'copyright' ]:
	if n in main.sections:
		if len(main.sections[n][0].text) > 1:
			print '* {}:'.format(main.sections[n][0].name)
			for line in main.sections[n][0].text:
				print '* {}'.format(line)
			print '*'
		else:
			print '* {}: {}'.format(main.sections[n][0].name, main.sections[n][0].header)

package_models = dict()

for model in main.sections['define_package_model'] if 'define_package_model' in main.sections else []:


	if not 'pin_numbers' in model.sections:
		# Error: Missing data...
		continue

	if not 'model_data' in model.sections:
		# Error: Missing data...
		continue

	pin_forward = []
	for line in model.sections['pin_numbers'][0].data:
		pin_forward += line
	pin_reverse = dict()
	for idx, pin in enumerate(pin_forward):
		pin_reverse[pin] = idx

	data = model.sections['model_data'][0]

	if 'resistance_matrix' in data.sections:
		r_data = parse_matrix(data.sections['resistance_matrix'][0],
			pin_forward, pin_reverse)
	if 'inductance_matrix' in data.sections:
		l_data = parse_matrix(data.sections['inductance_matrix'][0],
			pin_forward, pin_reverse)
	if 'capacitance_matrix' in data.sections:
		c_data = parse_matrix(data.sections['capacitance_matrix'][0],
			pin_forward, pin_reverse)

	pm = dict()
	for pin in pin_forward:
		tmp = dict()
		tmp['R'] = r_data[pin][pin]
		tmp['L'] = l_data[pin][pin]
		tmp['C'] = c_data[pin][pin]
		pm[pin] = tmp
	package_models[model.header] = pm

# Build a dict of sets that represents the model selector table
model_selector = dict()
for model in main.sections['model_selector'] if 'model_selector' in main.sections else []:
	models = set()
	for name, desc in model.param.iteritems():
		models.add(name)
	model_selector[model.header] = models

# Process each model
for model in main.sections['model'] if 'model' in main.sections else []:
	Vinl, Vinh = None, None

	type = model.param['Model_type']

	# Select what circuits we need and what pins we need
	libs = [ 'ibis_buffer' ]
	pins = None
	en = None
	out = None
	nfixtures = 0

	if type == 'Input': # 4
		pins = 'in'
		en = 'pulldown'
		libs.append('ibis_input')
		Vinl, Vinh = 0.8, 2.0
	elif type == 'I/O': # 8
		pins = 'vdd vss en out in'
		libs.append('ibis_input')
		libs.append('ibis_output')
		nfixtures = 2
		Vinl, Vinh = 0.8, 2.0
	elif type == 'I/O_open_drain' or type == 'I/O_open_sink': # 7
		pins = 'vdd vss en in'
		out = 'pulldown'
		libs.append('ibis_input')
		libs.append('ibis_output')
		nfixtures = 1
		Vinl, Vinh = 0.8, 2.0
	elif type == 'I/O_open_source': # 7
		pins = 'vdd vss en in'
		out = 'pullup'
		libs.append('ibis_input')
		libs.append('ibis_output')
		nfixtures = 1
		Vinl, Vinh = 0.8, 2.0
#	elif type == 'Input_ECL':
#	elif type == 'I/O_ECL':
	elif type == 'Terminator': # 3
		libs.append('ibis_terminator')
		en = 'pulldown'
	elif type == 'Output': # 6
		pins = 'vdd vss out'
		en = 'pullup'
		libs.append('ibis_output')
		nfixtures = 2
	elif type == '3-state': # 7
		pins = 'vdd vss en out'
		libs.append('ibis_output')
		nfixtures = 2
	elif type == 'Open_sink' or type == 'Open_drain': # 6
		pins = 'vdd vss en'
		out = 'pulldown'
		libs.append('ibis_output')
		nfixtures = 1
	elif type == 'Open_source': # 6
		pins = 'vdd vss en'
		out = 'pullup'
		libs.append('ibis_output')
		nfixtures = 1
#	elif type == 'Input_ECL':
#	elif type == 'Output_ECL':
#	elif type == 'I/O_ECL':
#	elif type == '3-state_ECL':
#	elif type == 'Series':
#	elif type == 'Series_switch':
#	elif type == 'Input_diff':
#	elif type == 'Output_diff':
#	elif type == 'I/O_diff':
#	elif type == '3-state_diff':
	else:
		print '* Unhandled model type: {}'.format(type)
		continue

	defaults = dict()
	if Vinl != None:
		defaults['Vinl'] = 0.8
	if Vinh != None:
		defaults['Vinh'] = 2.0

	print '.lib {}'.format(ibis_translate(model.header))
	print '* type - {}'.format(type)

	for sect in model.sections['add_submodel'] if 'add_submodel' in model.sections else []:
		for key, mode in sect.param.iteritems():
			print '.lib {} {}'.format(outfile, ibis_translate(key))

	if pins == None:
		pins=''
	else:
		pins += ' '
	print '.subckt {} pad vcc vee {}spec=0'.format(ibis_translate(model.header), pins)
	print '.model pullup d_pullup(load=0)'
	print '.model pulldown d_pulldown(load=0)'
	print '.model inv d_inverter(rise_delay=1f fall_delay=1f input_load=0)'
	if en != None:
		print 'A_en en {}'.format(en)
	if out != None:
		print 'A_out out {}'.format(out)
	print 'A_not_en en not_en inv'
	print 'A_always_hi always_hi pullup'
	print modv_func

	model_spec = None
	if 'model_spec' in model.sections:
		model_spec = model.sections['model_spec'][0]
	for n in 'Vinl', 'Vinh', 'Vmeas':
		if model_spec and n in model_spec.param_row:
			range_param(n, model_spec.param_row[n], False)
		elif n in model.param:
			param(n, model.param[n])
		elif n in defaults:
			param(n, defaults[n])

	need_c_comp = True
	c_comp_total = [ 0, 0, 0 ]
	for n in [ 'C_comp_pullup', 'C_comp_pulldown',
                   'C_comp_power_clamp', 'C_comp_gnd_clamp' ]:
		if n in model.param_row:
			range_param(n, model.param_row[n], True)
			typ, rmin, rmax = range_list(model.param_row[n], True)
			c_comp_total[0] += typ
			c_comp_total[1] += rmin
			c_comp_total[2] += rmax
			need_c_comp = False
		else:
			param(n, '0')

	# Set C_comp to zero if broken out value is available
	if need_c_comp and 'C_comp' in model.param_row:
		range_param('C_comp', model.param_row['C_comp'], True)
		typ, rmin, rmax = range_list(model.param_row['C_comp'], True)
		c_comp_total[0] = typ
		c_comp_total[1] = rmin
		c_comp_total[2] = rmax
	else:
		param('C_comp', '0')

	refs = dict()
	refs['c_comp'] = c_comp_total

	for n in [ 'rgnd', 'rpower', 'rac' ]:
		if n in model.sections:
			range_param(n, model.sections[n][0].columns, False)
		else:
			param(n, '1e18')

	if 'cac' in model.sections:
		range_param('cac', model.sections['cac'][0].columns, True)
	else:
		param('cac', '0')

	for n in [ 'gnd_clamp', 'pulldown', 'external' ]:
		full = n + '_reference'
		if full in model.sections:
			refs[n] = range_list(model.sections[full][0].columns, True)
		else:
			refs[n] = [ 0, 0, 0 ]

	if 'voltage_range' in model.sections:
		vrange = model.sections['voltage_range'][0].columns
	else:
		vrange = None

	for n in [ 'power_clamp', 'pullup' ]:
		full = n + '_reference'
		if full in model.sections:
			refs[n] = range_list(model.sections[full][0].columns, False)
		elif vrange != None:
			refs[n] = range_list(vrange, False)
		else:
			raise Exception('Missing [voltage_range] and [{}]'.format(full))

	for n in [ 'rising_waveform', 'falling_waveform' ]:
		if n in model.sections:
			for i, tbl in enumerate(model.sections[n]):
				for f in [ 'R_fixture', 'C_fixture' ]:
					if not f in refs:
						refs[f] = []
					if f in tbl.param:
						refs[f].append(parse_num(tbl.param[f]))
					else:
						refs[f].append(0)
				if not 'V_fixture' in refs:
					refs['V_fixture'] = []
				if 'V_fixture' in tbl.param:
					typ = tbl.param['V_fixture']
					vmin, vmax = typ, typ
					if 'V_fixture_min' in tbl.param:
						vmin = tbl.param['V_fixture_min']
					if 'V_fixture_max' in tbl.param:
						vmax = tbl.param['V_fixture_max']
					refs['V_fixture'].append(range_list([typ, vmin, vmax], False))
				else:
					refs['V_fixture'].append([0, 0, 0])
				for f in [ 'L_fixture', 'R_dut', 'L_dut', 'C_dut' ]:
					if f in tbl.param:
						print >> sys.stderr, 'Error: {} not supported in {}'.format(f, model.name)
			# FIXME: We silently ignore non-matching fixtures
			break

	data = dict()
	for n in [ 'pulldown', 'pullup', 'gnd_clamp', 'power_clamp' ]:
		data[n] = parse_tbl_model(n, model.sections)

	if nfixtures > 0:
		fixture_data = dict()
		for n in [ 'rising_waveform', 'falling_waveform' ]:
			fixture_data[n] = parse_tbl_model(n, model.sections)
		fixture_data.update(data)
		data.update(fixture(refs, fixture_data, nfixtures))

	tables = dict()
	for name, tbl in data.iteritems():
		tables.update(dump_tbl_models(name, tbl))

	# Include necessary circuits
	for lib in libs:
		include('{}.inc'.format(lib), tables)

	# Include necessary submodel circuits
	for sect in model.sections['add_submodel'] if 'add_submodel' in model.sections else []:
		for key, mode in sect.param.iteritems():
			if mode == 'Non-Driving':
				en = 'not_en'
			elif mode == 'Driving':
				en = 'en'
			elif mode == 'All':
				en = 'always_hi'
			else:
				raise Exception('Unknown submodel mode: {}'.format(mode))

			print 'x_{} pad vcc vee vdd vss {} {} spec={{spec}}'.format(ibis_translate(key), en, ibis_translate(key))

	print '.ends {}'.format(ibis_translate(model.header))

	# Wrap subcircuit in a subcircuit with appropriate per pin component parasitics
	for comp in main.sections['component'] if 'component' in main.sections else []:
		name = comp.header.replace(' ', '_')
		print '.subckt {}_{} pad vcc vee {}spec=0'.format(ibis_translate(name), ibis_translate(model.header), pins)

		if 'manufacturer' in comp.sections:
			print '* Manufacturer: {}'.format(comp.sections['manufacturer'][0].header)

		pm = dict()
		if 'package_model' in comp.sections:
			name = comp.sections['package_model'][0].header
			if name in package_models:
				pm = package_models[name]

		print modv_func
		for prefix, inv in [ [ 'R', False ], [ 'C', True ], [ 'L', True ] ]:
			n = '{}_pkg'.format(prefix)
			if 'package' in comp.sections and n in comp.sections['package'][0].param_row:
				range_param(n, comp.sections['package'][0].param_row[n], inv)
			else:
				param(n, '0')

		print '.include ibis_pkg.inc'
		print 'x die vcc vee {}{} spec={{spec}}'.format(pins, ibis_translate(model.header))
		print '.ends {}_{}'.format(ibis_translate(name), ibis_translate(model.header))

		if 'pin' in comp.sections:
			for pin, vals in comp.sections['pin'][0].param_vert.iteritems():
				if not 'signal_name' in vals or not 'model_name' in vals:
					raise Exception('Invalid pin table in {}'.format(comp.header))
				elif vals['signal_name'] == 'NC' or vals['model_name'] == 'NC':
					continue
				elif vals['model_name'] == 'GND' or vals['model_name'] == 'POWER':
					continue
				elif vals['model_name'] == model.header:
					pass
				elif not vals['model_name'] in model_selector:
					continue
				elif not model.header in model_selector[vals['model_name']]:
					continue

				print '.subckt {}_{}_{} pad vcc vee {}spec=0'.format(
					ibis_translate(name), ibis_translate(model.header), ibis_translate(pin), pins)
				print '* {}'.format(vals['signal_name'])

				for prefix, inv in [ [ 'R', False ], [ 'C', True ], [ 'L', True ] ]:
					n = '{}_pin'.format(prefix)
					np = '{}_pkg'.format(prefix)
					if n in vals and vals[n] != 'NA':
						param(np, vals[n])
					elif pin in pm:
						param(np, pm[pin][prefix])
					elif 'package' in comp.sections and np in comp.sections['package'][0].param_row:
						range_param(np, comp.sections['package'][0].param_row[np], inv)
					else:
						param(n, '0')

				print modv_func
				print '.include ibis_pkg.inc'
				print 'x die vcc vee {}{} spec={{spec}}'.format(pins, ibis_translate(model.header))
				print '.ends {}_{}_{}'.format(
					ibis_translate(name), ibis_translate(model.header), ibis_translate(pin))

				print '.subckt {}_{}_{} pad vcc vee {}spec=0'.format(
					ibis_translate(name), ibis_translate(model.header), ibis_translate(vals['signal_name']), pins)
				print '* pin {}'.format(pin)

				for prefix, inv in [ [ 'R', False ], [ 'C', True ], [ 'L', True ] ]:
					n = '{}_pin'.format(prefix)
					np = '{}_pkg'.format(prefix)
					if n in vals and vals[n] != 'NA':
						param(np, vals[n])
					elif pin in pm:
						param(np, pm[pin][prefix])
					elif 'package' in comp.sections and np in comp.sections['package'][0].param_row:
						range_param(np, comp.sections['package'][0].param_row[np], inv)
					else:
						param(n, '0')

				print modv_func
				print '.include ibis_pkg.inc'
				print 'x die vcc vee {}{} spec={{spec}}'.format(pins, ibis_translate(model.header))
				print '.ends {}_{}_{}'.format(
					ibis_translate(name), ibis_translate(model.header), ibis_translate(vals['signal_name']))


	print '.endl'

# Create submodel subcircuits
for model in main.sections['submodel'] if 'submodel' in main.sections else []:

	print '.lib {}'.format(ibis_translate(model.header))
	type = model.param['Submodel_type']
	print '* type - {}'.format(type)

	table_names = [ 'gnd_clamp', 'power_clamp' ]
	if type == 'Dynamic_clamp':
		lib = 'ibis_dynamic_clamp'
		table_names.append('gnd_pulse_table')
		table_names.append('power_pulse_table')
#	elif type == 'Bus_hold':
#		lib = 'ibis_bus_hold'
#		table_names.append('pulldown')
#		table_names.append('pullup')
#		table_names.append('falling_waveform')
#		table_names.append('rising_waveform')
#	elif type == 'Fall_back':
#		lib = 'ibis_fall_back'
#		table_names.append('pulldown')
#		table_names.append('pullup')
#		table_names.append('falling_waveform')
#		table_names.append('rising_waveform')
	else:
		print '* Unhandled submodel type: {}'.format(type)
		print '.endl'
		continue

	print '.subckt {} pad vcc vee vdd vss en spec=0'.format(ibis_translate(model.header))

	print modv_func

	submodel_spec = None
	if 'submodel_spec' in model.sections:
		submodel_spec = model.sections['submodel_spec']
	for n in 'V_trigger_r', 'V_trigger_f', 'Off_delay':
		if submodel_spec and n in submodel_spec.param_row:
			range_param(n, submodel_spec.param_row[n], False)
		else:
			param(n, '0')

	tables = dict()
	for n in table_names:
		table = parse_tbl_model(n, model.sections)
		tables.update(dump_tbl_models(n, table))

	include('{}.inc'.format(lib), tables)

	print '.ends {}'.format(ibis_translate(model.header))
	print '.endl'

for board in main.sections['begin_board_description'] if 'begin_board_description' in main.sections else []:

	print '.lib {}'.format(ibis_translate(board.header))

	if 'manufacturer' in board.sections:
		print '* Manufacturer: {}'.format(board.sections['manufacturer'][0].header)

	pin_mapping = board.sections['pin_list'][0].param

	for path in board.sections['path_description']:
		if path.lines[0].split()[0] != 'Pin':
			raise Exception('First statement in path is not Pin')

		nodes = ''
		for line in path.data:
			if line[0] == 'Node':
				nodes += ' ' + line[1]

		pin_name = ''
		net = []
		last = []
		net.append(0)
		curr = 'net' + '_'.join([str(v) for v in net])
		nc = 0
		nr = 0
		nl = 0
		no = 0
		next = -1
		for line in path.lines:
			line = line.split()
			if line[0] == 'Fork':
				net.insert(0, next)
				last.append(curr)
			elif line[0] == 'Endfork':
				next = net[0]
				del net[0]
				curr = last.pop()
			elif line[0] == 'Node':
				node = line[1]
				print 'R{} {} {} 0'.format(node, curr, node)
			elif line[0] == 'Pin':
				if pin_name:
					raise Exception('Cannot handle multiple pins in one path')
				pin_name = line[1]
				print '.subckt {}_{} net0 gnd{}'.format(ibis_translate(board.header), ibis_translate(pin_name), nodes)
				print '* {}'.format(path.header)
			else:
				vals = parse_values(line)
				if vals['Len'] == 0:
					c = 0
					if 'C' in vals:
						c = vals['C']
					if 'L' in vals or 'R' in vals:
						c /= 2
					if c != 0:
						print 'C{} {} gnd {}'.format(nc, curr, c)
						nc += 1
					if 'R' in vals:
						prev = curr
						net[0] += 1
						curr = 'net' + '_'.join([str(v) for v in net])
						print 'R{} {} {} {}'.format(nr, prev, curr, vals['R'])
						nr += 1
					if 'L' in vals:
						prev = curr
						net[0] += 1
						curr = 'net' + '_'.join([str(v) for v in net])
						print 'L{} {} {} {}'.format(nl, prev, curr, vals['L'])
						nl += 1
					if 'L' in vals or 'R' in vals and c != 0:
						print 'C{} {} gnd {}'.format(nc, curr, c)
						nc += 1
				else:
					args = ''
					for n in [ 'L', 'R', 'C' ]:
						if n in vals:
							args += ' ' + n + '=' + vals[n]
					print '.MODEL LTRA_{} LTRA(len={}{})'.format(no, args)
					prev = curr
					net[0] += 1
					curr = 'net' + '_'.join([str(v) for v in net])
					print 'O{} {} gnd {} gnd LTRA{}'.format(no, prev, curr, no)
					no += 1
		print '.ends {}_{}'.format(ibis_translate(board.header), ibis_translate(pin_name))
		if pin_name in pin_mapping:
			print '.subckt {}_{} net0 gnd{}'.format(ibis_translate(board.header), ibis_translate(pin_mapping[pin_name]), nodes)
			print 'x net0 gnd{} {}_{}'.format(nodes, ibis_translate(board.header), ibis_translate(pin_name))
			print '.ends {}_{}'.format(ibis_translate(board.header), ibis_translate(pin_name))
	print '.endl'

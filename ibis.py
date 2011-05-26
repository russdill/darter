#!/usr/bin/env python
#
# ibis2spice.py Process IBIS models into SPICE models.
#
#  Copyright (C) 2011 Russ Dill <Russ.Dill@asu.edu>
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.

# FIXME: M in IBIS is 1000, but in SPICE we need Meg

import sys

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
	'.component.package',
	'.model',
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
	'.end'
])

ignored_sections = set([
	'.comment_char',
	'.component.manufacturer',
	'.component.pin',
	'.component.package_model',
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
	'.model_selector',
	'.model.ttgnd',
	'.model.ttpower',
	'.model.model_spec',
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
	'.define_package_model',
	'.define_package_model.manufacturer',
	'.define_package_model.oem',
	'.define_package_model.description',
	'.define_package_model.number_of_sections',
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
])

unsupported_sections = set([
	'.model.driver_schedule',
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
])

sections = frozenset(supported_sections | unsupported_sections | ignored_sections)

def parse_num(val):
	ext = val.lstrip('+-0123456789.eE')
	e = 1
	if len(ext):
		val = val[0:-len(ext)]
		e = 'fpnum.kMGT'.find(ext[0])
		if e == -1:
			e = 5
		e = 10**((e - 5) * 3)
	return float(val) * e

def param(n, val):
	print '.param {}={}'.format(n, val)

def range_param(n, row, invert):
	typ, min, max = row
	if min == 'NA':
		min = typ
	if max == 'NA':
		max = typ
	if (parse_num(min) > parse_num(max)) != invert:
		min, max = max, min
	print '.param {}={{modv({}, {}, {})}}'.format(n, typ, min, max)

def tbl_models(n, sections):
	maxval = 0
	if n in sections:
		for i, tbl in enumerate(sections[n]):

			for idx, row in enumerate(tbl.data):
				if row[2] == 'NA':
					tbl.data[idx][2] = row[1]
				if row[3] == 'NA':
					tbl.data[idx][3] = row[1]

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

			print '.model {}{} pwl(input_domain=0.1 fraction=TRUE'.format(n, i)

			print '+  x_array=['
			for row in tbl.data:
				print '+    {}'.format(row[0])
				if parse_num(row[0]) > maxval:
					maxval = parse_num(row[0])
			print '+  ]'

			print '+  y_array=['
			for row in tbl.data:
				print '+    {{modv({}, {}, {})}}'.format(row[1], row[2], row[3])
			print '+  ]'
			print '+)'
	else:
		print '.model {}0 pwl(x_array=[0] y_array=[0])'
	param('{}_max'.format(n), maxval)

class section:
	def __init__(self):
		self.sections = dict()
		self.name = ''
		self.header = ''
		self.text = list()
		self.data = list()
		self.param = dict()
		self.param_row = dict()
		self.columns = list()
		# self.param_vert = dict()
		self.parent = None
		self.unsupported = False
		
modv_func = '.func modv(typ, minv, maxv) {ternary_fcn(spec > 0, maxv, ternary_fcn(spec < 0, minv, typ))} '

main = section()

curr_sect = main
curr_key = ''

infile = sys.argv[1]
outfile = sys.argv[2]

sys.stdout = open(outfile, 'wb')

already_ignored = set()

file = open(infile, 'rb')
for line in file:
	if len(line) and line[0] == '|':
		continue

	line, _, _ = line.partition('|')

	if len(line) and line[0] == '[':
		name, _, line = line[1:].partition(']')
		line = line.strip()	
		key = name.replace(' ', '_').lower()
		while not '{}.{}'.format(curr_key, key) in sections:
			if curr_sect.parent != None:
				curr_sect = curr_sect.parent
				curr_key, _, _ = curr_key.rpartition('.')
			else:
				raise Exception('Could not find [{}]'.format(name))

		curr_key = '{}.{}'.format(curr_key, key)
		new_section = section()
		new_section.parent = curr_sect
		new_section.header = line.strip()
		new_section.columns = line.split()
		new_section.name = name
		if not key in curr_sect.sections:
			curr_sect.sections[key] = list()
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
		if '=' in line:
			key, _, val = line.partition('=')
			curr_sect.param[key.strip()] = val.strip()

		elif len(line):
			row = line.split()
			curr_sect.data.append(row)
			curr_sect.param_row[row[0]] = row[1:]

			row = line.split(None, 1)
			if len(row) > 1:
				curr_sect.param[row[0]] = row[1]

	curr_sect.text.append(line.strip())

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

#for model in main.sections['model_selector'] if 'model_selector' in main.sections else list():

for model in main.sections['model'] if 'model' in main.sections else list():
	Vinl, Vinh = None, None

	if model.unsupported:
		continue

	type = model.param['Model_type']

	libs = [ 'ibis_buffer' ]
	pins = None
	en = None
	if type == 'Input': # 4
		pins = 'in'
		en = '0'
		libs.append('ibis_input')
	elif type == 'I/O': # 8
		pins = 'vdd vss en out in'
		libs.append('ibis_input')
		libs.append('ibis_tristate')
		Vinl, Vinh = 0.8, 2.0
	elif type == 'I/O_open_drain' or type == 'I/O_open_sink': # 7
		pins = 'vdd vss en in'
		libs.append('ibis_input')
		libs.append('ibis_open_sink')
	elif type == 'I/O_open_source': # 7
		pins = 'vdd vss en in'
		libs.append('ibis_input')
		libs.append('ibis_open_source')
#	elif type == 'Input_ECL':
#	elif type == 'I/O_ECL':
	elif type == 'Terminator': # 3
		libs.append('ibis_terminator')
		en = '0'
	elif type == 'Output': # 6
		pins = 'vdd vss out'
		en = '1'
		libs.append('ibis_output')
	elif type == '3-state': # 7
		pins = 'vdd vss en out'
		libs.append('ibis_tristate')
	elif type == 'Open_sink' or type == 'Open_drain': # 6
		pins = 'vdd vss en'
		libs.append('ibis_open_sink')
	elif type == 'Open_source': # 6
		pins = 'vdd vss en'
		libs.append('ibis_open_source')
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

	print '.lib {}'.format(model.header)
	print '* type - {}'.format(type)
	if pins == None:
		pins=''
	else:
		pins += ' '
	print '.subckt {} pad vcc vee {}spec=0'.format(model.header, pins)
	if en != None:
		print 'V_en en 0 DC {}'.format(en)
	print 'V_always_hi always_hi 0 DC 1'
	print 'B_not_en not_en 0 V=V(en) > 0 ? 0 : 1'

#	print '.subckt dummy d'
#	print '.ends dummy'
#	print 'x_dummy 0 dummy'

	print modv_func

	if 'Vinl' in model.param:
		Vinl = model.param['Vinl']
	if Vinl != None:
		param('Vinl', Vinl)
	if 'Vinh' in model.param:
		Vinh = model.param['Vinh']
	if Vinh != None:
		param('Vinh', Vinh)

	need_c_comp = True
	for n in [ 'C_comp_pullup', 'C_comp_pulldown',
                   'C_comp_power_clamp', 'C_comp_gnd_clamp' ]:
		if n in model.param_row:
			range_param(n, model.param_row[n], True)
			need_c_comp = False
		else:
			param(n, '0')

	if need_c_comp and 'C_comp' in model.param_row:
		range_param('C_comp', model.param_row['C_comp'], True)
	else:
		param('C_comp', '0')

	for n in [ 'rgnd', 'rpower', 'rac' ]:
		if n in model.sections:
			range_param(n, model.sections[n][0].columns, False)
		else:
			param(n, '1e18')

	if 'cac' in model.sections:
		range_param('cac', model.sections['cac'][0].columns, True)
	else:
		param('cac', '0')

	for n in [ 'gnd_clamp_reference', 'pulldown_reference', 'external_reference' ]:
		if n in model.sections:
			range_param(n, model.sections[n][0].columns, True)
		else:
			param(n, '0')

	if 'voltage_range' in model.sections:
		range = model.sections['voltage_range'][0].columns
	else:
		range = None

	for n in [ 'power_clamp_reference', 'pullup_reference' ]:
		if n in model.sections:
			range_param(n, model.sections[n][0].columns, False)
		elif range != None:
			range_param(n, range, False)
		else:
			raise Exception('Missing [voltage_range] and [{}]'.format(n))

	for n in [ 'pulldown', 'pullup', 'gnd_clamp', 'power_clamp',
		   'rising_waveform', 'falling_waveform' ]:
		tbl_models(n, model.sections)

	for n in [ 'rising_waveform', 'falling_waveform' ]:
		if n in model.sections:
			for i, tbl in enumerate(model.sections[n]):
				for f in [ 'R_fixture', 'C_fixture' ]:
					if f in tbl.param:
						param('{}{}'.format(f, i), tbl.param[f])
					else:
						param('{}{}'.format(f, i), 0)
				if 'V_fixture' in tbl.param:
					typ = tbl.param['V_fixture']
					min, max = 'NA', 'NA'
					if 'V_fixture_min' in tbl.param:
						min = tbl.param['V_fixture_min']
					if 'V_fixture_max' in tbl.param:
						max = tbl.param['V_fixture_max']
					range_param('V_fixture{}'.format(i), [ typ, min, max ], False)
				for f in [ 'L_fixture', 'R_dut', 'L_dut', 'C_dut' ]:
					if f in tbl.param:
						print >> sys.stderr, 'Error: {} not supported in {}'.format(f, model.name)
			# FIXME: We silently ignore non-matching fixtures
			break
			

	for sect in model.sections['add_submodel'] if 'add_submodel' in model.sections else list():
		for key, mode in sect.param.iteritems():
			if mode == 'Non-Driving':
				en = 'not_en'
			elif mode == 'Driving':
				en = 'en'
			elif mode == 'All':
				en = 'always_hi'
			else:
				raise Exception('Unknown submodel mode: {}'.format(mode))

			print '.lib {} {}'.format(outfile, key)
			print 'x_{} pad vcc vee vdd vss {} {} spec={{spec}}'.format(key, en, key)

	for lib in libs:
		print '.include {}.inc'.format(lib)

	print '.ends {}'.format(model.header)

	for comp in main.sections['component'] if 'component' in main.sections else list():
		name = comp.header.replace(' ', '_')
		print '.subckt {}_{} pad vcc vee {}spec=0'.format(name, model.header, pins)
		for n, inv in [ [ 'R_pkg', False ], [ 'C_pkg', True ], [ 'L_pkg', True ] ]:
			if 'package' in comp.sections and n in comp.sections['package'][0].param_row:
				range_param(n, comp.sections['package'][0].param_row[n], inv)
			else:
				param(n, '0')
		print '.include ibis_pkg.inc'
		print 'x0 die vcc vee {}{} spec={{spec}}'.format(pins, model.header)
		print '.ends {}_{}'.format(name, model.header)

	print '.endl'

for model in main.sections['submodel'] if 'submodel' in main.sections else list():

	if model.unsupported:
		continue

	print '.lib {}'.format(model.header)
	type = model.param['Submodel_type']
	print '* type - {}'.format(type)

	tables = [ 'gnd_clamp', 'power_clamp' ]
	if type == 'Dynamic_clamp':
		lib = 'ibis_dynamic_clamp'
		tables.append('gnd_pulse_table')
		tables.append('power_pulse_table')
#	elif type == 'Bus_hold':
#		lib = 'ibis_bus_hold'
#		tables.append('pulldown')
#		tables.append('pullup')
#		tables.append('falling_waveform')
#		tables.append('rising_waveform')
#	elif type == 'Fall_back':
#		lib = 'ibis_fall_back'
#		tables.append('pulldown')
#		tables.append('pullup')
#		tables.append('falling_waveform')
#		tables.append('rising_waveform')
	else:
		print '* Unhandled submodel type: {}'.format(type)
		print '.endl'
		continue

	print '.subckt {} pad vcc vee vdd vss en spec=0'.format(model.header)

#	print '.subckt dummy d'
#	print '.ends dummy'
#	print 'x_dummy 0 dummy'

	for n in [ 'V_trigger_r', 'V_trigger_f', 'Off_delay' ]:
		if n in model.param_row:
			range_param(n, model.param_row[n], False)
		else:
			param(n, '0')

	for n in tables:
		tbl_models(n, model.sections)

	print '.include {}.inc'.format(lib)

	print '.ends {}'.format(model.header)
	print '.endl'

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
	'.model_selector',
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
	'.component',
	'.component.manufacturer',
	'.component.package',
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
	'.model.ttgnd',
	'.model.ttpower',
	'.model.model_spec',
	'.model.receiver_thresholds',
	'.model.temperature_range',
	'.model.external_reference',
	'.model.ramp',
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

def tbl_subcircuits(n, sections):
	maxval = 0
	if n in sections:
		for i, tbl in enumerate(sections[n]):
			print '.subckt {}{} np nn ncp ncn spec=0'.format(n, i)
			print modv_func

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

			for line, row in enumerate(tbl.data):
				print '.param pwl{}={{modv({}, {}, {})}}'.format(line, row[1], row[2], row[3])

			print 'b0 np nn V=pwl(V(ncp, ncn)'
			for line, row in enumerate(tbl.data):
				print '+,{},{{pwl{}}}'.format(row[0], line)
				if parse_num(row[0]) > maxval:
					maxval = parse_num(row[0])

			print '+)'
			print '.ends {}{}'.format(n, i)
	else:
		print '.subckt {}0 np nn ncp ncn spec=0'.format(n)
		print 'b0 np nn V=0'
		print '.ends {}0'.format(n)
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

#for comp in main.sections['component'] if 'component' in main.sections else list():

#for model in main.sections['model_selector'] if 'model_selector' in main.sections else list():

for model in main.sections['model'] if 'model' in main.sections else list():
	Vinl, Vinh = None, None

	if model.unsupported:
		continue

	print '.lib {}'.format(model.header)
	type = model.param['Model_type']
	print '* type - {}'.format(type)

	libs = [ 'ibis_buffer' ]
	if type == 'Input': # 4
		print '.subckt {} pad vcc vee in spec=0'.format(model.header)
		print 'V_en en 0 DC 0'
		libs.append('ibis_input')
	elif type == 'I/O': # 8
		print '.subckt {} pad vcc vee vdd vss en out in spec=0'.format(model.header)
		libs.append('ibis_input')
		libs.append('ibis_output')
		Vinl, Vinh = 0.8, 2.0
	elif type == 'I/O_open_drain' or type == 'I/O_open_sink': # 7
		print '.subckt {} pad vcc vee vdd vss en in spec=0'.format(model.header)
		libs.append('ibis_input')
		libs.append('ibis_open_sink')
	elif type == 'I/O_open_source': # 7
		print '.subckt {} pad vcc vee vdd vss en in spec=0'.format(model.header)
		libs.append('ibis_input')
		libs.append('ibis_open_source')
#	elif type == 'Input_ECL':
#	elif type == 'I/O_ECL':
	elif type == 'Terminator': # 3
		print '.subckt {} pad vcc vee spec=0'.format(model.header)
		print 'V_en en 0 DC 0'
		libs.append('ibis_terminator')
	elif type == 'Output': # 6
		print '.subckt {} pad vcc vee vdd vss out spec=0'.format(model.header)
		print 'V_en en 0 DC 1'
		libs.append('ibis_output')
	elif type == '3-state': # 7
		print '.subckt {} pad vcc vee vdd vss en out spec=0'.format(model.header)
		libs.append('ibis_output')
	elif type == 'Open_sink' or type == 'Open_drain': # 6
		print '.subckt {} pad vcc vee vdd vss en spec=0'.format(model.header)
		libs.append('ibis_open_sink')
	elif type == 'Open_source': # 6
		print '.subckt {} pad vcc vee vdd vss en spec=0'.format(model.header)
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
		print '.endl'
		continue

	print 'V_always_hi always_hi 0 DC 1'
	print 'B_not_en not_en 0 V=V(en) > 0 ? 0 : 1'

	print '.subckt dummy d'
	print '.ends dummy'
	print 'x_dummy 0 dummy'

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
		tbl_subcircuits(n, model.sections)

	for n in [ 'rising_waveform', 'falling_waveform' ]:
		if n in model.sections:
			for i, tbl in enumerate(model.sections[n]):
				for f in [ 'V_fixture', 'R_fixture' ]:
					if f in tbl.param:
						typ = tbl.param[f]
						min, max = 'NA', 'NA'
						if '{}_min'.format(f) in tbl.param:
							min = tbl.param['{}_min'.format(f)]
						if '{}_max'.format(f) in tbl.param:
							max = tbl.param['{}_max'.format(f)]
						range_param('{}{}'.format(f, i), [ typ, min, max], False)
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
		print '.lib ibis.lib {}'.format(lib)

	print '.ends {}'.format(model.header)
	print '.endl'

for model in main.sections['submodel'] if 'submodel' in main.sections else list():

	if model.unsupported:
		continue

	print '.lib {}'.format(model.header)
	type = model.param['Submodel_type']
	print '* type - {}'.format(type)

	if type == 'Dynamic_clamp':
		lib = 'ibis_dynamic_clamp'
#	elif type == 'Bus_hold':
#		lib = 'ibis_bus_hold'
#	elif type == 'Fall_back':
#		lib = 'ibis_fall_back'
	else:
		print '* Unhandled submodel type: {}'.format(type)
		print '.endl'
		continue

	print '.subckt {} pad vcc vee vdd vss en spec=0'.format(model.header)

	for n in [ 'V_trigger_r', 'V_trigger_f', 'Off_delay' ]:
		if n in model.param_row:
			range_param(n, model.param_row[n], False)
		else:
			param(n, '0')

	for n in [ 'pulldown', 'pullup', 'gnd_clamp', 'power_clamp',
		   'rising_waveform', 'falling_waveform',
		   'gnd_pulse_table', 'power_pulse_table' ]:
		tbl_subcircuits(n, model.sections)

	print '.lib ibis.lib {}'.format(lib)

	print '.ends {}'.format(model.header)
	print '.endl'

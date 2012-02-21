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

# FIXME: General behavior should be to not emit unsupported stuff, not die.

import sys
import math
import pybis
from string import Template
from string import maketrans
from scipy.interpolate import interp1d
from scipy.misc import derivative
import copy

ignored_sections = set([
    'Component.Package Model.Alternate Package Models',
    'Component.Pin Mapping',
    'Component.Diff Pin',
    'Component.Series Pin Mapping',
    'Component.Series Switch Groups',
    'Component.Node Declarations',
    'Component.Circuit Call',
    'Component.Begin EMI Component',
    'Model Selector',
    'Model.Polarity',
    'Model.Enable'
    'Model.Vmeas',
    'Model.Cref',
    'Model.Rref',
    'Model.Vref',
    'Model.TTgnd',
    'Model.TTpower',
    'Model.Temperature Range',
    'Model.External Reference',
    'Model.ISSO PU',
    'Model.ISSO PD',
    'Model.Ramp',
    'Model.Rising Waveform.Composite Current',
    'Model.Falling Waveform.Composite Current',
    'Model.Test Data',
    'Model.R Series',
    'Model.L Series',
    'Model.Rl Series',
    'Model.C Series',
    'Model.Lc Series',
    'Model.Rc Series',
    'Model.Series Current',
    'Model.Series Mosfet',
    'Model.On',
    'Model.Off',
    'Model.Model Spec.S_overshoot_high',
    'Model.Model Spec.S_overshoot_low',
    'Model.Model Spec.D_overshoot_high',
    'Model.Model Spec.D_overshoot_low',
    'Model.Model Spec.D_overshoot_time',
    'Model.Model Spec.Pulse_high',
    'Model.Model Spec.Pulse_low',
    'Model.Model Spec.Pulse_time',
    'Model.Model Spec.Vmeas',
    'Model.Model Spec.Vref',
    'Model.Model Spec.Cref',
    'Model.Model Spec.Rref',
    'Model.Model Spec.Cref_falling',
    'Model.Model Spec.Cref_rising',
    'Model.Model Spec.Rref_rising',
    'Model.Model Spec.Rref_falling',
    'Model.Model Spec.Vref_rising',
    'Model.Model Spec.Vref_falling',
    'Model.Model Spec.Vmeas_rising',
    'Model.Model Spec.Vmeas_falling',
    'Model.Model Spec.Rref_diff',
    'Model.Model Spec.Cref_diff',
    'Model.Receiver Thresholds.Vth_min',
    'Model.Receiver Thresholds.Vth_max',
    'Model.Receiver Thresholds.Vcross_low',
    'Model.Receiver Thresholds.Vcross_high',
    'Model.Receiver Thresholds.Vdiff_ac',
    'Model.Receiver Thresholds.Vdiff_dc',
    'Model.Receiver Thresholds.Tslew_ac',
    'Model.Receiver Thresholds.Tdiffslew_ac',
    'Submodel.Ramp',
    'Begin Board Description.Reference Designator Map',
])

unsupported_sections = set([
    'Model.Driver Schedule',
    'Model.External Model',
    'Model.Algorithmic Model'
    'Model.Begin EMI Model'
    'Submodel.Pulldown',
    'Submodel.Pullup',
    'Submodel.Rising Waveform',
    'Submodel.Falling Waveform',
    'External Circuit',
    'Package Model.Number of Sections'
])

def dump_sections(info):
    ret = set(info.keys())
    for name, child in info.iteritems():
        tmp = set()
        if isinstance(child, pybis.IBISNode):
            tmp.update(dump_sections(child))
        elif isinstance(child, dict):
            for sub in child.values():
                if isinstance(sub, pybis.IBISNode):
                    tmp.update(dump_sections(sub))
        elif isinstance(child, list):
            for sub in child:
                if isinstance(sub, pybis.IBISNode):
                    tmp.update(dump_sections(sub))
        for n in tmp:
            ret.add(name + '.' + n)

    return ret

# Print out a SPICE param
def param(n, val, invert=None):
    if isinstance(val, pybis.Range):
        print '.param {}={{modv({}, {}, {})}}'.format(n,
            val(0), val(1, invert), val(2, invert))
    else:
        print '.param {}={}'.format(n, val)

# Return a set of strings that can be used to emit
# a pwl B-source based on the table of data.
def dump_tbl_models(name, table):
    #maxval = 0
    ret = dict()
    if table:
        for i, corner in enumerate([ 'typ', 'min', 'max' ]):
            data = ''.join(map(lambda x, y: '\n+    ,{},{}'.format(x, y), table(i)[0], table(i)[1]))
            ret['{}_{}'.format(name, corner)] = data
        #maxval = max(maxval, max(table(i)[1]))
    else:
        for corner in [ 'typ', 'min', 'max' ]:
            ret['{}_{}'.format(name, corner)] = ', 0, 0, 1, 0'

    return ret

# Make the IV functions extend out from -100 to 100
# Since limit_table already flattened the edges, we can
# just copy the y value.
# FIXME: Maybe use +inf/-inf
def interp_iv(_x, _y):
    x, y = list(_x), list(_y)
    x_min, x_max = -100, 100
    if x_min < _x[0]:
        x.insert(0, x_min)
        y.insert(0, _y[0])
    if x_max > _x[-1]:
        x.append(x_max)
        y.append(_y[-1])
    return interp1d(x, y, kind=1)

# Flatten the extents of a pwl
def flatten_extents(tbl):
    ret = copy.deepcopy(tbl)
    for sub in ret:
        sub[0].insert(0, sub[0][0] - 1)
        sub[0].append(sub[0][-1] + 1)
        sub[1].insert(0, sub[1][0])
        sub[1].append(sub[1][-1])
    return ret

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
    kpu_dA_max = pybis.Range([ 0 ] * 3)
    kpu_dA_min = pybis.Range([ 0 ] * 3)
    kpd_dA_max = pybis.Range([ 0 ] * 3)
    kpd_dA_min = pybis.Range([ 0 ] * 3)
    for i in range(3):
        pc[i] = interp_iv(*data['Power_Clamp'](i))
        gc[i] = interp_iv(*data['GND_Clamp'](i))
        pu[i] = interp_iv(*data['Pullup'](i))
        pd[i] = interp_iv(*data['Pulldown'](i))
    for name in [ 'Rising', 'Falling' ]:
        waveform = data[name + ' Waveform']

        kpu = None
        kpd = None
        if nfixtures > 1:
            kpu = pybis.Range([ ( [], [] ), ( [], [] ), ( [], [] ) ])
            kpd = pybis.Range([ ( [], [] ), ( [], [] ), ( [], [] ) ])

        max_time = pybis.Range()
        for i in range(3):
            c_comp = []
            wfm = []
            curr_x = []
            last_dx = [float("inf")] * nfixtures
            dx = [0] * nfixtures
            next_x = [0] * nfixtures
            idx = [0] * nfixtures
            time = set()
            for n in range(nfixtures):
                # FIXME: [i] can return None
                c_comp.append(refs['C_comp'](i) + waveform[n].c_fixture)
                wfm.append(interp_wfm(*waveform[n].waveform(i)))
                curr_x.append(waveform[n].waveform(i)[0][0])
                time = time | set(waveform[n].waveform(i)[0])

            time = list(time)
            time.sort()
            max_time.append(time[-1])

            for timestep, t in enumerate(time):
                Ifx = []
                Ipu = []
                Ipd = []
                # FIXME: This could be handled with matrix math
                for n in range(nfixtures):
                    y = wfm[n](t)
                    I = (waveform[n].v_fixture(i) - y) / waveform[n].r_fixture
                    if math.isnan(I):
                        raise Exception('I')
                    Igc = gc[i](y - refs['GND Clamp Reference'](i))
                    Ipc = pc[i](refs['Power Clamp Reference'](i) - y)

                    while idx[n] < len(waveform[n].waveform(i)[0]) and waveform[n].waveform(i)[0][idx[n]] <= t:
                        dx = None
                        idx[n] += 1
                    if not dx:
                        if idx[n] < len(waveform[n].waveform(i)[0]):
                            next_x[n] = waveform[n].waveform(i)[0][idx[n]]
                            next_dx = next_x[n] - curr_x[n]
                        dx = min(next_dx, last_dx[n]) / 2
                        last_dx[n] = next_dx
                        curr_x[n] = next_x[n]

                    Icomp = derivative(wfm[n], t, dx=dx) * c_comp[n]
                    Ifx.append(I - (Igc + Ipc + Icomp))
                    Ipu.append(pu[i](refs['Pullup Reference'](i) - y))
                    Ipd.append(pd[i](y - refs['Pulldown Reference'](i)))
                if nfixtures > 1:
                    denom = Ipd[1] * Ipu[0] - Ipd[0] * Ipu[1]
                    kpu[i][1].append((Ifx[0] * Ipd[1] - Ifx[1] * Ipd[0]) / denom)
                    kpd[i][1].append((Ifx[1] * Ipu[0] - Ifx[0] * Ipu[1]) / denom)
                    kpu[i][0].append(t)
                    kpd[i][0].append(t)
                else:
                    if not kpu and not kpd:
                        if Ipu[0] != 0 and Ipd[0] != 0:
                            raise Exception('Insufficient waveforms for fixture')
                        elif Ipu[0] != 0:
                            isos = True
                            kpu = pybis.Range([ ( [], [] ), ( [], [] ), ( [], [] ) ])
                            kpd = pybis.Range([ ( [0, 1], [0, 0] ), None, None ])
                        elif Ipd[0] != 0:
                            isos = False
                            kpu = pybis.Range([ ( [0, 1], [0, 0] ), None, None ])
                            kpd = pybis.Range([ ( [], [] ), ( [], [] ), ( [], [] ) ])
                        else:
                            raise Exception('Too many waveforms for fixture')
                    if isos:
                        kpu[i][1].append(Ifx[0] / Ipu[0])
                        kpu[i][0].append(t)
                    else:
                        kpd[i][1].append(Ifx[0] / Ipd[0])
                        kpd[i][0].append(t)
                if timestep > 1:
                    # Find the maximum expected slew rate up and down
                    if nfixtures > 1 or isos:
                        dA = kpu[i][1][-1] - kpu[i][1][-2]
                        dA /= t - prev_t
                        kpu_dA_min[i] = max(kpu_dA_min[i], -dA)
                        kpu_dA_max[i] = max(kpu_dA_max[i], dA)
                    if nfixtures > 1 or not isos:
                        dA = kpd[i][1][-1] - kpd[i][1][-2]
                        dA /= t - prev_t
                        kpd_dA_min[i] = max(kpd_dA_min[i], -dA)
                        kpd_dA_max[i] = max(kpd_dA_max[i], dA)
                prev_t = t
        ret[name + '_kpu'] = kpu
        ret[name + '_kpd'] = kpd
        param(name + '_time', max_time)
    param('kpu_da_min', kpu_dA_min)
    param('kpu_da_max', kpu_dA_max)
    param('kpd_da_min', kpd_dA_min)
    param('kpd_da_max', kpd_dA_max)
    return ret

def ibis_translate(str):
    return str.translate(maketrans('<>- #', '____c'))

# Convert a SPICE include file, substituting $<var> for vars in 'tables'
def include(lib, tables):
    file = lib
    if sys.path[0]:
        file = '{}/{}'.format(sys.path[0], lib)
    print Template(open(file, 'rb').read()).substitute(tables)


# Pick typ, min, max based on spec -1, 0, 1
modv_func = '.func modv(typ, minv, maxv) {ternary_fcn(spec > 0, maxv, ternary_fcn(spec < 0, minv, typ))} '

infile = sys.argv[1]
outfile = sys.argv[2]

n, p, ext = infile.rpartition(".")
ext = ext.lower()
if ext == "ibs":
    parser = pybis.IBSParser()
elif ext == "pkg":
    parser = pybis.PKGParser()
elif ext == "ebd":
    parser = pybis.EBDParser()
else:
    print >> sys.stderr, "Warning: Unknown extensions, '{}', assuming ibs".format(ext)
    parser = pybis.IBSParser()

main = parser.parse(infile)

sections = dump_sections(main)
unsupported = sections & unsupported_sections
if unsupported:
    print >> sys.stderr, "The following sections are unsupported"
    print >> sys.stderr, unsupported
    raise Exception("Unsupported sections")

ignored = sections & ignored_sections
if ignored:
    print >> sys.stderr, "The following sections are ignored"
    print >> sys.stderr, ignored

sys.stdout = open(outfile, 'wb')

print '* Generated by darter.py'

# Print out header information
for name, text in main.header.iteritems():
    split = text.splitlines()
    if len(split) > 1:
        print '* {}:'.format(name)
        for line in split:
            print '* {}'.format(line)
        print '*'
    elif len(split):
        print '* {}: {}'.format(name, split[0])

package_models = dict()

for name, model in main.define_package_model.iteritems() if 'Define Package Model' in main else []:

    if not 'Model Data' in model:
        # Error: Missing data...
        continue

    pm = dict()
    for pin, num in model.pin_mapping.iteritems():
        tmp = dict()
        for l, m in [ ("R", "Resistance Matrix"), ("L", "Inductance Matrix"), ("C", "Capacitance Matrix") ]:
            try:
                tmp[l] = model.model_data[m][num][num]
            except:
                pass
        if tmp:
            pm[pin] = tmp
    package_models[name] = pm

# Process each model
for name, model in main.model.iteritems() if 'Model' in main else []:

    # Select what circuits we need and what pins we need
    libs = [ 'ibis_buffer' ]
    pins = ''
    en = None
    out = None
    nfixtures = 0

    # FIXME: Rename pin names to IBIS standard. Perhaps make default "External Model"?
    if model.model_type == 'input': # 4
        pins = 'D_receive'
        en = 'pulldown'
    elif model.model_type == 'i/o': # 8
        pins = 'A_puref A_pdref D_enable D_drive D_receive'
    elif model.model_type == 'i/o_open_sink': # 6
        pins = 'A_pdref D_enable D_receive'
        out = 'pulldown'
    elif model.model_type == 'i/o_open_source': # 6
        pins = 'A_puref D_enable D_receive'
        out = 'pullup'
    elif model.model_type == 'terminator': # 3
        libs.append('ibis_terminator')
        en = 'pulldown'
    elif model.model_type == 'output': # 6
        pins = 'A_puref A_pdref D_drive'
        en = 'pullup'
    elif model.model_type == '3-state': # 7
        pins = 'A_puref A_pdref D_enable D_drive'
    elif model.model_type == 'open_sink': # 5
        pins = 'A_pdref D_enable'
        out = 'pulldown'
    elif model.model_type == 'open_source': # 5
        pins = 'A_puref D_enable'
        out = 'pullup'
#    elif model.model_type == 'Input_ECL':
#    elif model.model_type == 'Output_ECL':
#    elif model.model_type == 'I/O_ECL':
#    elif model.model_type == '3-state_ECL':
#    elif model.model_type == 'Series':
#    elif model.model_type == 'Series_switch':
#    elif model.model_type == 'Input_diff':
#    elif model.model_type == 'Output_diff':
#    elif model.model_type == 'I/O_diff':
#    elif model.model_type == '3-state_diff':
    else:
        print '* Unhandled model type: {}'.format(model.model_type)
        continue

    if 'D_receive' in pins:
        libs.append('ibis_input')
    if 'A_puref' in pins:
        libs.append('ibis_output_pullup')
        nfixtures += 1
    if 'A_pdref' in pins:
        libs.append('ibis_output_pulldown')
        nfixtures += 1
    if 'A_puref' in pins or 'A_pdref' in pins:
        libs.append('ibis_output')

    print '.lib {}'.format(ibis_translate(name))
    print '* type - {}'.format(model.model_type)

    for key, mode in model.add_submodel.iteritems() if 'Add Submodel' in model else []:
        print '.lib {} {}'.format(outfile, ibis_translate(key))

    if len(pins):
        pins += ' '

    print '.subckt {} A_signal A_pcref A_gcref {}spec=0 start_on=1'.format(ibis_translate(name), pins)
    print '.model pullup d_pullup(load=0)'
    print '.model pulldown d_pulldown(load=0)'
    print '.model inv d_inverter(rise_delay=1f fall_delay=1f input_load=0)'
    if en != None:
        print 'A_en D_enable {}'.format(en)
    if out != None:
        print 'A_out D_drive {}'.format(out)
    print 'A_not_en D_enable D_not_enable inv'
    print 'A_always_hi always_hi pullup'
    print modv_func

    model_spec = model.get("Model Spec", dict())
    thresholds = model.get("Receiver Thresholds", dict())
    param('vth', thresholds.get('Vth', 0))

    param('Vinh_ac', thresholds.get('Vinh_ac', model_spec.get('Vinh+',
        model_spec.get('Vinh', model.get('Vinh', 0)))))
    param('Vinh_dc', thresholds.get('Vinh_dc', model_spec.get('Vinh-',
        model_spec.get('Vinh', model.get('Vinh', 0)))))
    param('Vinl_ac', thresholds.get('Vinl_ac', model_spec.get('Vinl-',
        model_spec.get('Vinl', model.get('Vinl', 0)))))
    param('Vinl_dc', thresholds.get('Vinl_dc', model_spec.get('Vinl+',
        model_spec.get('Vinl', model.get('Vinl', 0)))))

    tables = dict()
    if 'Threshold_sensitivity' in thresholds:
        param('Threshold_sensitivity', thresholds.threshold_sensitivity)
        refs = { 'power_clamp_ref': 'A_pcref',
            'gnd_clamp_ref': 'A_gcref',
            'pullup_ref': 'A_puref',
            'pulldown_ref': 'A_pdref',
            'ext_ref': 'VRef' }
        tables['ref_supply'] = refs[thresholds['Reference_supply']]
    else:
        param('Threshold_sensitivity', 1)
        tables['ref_supply'] = 'A_gcref'

    c_comp_list = [ 'C_comp_power_clamp', 'C_comp_gnd_clamp' ]
    if 'A_puref' in pins:
        c_comp_list.append('C_comp_pullup')
    if 'A_pdref' in pins:
        c_comp_list.append('C_comp_pulldown')

    need_c_comp = True
    c_comp_total = pybis.Range([0, 0, 0])
    for n in c_comp_list:
        if n in model:
            need_c_comp = False
    if need_c_comp:
        c_comp_total = model.c_comp.inv
        div = len(c_comp_list)
        c_comp_div = pybis.Range([
            c_comp_total.typ / div,
            c_comp_total.min / div,
            c_comp_total.max / div ])
        for n in c_comp_list:
            param(n, c_comp_div)
    else:
        for n in c_comp_list:
            if n in model:
                param(n, model[n].inv)
                c_comp_total[0] += model[n].inv.typ
                c_comp_total[1] += model[n].inv.min
                c_comp_total[2] += model[n].inv.max
            else:
                # Give it *something*, we get a better chance
                # of convergence
                param(n, '10f')

    refs = dict()
    refs['C_comp'] = c_comp_total

    for n in [ 'Rgnd', 'Rpower', 'Rac' ]:
        try:
            param(n, model[n].norm)
        except:
            param(n, 1e18)

    try:
        param('Cac', model.cac.inv)
    except:
        param('Cac', 0)

    for n in [ 'GND Clamp', 'Pulldown', 'External' ]:
        full = n + ' Reference'
        try:
            refs[full] = model[full].inv
        except:
            refs[full] = pybis.Range([0, None, None])

    for n in [ 'Power Clamp', 'Pullup' ]:
        full = n + ' Reference'
        try:
            refs[full] = model[full].norm
        except:
            refs[full] = model.voltage_range.norm

    for n in [ 'Rising Waveform', 'Falling Waveform' ]:
        if n in model:
            for tbl in model[n]:
                for f in [ 'L_fixture', 'R_dut', 'L_dut', 'C_dut' ]:
                    if f in tbl and tbl[f]:
                        print >> sys.stderr, 'Error: {} not supported in {}'.format(f, name)

    data = dict()
    for n in [ 'Pulldown', 'Pullup', 'GND Clamp', 'Power Clamp' ]:
        try:
            data[ibis_translate(n)] = flatten_extents(model[n])
        except:
            data[ibis_translate(n)] = pybis.Range([ ( [0, 1], [0, 0] ), None, None])

    if nfixtures > 0:
        fixture_data = dict()
        for n in [ 'Rising Waveform', 'Falling Waveform' ]:
            if n in model:
                fixture_data[n] = model[n]
        fixture_data.update(data)
        data.update(fixture(refs, fixture_data, nfixtures))

    for tbl_name, tbl in data.iteritems():
        tables.update(dump_tbl_models(tbl_name, tbl))

    # Include necessary circuits
    for lib in libs:
        include('{}.inc'.format(lib), tables)

    # Include necessary submodel circuits
    for key, mode in model.add_submodel.iteritems() if 'Add Submodel' in model else []:
        if mode == 'non-driving':
            en = 'D_not_enable'
        elif mode == 'driving':
            en = 'D_enable'
        elif mode == 'all':
            en = 'always_hi'

        print 'x_{} A_signal A_pcref A_gcref A_puref A_pdref {} {} spec={{spec}}'.format(ibis_translate(key), en, ibis_translate(key))

    print '.ends {}'.format(ibis_translate(name))
    print '.endl'

# Generate pin component parasitics
for name, comp in main.component.iteritems() if 'component' in main else []:
    name = ibis_translate(name)

    print '.lib {}'.format(name)
    print '.subckt {} pad gnd die spec=0'.format(name)

    print '* Manufacturer: {}'.format(comp.manufacturer)

    try:
        pm = package_models[comp.package_model]
    except:
        pm = dict()

    print modv_func
    param('R_pkg', comp.package.r_pkg.norm)
    param('L_pkg', comp.package.l_pkg.inv)
    param('C_pkg', comp.package.c_pkg.inv)

    include('ibis_pkg.inc', None)
    print '.ends {}'.format(name)

    listed = set()

    for pin, vals in comp.pin.iteritems():
        if vals.signal_name is None or vals.model_name is None:
            continue

        # Don't print out non-pin specific information
        if (n not in vals or vals[n] is None) and not pin in pm:
            continue

        for sub, signal in [ [ pin, False ], [ vals.signal_name, True ] ]:
            # Ignore duplicated pins (power/ground)
            # NOTE: This may or may not be throwing away
            # data depending in the IBIS model
            if signal and sub in listed:
                continue

            print '.subckt {}_{} pad gnd die spec=0'.format(name,
                            ibis_translate(sub))
            if signal:
                print '* pin {}'.format(pin)
            else:
                print '* {}'.format(vals.signal_name)

            for prefix, inv in [ [ 'R', False ], [ 'C', True ], [ 'L', True ] ]:
                n = '{}_pin'.format(prefix)
                np = '{}_pkg'.format(prefix)
                if n in vals and vals[n] is not None:
                    param(np, vals[n], inv)
                elif pin in pm and prefix in pm[pin]:
                    param(np, pm[pin][prefix], inv)
                else:
                    param(np, comp.package[np], inv)

            print modv_func
            include('ibis_pkg.inc', None)
            print '.ends {}_{}'.format(name, ibis_translate(sub))
        listed.add(vals.signal_name)
    print '.endl'

# Create submodel subcircuits
for name, model in main.submodel.iteritems() if 'submodel' in main else []:

    print '.lib {}'.format(ibis_translate(name))
    print '* type - {}'.format(model.submodel_type)

    data = dict()
    if model.submodel_type == 'dynamic_clamp':
        lib = 'ibis_dynamic_clamp'
        for table in [ 'GND Pulse Table', 'Power Pulse Table' ]:
            try:
                data[ibis_translate(table)] = model[table]  
            except:
                data[ibis_translate(table)] = pybis.Range([ ( [0, 1], [0, 0] ), None, None])
#    elif model.submodel_type == 'Bus_hold':
#        lib = 'ibis_bus_hold'
#        table_names.append('pulldown')
#        table_names.append('pullup')
#        table_names.append('falling_waveform')
#        table_names.append('rising_waveform')
#    elif model.submodel_type == 'Fall_back':
#        lib = 'ibis_fall_back'
#        table_names.append('pulldown')
#        table_names.append('pullup')
#        table_names.append('falling_waveform')
#        table_names.append('rising_waveform')
    else:
        print '* Unhandled submodel type: {}'.format(model.submodel_type)
        print '.endl'
        continue

    print '.subckt {} A_signal A_pcref A_gcref A_puref A_pdref D_enable spec=0'.format(ibis_translate(name))

    print modv_func

    for n in 'V_trigger_r', 'V_trigger_f', 'Off_delay':
        try:
            param(n, model.submodel_spec[n])
        except:
            param(n, 0)

    for n in [ 'GND Clamp', 'Power Clamp' ]:
        try:
            data[ibis_translate(n)] = flatten_extents(model[n])
        except:
            data[ibis_translate(n)] = pybis.Range([ ( [0, 1], [0, 0] ), None, None])

    for table in [ 'GND Pulse Table', 'Power Pulse Table' ]:
        try:
            r = pybis.Range()
            for i in range(3):
                r.append(model[table](i)[0][-1])
            param(ibis_translate(table) + '_time', r)
        except:
            param(ibis_translate(table) + '_time', 0)

    tables = dict()
    for tbl_name, tbl in data.iteritems():
        tables.update(dump_tbl_models(tbl_name, tbl))

    include('{}.inc'.format(lib), tables)

    print '.ends {}'.format(ibis_translate(name))
    print '.endl'

for name, board in main.begin_board_description.iteritems() if 'Begin Board Description' in main else []:

    print '.lib {}'.format(ibis_translate(name))
    print '* Manufacturer: {}'.format(board.manufacturer)

    for signal_name, path in board.path_description.iteritems():

        def get_nodes(path):
            nodes = ''
            for item in path:
                if isinstance(item, list):
                    nodes += get_nodes(item)
                elif 'Node' in item:
                    nodes += ' ' + item.node
            return nodes

        pin_name = path[0].pin
        nodes = get_nodes(path)
        print '.subckt {}_{} net_0 gnd{}'.format(ibis_translate(name), ibis_translate(pin_name), nodes)
        print '* {}'.format(signal_name)

        def process_path(path, n=[0], net='net', r=[0]):
            next_n = [0]
            def curr(n):
                return net + '_' + str(n[0])
            def next(n):
                n[0] += 1
                return curr(n)
            def refdes(r):
                r[0] += 1
                return r[0]
            for item in path:
                if isinstance(item, list):
                    print 'R_Fork{} {} {}_{} 0'.format(refdes(r), curr(n), curr(n), next_n[0])
                    process_path(item, next_n, curr(n), r)
                    next_n[0] += 1
                    print '* Endfork'
                elif 'Node' in item:
                    print 'R{} {} {} 0'.format(item.node, curr(n), item.node)
                elif 'Pin' in item:
                    raise Exception('Cannot handle multiple pins in one path')
                else:
                    if item.len == 0:
                        c = item.get('C', 0)
                        if 'L' in item or 'R' in item:
                            c /= 2
                        if c != 0:
                            print 'C{} {} gnd {}'.format(refdes(r), curr(n), c)
                        if 'R' in item:
                            print 'R{} {} {} {}'.format(refdes(r), curr(n), next(n), item.r)
                        if 'L' in item:
                            print 'L{} {} {} {}'.format(refdes(r), curr(n), next(n), item.l)
                        if 'L' in item or 'R' in item and c != 0:
                            print 'C{} {} gnd {}'.format(refdes(r), curr(n), c)
                    else:
                        args = ''
                        for n in [ 'L', 'R', 'C' ]:
                            if n in item:
                                args += ' ' + n + '=' + item[n]
                        o = refdes(r)
                        print '.MODEL LTRA_{} LTRA(len={}{})'.format(o, args)
                        print 'O{} {} gnd {} gnd LTRA{}'.format(o, curr(n), next(n), no)

        process_path(path[1:])

        print '.ends {}_{}'.format(ibis_translate(name), ibis_translate(pin_name))

        print '.subckt {}_{} net_0 gnd{}'.format(ibis_translate(name), ibis_translate(signal_name), nodes)
        print 'x net_0 gnd{} {}_{}'.format(nodes, ibis_translate(name), ibis_translate(pin_name))
        print '.ends {}_{}'.format(ibis_translate(name), ibis_translate(pin_name))

    print '.endl'

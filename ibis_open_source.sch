v 20110115 2
B 44900 33900 13800 6000 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
T 39500 43900 8 10 1 0 0 0 1
dist-license=GPL2+
T 39506 44100 8 10 1 0 0 0 1
dist-license=GPL2+
T 39506 44300 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
T 45000 39700 9 10 1 0 0 0 1
Fixture 0
C 48700 41200 1 0 0 gnd-1.sym
N 48600 41500 48800 41500 4
{
T 48600 41500 5 10 1 1 0 0 1
netname=0
}
N 46200 37700 46900 37700 4
{
T 46200 37700 5 10 1 1 0 0 1
netname=fixture0
}
N 57000 42600 58200 42600 4
{
T 57800 42700 5 10 1 1 0 0 1
netname=pad
}
C 57200 42800 1 90 0 current-1.sym
{
T 56200 43400 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 57100 43500 5 10 1 1 0 0 1
refdes=B_pu
T 57100 42900 5 10 1 1 0 0 1
value=I=V(Ipu)*V(Kpu)
}
C 56800 43900 1 0 0 vdd-1.sym
N 57000 42800 57000 42600 4
N 57000 43700 57000 43900 4
C 48000 37600 1 0 0 resistor-1.sym
{
T 48300 38000 5 10 0 0 0 0 1
device=RESISTOR
T 48000 37900 5 10 1 1 0 0 1
refdes=R_fixture0
T 47900 37400 5 10 1 1 0 0 1
value={R_fixture0}
}
C 48900 37500 1 270 0 voltage-3.sym
{
T 49600 37300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 49200 37300 5 10 1 1 0 0 1
refdes=V_fixture0
T 49200 36700 5 10 1 1 0 0 1
value=DC {V_fixture0}
}
N 48900 37700 49100 37700 4
{
T 48900 37700 5 10 1 1 0 0 1
netname=f0b
}
N 49100 37700 49100 37500 4
C 49000 36300 1 0 0 gnd-1.sym
C 46100 36300 1 0 0 gnd-1.sym
B 48100 40300 10600 4300 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
C 50100 43700 1 270 0 voltage-3.sym
{
T 50800 43500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 49700 43500 5 10 1 1 0 0 1
refdes=B_Kpu
T 48400 43900 5 10 1 1 0 0 1
value=V=(I(Vfx0) - V(Icomp0) - V(Ipc0) - V(Igc0)) / V(I3)
}
C 50200 42500 1 0 0 gnd-1.sym
N 50300 43700 50700 43700 4
{
T 50300 43700 5 10 1 1 0 0 1
netname=Kpu
}
C 47800 37900 1 180 0 current-1.sym
{
T 47200 36900 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 46800 37900 5 10 1 1 0 0 1
refdes=Vfx0
T 46800 37400 5 10 1 1 0 0 1
value=DC 0
}
N 46200 37500 46200 37700 4
N 47800 37700 48000 37700 4
{
T 47800 37700 5 10 1 1 0 0 1
netname=f0a
}
C 53000 43700 1 270 0 voltage-3.sym
{
T 53700 43500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 53500 43200 5 10 1 1 0 0 1
refdes=B_pullup
T 53500 43000 5 10 1 1 0 0 1
value=V=pwl(V(Vdd, pad) $pullup0)
}
C 53100 42500 1 0 0 gnd-1.sym
N 53200 43700 53800 43700 4
{
T 53400 43700 5 10 1 1 0 0 1
netname=Ipu
}
N 52900 35900 52300 35900 4
{
T 52300 35900 5 10 1 1 0 0 1
netname=Igc0
}
C 46000 37500 1 270 0 voltage-3.sym
{
T 46700 37300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 46300 37300 5 10 1 1 0 0 1
refdes=B0
T 45900 35700 5 10 1 1 0 0 3
value=V=V(up) > 0 ? 
+    pwl(V(ru_time) $rising_waveform0) :
+    pwl(V(fu_time) $falling_waveform0)
}
C 53300 34600 1 90 0 vexp-1.sym
{
T 51500 35250 5 10 1 1 0 0 1
refdes=A_comp0
T 52450 35300 5 10 0 0 90 0 1
device=vexp
T 52250 35300 5 10 0 0 90 0 1
footprint=none
T 53100 35250 5 10 1 1 0 0 1
value=comp0
}
N 53300 34900 54000 34900 4
{
T 53300 34900 5 10 1 1 0 0 1
netname=Icomp0
}
C 52300 38100 1 0 1 voltage-3.sym
{
T 52100 38800 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 51300 38600 5 10 1 1 0 0 1
refdes=B_pullup0
T 53100 38600 5 10 1 1 0 0 1
value=V=pwl({pullup_reference} - V(fixture0) $pullup0)
}
C 51300 38000 1 0 0 gnd-1.sym
N 52300 38300 52900 38300 4
{
T 52300 38300 5 10 1 1 0 0 1
netname=I3
}
C 52300 37300 1 0 1 voltage-3.sym
{
T 52100 38000 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 51300 37800 5 10 1 1 0 0 1
refdes=B_power_clamp0
T 53100 37800 5 10 1 1 0 0 1
value=V=pwl({power_clamp_reference} - V(fixture0) $power_clamp0)
}
C 51300 37200 1 0 0 gnd-1.sym
N 52900 37500 52300 37500 4
{
T 52300 37500 5 10 1 1 0 0 1
netname=Ipc0
}
C 52300 36100 1 180 0 voltage-3.sym
{
T 52100 35400 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 51300 36200 5 10 1 1 0 0 1
refdes=B_gnd_clamp0
T 53100 36200 5 10 1 1 0 0 1
value=V=pwl(V(fixture0) - {gnd_clamp_reference} $gnd_clamp0)
}
C 51300 35600 1 0 0 gnd-1.sym
N 51400 34900 52100 34900 4
{
T 51200 34900 5 10 1 1 0 0 1
netname=fixture0
}
T 48100 44700 9 10 1 0 0 0 1
IBIS Gate Model
C 45900 43300 1 180 1 current-1.sym
{
T 46500 42300 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 45700 43300 5 10 1 1 0 0 1
refdes=A_rtime
T 45700 42800 5 10 1 1 0 0 1
value=rtime
}
N 45400 43100 45900 43100 4
{
T 45400 43100 5 10 1 1 0 0 1
netname=[out]
}
N 46800 43100 47300 43100 4
{
T 46700 43100 5 10 1 1 0 0 1
netname=[ru_time]
}
C 45900 42500 1 180 1 current-1.sym
{
T 46500 41500 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 45700 42500 5 10 1 1 0 0 1
refdes=A_dtime
T 45700 42000 5 10 1 1 0 0 1
value=ftime
}
N 45400 42300 45900 42300 4
{
T 45300 42300 5 10 1 1 0 0 1
netname=[~out]
}
N 46800 42300 47300 42300 4
{
T 46700 42300 5 10 1 1 0 0 1
netname=[fu_time]
}
C 45900 41700 1 180 1 current-1.sym
{
T 46500 40700 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 45700 41700 5 10 1 1 0 0 1
refdes=A_sel
T 45700 41200 5 10 1 1 0 0 1
value=dac
}
N 45400 41500 45900 41500 4
{
T 45300 41500 5 10 1 1 0 0 1
netname=[out]
}
N 46800 41500 47300 41500 4
{
T 46700 41500 5 10 1 1 0 0 1
netname=[up]
}
C 39500 43200 1 0 0 spice-directive-1.sym
{
T 39600 43500 5 10 0 1 0 0 1
device=directive
T 39500 43400 5 10 1 1 180 6 11
value=.MODEL dac dac_bridge(t_rise=0 t_fall=0)
.PARAM rising_waveform_max10={rising_waveform_max / 10}
.MODEL rtime dac_bridge(out_low=0
+	out_high={rising_waveform_max}
+	t_rise={rising_waveform_max}
+	t_fall={rising_waveform_max10})
.PARAM falling_waveform_max10={falling_waveform_max / 10}
.MODEL ftime dac_bridge(out_low=0
+	out_high={falling_waveform_max}
+	t_rise={falling_waveform_max}
+	t_fall={falling_waveform_max10})
T 39600 43600 5 10 1 1 0 0 1
refdes=_dac
}
C 39500 40500 1 0 0 spice-directive-1.sym
{
T 39600 40800 5 10 0 1 0 0 1
device=directive
T 39500 40700 5 10 1 1 180 6 5
value=.PARAM c_comp_tot={C_comp +
+     C_comp_pullup + C_comp_pulldown +
+     C_comp_power_clamp + C_comp_gnd_clamp}
.MODEL comp0 d_dt(gain={C_comp_tot+C_fixture0}
+    out_lower_limit=-1e12 out_upper_limit=1e12)
T 39600 40900 5 10 1 1 0 0 1
refdes=_comp
}
B 44900 40300 2900 4300 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
T 44900 44700 9 10 1 0 0 0 1
Control Logic
T 44900 40000 9 10 1 0 0 0 1
Models for fixture

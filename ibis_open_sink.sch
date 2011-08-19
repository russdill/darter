v 20110115 2
B 43300 33700 13800 6100 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
C 49600 42600 1 0 0 gnd-1.sym
N 49500 42900 49700 42900 4
{
T 49500 42900 5 10 1 1 0 0 1
netname=0
}
N 44600 37500 45300 37500 4
{
T 44600 37500 5 10 1 1 0 0 1
netname=fixture0
}
N 55400 42500 56600 42500 4
{
T 56200 42600 5 10 1 1 0 0 1
netname=pad
}
C 55200 42300 1 270 0 current-1.sym
{
T 56200 41700 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 55500 42100 5 10 1 1 0 0 1
refdes=B_pd
T 55500 41500 5 10 1 1 0 0 1
value=I=V(Ipd)*V(Kpd)
}
C 55600 41200 1 180 0 vss-1.sym
N 55400 42500 55400 42300 4
N 55400 41200 55400 41400 4
C 46400 37400 1 0 0 resistor-1.sym
{
T 46700 37800 5 10 0 0 0 0 1
device=RESISTOR
T 46400 37700 5 10 1 1 0 0 1
refdes=R_fixture0
T 46300 37200 5 10 1 1 0 0 1
value={R_fixture0}
}
C 47300 37300 1 270 0 voltage-3.sym
{
T 48000 37100 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 47600 37100 5 10 1 1 0 0 1
refdes=V_fixture0
T 47600 36500 5 10 1 1 0 0 1
value=DC {V_fixture0}
}
N 47300 37500 47500 37500 4
{
T 47300 37500 5 10 1 1 0 0 1
netname=f0b
}
N 47500 37500 47500 37300 4
C 47400 36100 1 0 0 gnd-1.sym
C 44500 36100 1 0 0 gnd-1.sym
B 46600 40200 10500 4300 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
C 48500 41500 1 270 0 voltage-3.sym
{
T 49200 41300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 48100 41300 5 10 1 1 0 0 1
refdes=B_Kpd
T 46700 41700 5 10 1 1 0 0 1
value=V=(I(Vfx0) - V(Icomp0) - V(Ipc0) - V(Igc0)) / V(I2)
}
C 48600 40300 1 0 0 gnd-1.sym
N 48700 41500 49100 41500 4
{
T 48700 41500 5 10 1 1 0 0 1
netname=Kpd
}
C 46200 37700 1 180 0 current-1.sym
{
T 45600 36700 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 45200 37700 5 10 1 1 0 0 1
refdes=Vfx0
T 45200 37200 5 10 1 1 0 0 1
value=DC 0
}
N 44600 37300 44600 37500 4
N 46200 37500 46400 37500 4
{
T 46200 37500 5 10 1 1 0 0 1
netname=f0a
}
C 51400 41500 1 270 0 voltage-3.sym
{
T 52100 41300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 51900 41000 5 10 1 1 0 0 1
refdes=B_pulldown
T 51900 40800 5 10 1 1 0 0 1
value=V=pwl(V(pad, Vss) $pulldown0)
}
C 51500 40300 1 0 0 gnd-1.sym
N 51600 41500 52200 41500 4
{
T 51800 41500 5 10 1 1 0 0 1
netname=Ipd
}
N 51300 36500 50700 36500 4
{
T 50700 36500 5 10 1 1 0 0 1
netname=I2
}
N 51300 35700 50700 35700 4
{
T 50700 35700 5 10 1 1 0 0 1
netname=Igc0
}
C 44400 37300 1 270 0 voltage-3.sym
{
T 45100 37100 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 44700 37100 5 10 1 1 0 0 1
refdes=B0
T 44300 35500 5 10 1 1 0 0 3
value=V=V(on) > 0 ? 
+    pwl(V(ru_time) $rising_waveform0) :
+    pwl(V(fu_time) $falling_waveform0)
}
C 51700 34400 1 90 0 vexp-1.sym
{
T 49900 35050 5 10 1 1 0 0 1
refdes=A_comp0
T 50850 35100 5 10 0 0 90 0 1
device=vexp
T 50650 35100 5 10 0 0 90 0 1
footprint=none
T 51500 35050 5 10 1 1 0 0 1
value=comp0
}
N 51700 34700 52400 34700 4
{
T 51700 34700 5 10 1 1 0 0 1
netname=Icomp0
}
C 50700 37100 1 0 1 voltage-3.sym
{
T 50500 37800 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 49700 37600 5 10 1 1 0 0 1
refdes=B_power_clamp0
T 51500 37600 5 10 1 1 0 0 1
value=V=pwl({power_clamp_reference} - V(fixture0) $power_clamp0)
}
C 49700 37000 1 0 0 gnd-1.sym
N 51300 37300 50700 37300 4
{
T 50700 37300 5 10 1 1 0 0 1
netname=Ipc0
}
C 50700 36300 1 0 1 voltage-3.sym
{
T 50500 37000 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 49700 36800 5 10 1 1 0 0 1
refdes=B_pulldown0
T 51500 36800 5 10 1 1 0 0 1
value=V=pwl(V(fixture0) - {pulldown_reference} $pulldown0)
}
C 49700 36200 1 0 0 gnd-1.sym
C 50700 35900 1 180 0 voltage-3.sym
{
T 50500 35200 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 49700 36000 5 10 1 1 0 0 1
refdes=B_gnd_clamp0
T 51500 36000 5 10 1 1 0 0 1
value=V=pwl(V(fixture0) - {gnd_clamp_reference} $gnd_clamp0)
}
C 49700 35400 1 0 0 gnd-1.sym
N 49800 34700 50500 34700 4
{
T 49600 34700 5 10 1 1 0 0 1
netname=fixture0
}
T 43300 39900 9 10 1 0 0 0 1
Models for fixture
T 43400 39500 9 10 1 0 0 0 1
Fixture 0
T 46300 44600 9 10 1 0 0 0 1
IBIS Gate Model
C 37900 43200 1 0 0 spice-directive-1.sym
{
T 38000 43500 5 10 0 1 0 0 1
device=directive
T 37900 43400 5 10 1 1 180 6 11
value=.MODEL dac dac_bridge(t_rise=0 t_fall=0)
.PARAM rising_waveform_max10={rising_waveform_max / 10}
.MODEL rtime dac_bridge(
+	out_high={rising_waveform_max}
+	t_rise={rising_waveform_max}
+	t_fall={rising_waveform_max10})
.PARAM falling_waveform_max10={falling_waveform_max / 10}
.MODEL ftime dac_bridge(
+	out_high={falling_waveform_max}
+	t_rise={falling_waveform_max}
+	t_fall={falling_waveform_max10})
T 38000 43600 5 10 1 1 0 0 1
refdes=_dac
}
C 37900 40500 1 0 0 spice-directive-1.sym
{
T 38000 40800 5 10 0 1 0 0 1
device=directive
T 37900 40700 5 10 1 1 180 6 5
value=.PARAM c_comp_tot={C_comp +
+     C_comp_pullup + C_comp_pulldown +
+     C_comp_power_clamp + C_comp_gnd_clamp}
.MODEL comp0 d_dt(gain={C_comp_tot+C_fixture0}
+    out_lower_limit=-1e12 out_upper_limit=1e12)
T 38000 40900 5 10 1 1 0 0 1
refdes=_comp
}
C 44300 43200 1 180 1 current-1.sym
{
T 44900 42200 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 44100 43200 5 10 1 1 0 0 1
refdes=A_rtime
T 44100 42700 5 10 1 1 0 0 1
value=rtime
}
N 43800 43000 44300 43000 4
{
T 43800 43000 5 10 1 1 0 0 1
netname=[out]
}
N 45200 43000 45700 43000 4
{
T 45100 43000 5 10 1 1 0 0 1
netname=[ru_time]
}
C 44300 42400 1 180 1 current-1.sym
{
T 44900 41400 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 44100 42400 5 10 1 1 0 0 1
refdes=A_dtime
T 44100 41900 5 10 1 1 0 0 1
value=ftime
}
N 43800 42200 44300 42200 4
{
T 43700 42200 5 10 1 1 0 0 1
netname=[~out]
}
N 45200 42200 45700 42200 4
{
T 45100 42200 5 10 1 1 0 0 1
netname=[fu_time]
}
C 44300 41600 1 180 1 current-1.sym
{
T 44900 40600 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 44100 41600 5 10 1 1 0 0 1
refdes=A_sel
T 44100 41100 5 10 1 1 0 0 1
value=dac
}
N 43800 41400 44300 41400 4
{
T 43700 41400 5 10 1 1 0 0 1
netname=[out]
}
N 45200 41400 45700 41400 4
{
T 45100 41400 5 10 1 1 0 0 1
netname=[up]
}
B 43300 40200 2900 4300 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
T 37900 43900 8 10 1 0 0 0 1
dist-license=GPL2+
T 37906 44100 8 10 1 0 0 0 1
dist-license=GPL2+
T 37906 44300 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
T 43300 44600 9 10 1 0 0 0 1
Control Logic

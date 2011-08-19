v 20110115 2
N 46000 38800 46700 38800 4
{
T 46000 38800 5 10 1 1 0 0 1
netname=fixture0
}
N 70800 43700 72000 43700 4
{
T 71600 43800 5 10 1 1 0 0 1
netname=pad
}
C 71000 43900 1 90 0 current-1.sym
{
T 70000 44500 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 70900 44600 5 10 1 1 0 0 1
refdes=B_pu
T 70900 44000 5 10 1 1 0 0 1
value=I=V(Ipu)*V(Kpu)
}
C 70600 43500 1 270 0 current-1.sym
{
T 71600 42900 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 70900 43300 5 10 1 1 0 0 1
refdes=B_pd
T 70900 42700 5 10 1 1 0 0 1
value=I=V(Ipd)*V(Kpd)
}
C 71000 42400 1 180 0 vss-1.sym
C 70600 45000 1 0 0 vdd-1.sym
N 70800 43900 70800 43500 4
N 70800 44800 70800 45000 4
N 70800 42400 70800 42600 4
C 47800 38700 1 0 0 resistor-1.sym
{
T 48100 39100 5 10 0 0 0 0 1
device=RESISTOR
T 47800 39000 5 10 1 1 0 0 1
refdes=R_fixture0
T 47700 38500 5 10 1 1 0 0 1
value={R_fixture0}
}
C 48700 38600 1 270 0 voltage-3.sym
{
T 49400 38400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 49000 38400 5 10 1 1 0 0 1
refdes=V_fixture0
T 49000 37800 5 10 1 1 0 0 1
value=DC {V_fixture0}
}
N 48700 38800 48900 38800 4
{
T 48700 38800 5 10 1 1 0 0 1
netname=f0b
}
N 48900 38800 48900 38600 4
C 48800 37400 1 0 0 gnd-1.sym
C 45900 37400 1 0 0 gnd-1.sym
B 44900 34700 27900 6200 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
B 61700 41400 11100 4300 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
L 58900 40700 58900 34900 3 0 0 2 150 150
T 45100 40600 9 10 1 0 0 0 1
Fixture 0
T 59000 40600 9 10 1 0 0 0 1
Fixture 1
T 61700 45800 9 10 1 0 0 0 1
IBIS Gate Model
T 45100 44600 8 10 1 0 0 0 1
use-license=GPL2+
T 45106 44800 8 10 1 0 0 0 1
dist-license=GPL2+
T 45106 45000 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 62800 41900 1 0 0 gnd-1.sym
N 62700 42200 62900 42200 4
{
T 62700 42200 5 10 1 1 0 0 1
netname=0
}
C 63900 42700 1 270 0 voltage-3.sym
{
T 64600 42500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 63500 42500 5 10 1 1 0 0 1
refdes=B_Kpd
T 62100 42900 5 10 1 1 0 0 3
value=V=((I(Vfx0) - V(Icomp0) - V(Ipc0) - V(Igc0)) * V(I4) +
+      (I(Vfx1) - V(Icomp1) - V(Ipc0) - V(Igc0)) * -V(I3)) /
+   (V(I1) * V(I3) - V(I2) * V(I4))
}
C 63900 44800 1 270 0 voltage-3.sym
{
T 64600 44600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 63500 44600 5 10 1 1 0 0 1
refdes=B_Kpu
T 62200 45000 5 10 1 1 0 0 3
value=V=((I(Vfx0) - V(Icomp0) - V(Ipc0) - V(Igc0)) * V(I1) + 
+      (I(Vfx1) - V(Icomp1) - V(Ipc1) - V(Igc1)) * -V(I2)) /
+    ( V(I1) * V(I3) - V(I2) * V(I4))
}
C 64000 43600 1 0 0 gnd-1.sym
C 64000 41500 1 0 0 gnd-1.sym
N 64100 42700 64500 42700 4
{
T 64100 42700 5 10 1 1 0 0 1
netname=Kpd
}
N 64100 44800 64500 44800 4
{
T 64100 44800 5 10 1 1 0 0 1
netname=Kpu
}
C 47600 39000 1 180 0 current-1.sym
{
T 47000 38000 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 46600 39000 5 10 1 1 0 0 1
refdes=Vfx0
T 46600 38500 5 10 1 1 0 0 1
value=DC 0
}
N 46000 38600 46000 38800 4
N 47600 38800 47800 38800 4
{
T 47600 38800 5 10 1 1 0 0 1
netname=f0a
}
N 60000 38800 60700 38800 4
{
T 60000 38800 5 10 1 1 0 0 1
netname=fixture1
}
C 61800 38700 1 0 0 resistor-1.sym
{
T 62100 39100 5 10 0 0 0 0 1
device=RESISTOR
T 61800 39000 5 10 1 1 0 0 1
refdes=R_fixture1
T 61700 38500 5 10 1 1 0 0 1
value={R_fixture1}
}
C 62700 38600 1 270 0 voltage-3.sym
{
T 63400 38400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 63000 38400 5 10 1 1 0 0 1
refdes=V_fixture1
T 63000 37800 5 10 1 1 0 0 1
value=DC {V_fixture1}
}
N 62700 38800 62900 38800 4
{
T 62700 38800 5 10 1 1 0 0 1
netname=f1b
}
N 62900 38800 62900 38600 4
C 62800 37400 1 0 0 gnd-1.sym
C 59900 37400 1 0 0 gnd-1.sym
C 61600 39000 1 180 0 current-1.sym
{
T 61000 38000 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 60600 39000 5 10 1 1 0 0 1
refdes=Vfx1
T 60600 38500 5 10 1 1 0 0 1
value=DC 0
}
N 60000 38600 60000 38800 4
N 61600 38800 61800 38800 4
{
T 61600 38800 5 10 1 1 0 0 1
netname=f1a
}
C 66800 44800 1 270 0 voltage-3.sym
{
T 67500 44600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 67300 44300 5 10 1 1 0 0 1
refdes=B_pullup
T 67300 44100 5 10 1 1 0 0 1
value=V=pwl(V(Vdd, pad) $pullup0)
}
C 66900 43600 1 0 0 gnd-1.sym
N 67000 44800 67600 44800 4
{
T 67200 44800 5 10 1 1 0 0 1
netname=Ipu
}
C 66800 42700 1 270 0 voltage-3.sym
{
T 67500 42500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 67300 42200 5 10 1 1 0 0 1
refdes=B_pulldown
T 67300 42000 5 10 1 1 0 0 1
value=V=pwl(V(pad, Vss) $pulldown0)
}
C 66900 41500 1 0 0 gnd-1.sym
N 67000 42700 67600 42700 4
{
T 67200 42700 5 10 1 1 0 0 1
netname=Ipd
}
N 52700 37800 52100 37800 4
{
T 52100 37800 5 10 1 1 0 0 1
netname=I2
}
N 52700 37000 52100 37000 4
{
T 52100 37000 5 10 1 1 0 0 1
netname=Igc0
}
C 45800 38600 1 270 0 voltage-3.sym
{
T 46500 38400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 46100 38400 5 10 1 1 0 0 1
refdes=B0
T 45700 36800 5 10 1 1 0 0 3
value=V=V(up) > 0 ? 
+    pwl(V(ru_time) $rising_waveform0) :
+    pwl(V(fu_time) $falling_waveform0)
}
C 53100 35700 1 90 0 vexp-1.sym
{
T 51300 36350 5 10 1 1 0 0 1
refdes=A_comp0
T 52250 36400 5 10 0 0 90 0 1
device=vexp
T 52050 36400 5 10 0 0 90 0 1
footprint=none
T 52900 36350 5 10 1 1 0 0 1
value=comp0
}
N 53100 36000 53800 36000 4
{
T 53100 36000 5 10 1 1 0 0 1
netname=Icomp0
}
C 52100 39200 1 0 1 voltage-3.sym
{
T 51900 39900 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 51100 39700 5 10 1 1 0 0 1
refdes=B_pullup0
T 52900 39700 5 10 1 1 0 0 1
value=V=pwl({pullup_reference} - V(fixture0) $pullup0)
}
C 51100 39100 1 0 0 gnd-1.sym
N 52100 39400 52700 39400 4
{
T 52100 39400 5 10 1 1 0 0 1
netname=I3
}
C 52100 38400 1 0 1 voltage-3.sym
{
T 51900 39100 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 51100 38900 5 10 1 1 0 0 1
refdes=B_power_clamp0
T 52900 38900 5 10 1 1 0 0 1
value=V=pwl({power_clamp_reference} - V(fixture0) $power_clamp0)
}
C 51100 38300 1 0 0 gnd-1.sym
N 52700 38600 52100 38600 4
{
T 52100 38600 5 10 1 1 0 0 1
netname=Ipc0
}
C 52100 37600 1 0 1 voltage-3.sym
{
T 51900 38300 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 51100 38100 5 10 1 1 0 0 1
refdes=B_pulldown0
T 52900 38100 5 10 1 1 0 0 1
value=V=pwl(V(fixture0) - {pulldown_reference} $pulldown0)
}
C 51100 37500 1 0 0 gnd-1.sym
C 52100 37200 1 180 0 voltage-3.sym
{
T 51900 36500 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 51100 37300 5 10 1 1 0 0 1
refdes=B_gnd_clamp0
T 52900 37300 5 10 1 1 0 0 1
value=V=pwl(V(fixture0) - {gnd_clamp_reference} $gnd_clamp0)
}
C 51100 36700 1 0 0 gnd-1.sym
N 51200 36000 51900 36000 4
{
T 51000 36000 5 10 1 1 0 0 1
netname=fixture0
}
N 66700 37800 66100 37800 4
{
T 66100 37800 5 10 1 1 0 0 1
netname=I1
}
N 66700 37000 66100 37000 4
{
T 66100 37000 5 10 1 1 0 0 1
netname=Igc1
}
C 59800 38600 1 270 0 voltage-3.sym
{
T 60500 38400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 60100 38400 5 10 1 1 0 0 1
refdes=B1
T 59700 36800 5 10 1 1 0 0 3
value=V=V(up) > 0 ? 
+    pwl(V(ru_time) $rising_waveform1) :
+    pwl(V(fu_time) $falling_waveform1)
}
C 67100 35700 1 90 0 vexp-1.sym
{
T 65300 36350 5 10 1 1 0 0 1
refdes=A_comp1
T 66250 36400 5 10 0 0 90 0 1
device=vexp
T 66050 36400 5 10 0 0 90 0 1
footprint=none
T 66900 36350 5 10 1 1 0 0 1
value=comp1
}
N 67100 36000 67800 36000 4
{
T 67100 36000 5 10 1 1 0 0 1
netname=Icomp1
}
C 66100 39200 1 0 1 voltage-3.sym
{
T 65900 39900 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 65100 39700 5 10 1 1 0 0 1
refdes=B_pullup1
T 66900 39700 5 10 1 1 0 0 1
value=V=pwl({pullup_reference} - V(fixture1) $pullup0)
}
C 65100 39100 1 0 0 gnd-1.sym
N 66100 39400 66700 39400 4
{
T 66100 39400 5 10 1 1 0 0 1
netname=I4
}
C 66100 38400 1 0 1 voltage-3.sym
{
T 65900 39100 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 65100 38900 5 10 1 1 0 0 1
refdes=B_power_clamp1
T 66900 38900 5 10 1 1 0 0 1
value=V=pwl({power_clamp_reference} - V(fixture1) $power_clamp0)
}
C 65100 38300 1 0 0 gnd-1.sym
N 66700 38600 66100 38600 4
{
T 66100 38600 5 10 1 1 0 0 1
netname=Ipc1
}
C 66100 37600 1 0 1 voltage-3.sym
{
T 65900 38300 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 65100 38100 5 10 1 1 0 0 1
refdes=B_pulldown1
T 66900 38100 5 10 1 1 0 0 1
value=V=pwl(V(fixture1) - {pulldown_reference} $pulldown0)
}
C 65100 37500 1 0 0 gnd-1.sym
C 66100 37200 1 180 0 voltage-3.sym
{
T 65900 36500 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 65100 37300 5 10 1 1 0 0 1
refdes=B_gnd_clamp1
T 66900 37300 5 10 1 1 0 0 1
value=V=pwl(V(fixture1) - {gnd_clamp_reference} $gnd_clamp0)
}
C 65100 36700 1 0 0 gnd-1.sym
N 65200 36000 65900 36000 4
{
T 65000 36000 5 10 1 1 0 0 1
netname=fixture1
}
C 59000 44400 1 180 1 current-1.sym
{
T 59600 43400 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 58800 44400 5 10 1 1 0 0 1
refdes=A_rtime
T 58800 43900 5 10 1 1 0 0 1
value=rtime
}
N 58500 44200 59000 44200 4
{
T 58500 44200 5 10 1 1 0 0 1
netname=[out]
}
N 59900 44200 60400 44200 4
{
T 59800 44200 5 10 1 1 0 0 1
netname=[ru_time]
}
C 59000 43600 1 180 1 current-1.sym
{
T 59600 42600 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 58800 43600 5 10 1 1 0 0 1
refdes=A_dtime
T 58800 43100 5 10 1 1 0 0 1
value=ftime
}
N 58500 43400 59000 43400 4
{
T 58400 43400 5 10 1 1 0 0 1
netname=[~out]
}
N 59900 43400 60400 43400 4
{
T 59800 43400 5 10 1 1 0 0 1
netname=[fu_time]
}
C 59000 42800 1 180 1 current-1.sym
{
T 59600 41800 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 58800 42800 5 10 1 1 0 0 1
refdes=A_sel
T 58800 42300 5 10 1 1 0 0 1
value=dac
}
N 58500 42600 59000 42600 4
{
T 58400 42600 5 10 1 1 0 0 1
netname=[out]
}
N 59900 42600 60400 42600 4
{
T 59800 42600 5 10 1 1 0 0 1
netname=[up]
}
C 45100 43800 1 0 0 spice-directive-1.sym
{
T 45200 44100 5 10 0 1 0 0 1
device=directive
T 45100 44000 5 10 1 1 180 6 11
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
T 45200 44200 5 10 1 1 0 0 1
refdes=_dac
}
C 52100 43800 1 0 0 spice-directive-1.sym
{
T 52200 44100 5 10 0 1 0 0 1
device=directive
T 52100 44000 5 10 1 1 180 6 7
value=.PARAM c_comp_tot={C_comp +
+     C_comp_pullup + C_comp_pulldown +
+     C_comp_power_clamp + C_comp_gnd_clamp}
.MODEL comp0 d_dt(gain={C_comp_tot+C_fixture0}
+    out_lower_limit=-1e12 out_upper_limit=1e12)
.MODEL comp1 d_dt(gain={C_comp_tot+C_fixture1}
+    out_lower_limit=-1e12 out_upper_limit=1e12)
T 52200 44200 5 10 1 1 0 0 1
refdes=_comp
}
B 57700 41400 3600 4300 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
T 57700 45800 9 10 1 0 0 0 1
Control Logic
T 44900 41000 9 10 1 0 0 0 1
Models for fixture

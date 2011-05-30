v 20110115 2
C 36800 44600 1 0 0 spice-directive-1.sym
{
T 36900 44900 5 10 0 1 0 0 1
device=directive
T 36900 45000 5 10 1 1 0 0 1
refdes=Atime
T 36800 44700 5 10 1 1 0 0 1
value=.MODEL time slew(rise_slope=1 fall_slope=10)
}
C 37900 38800 1 0 0 gnd-1.sym
C 37700 36300 1 0 0 vdc-1.sym
{
T 37200 37250 5 10 1 1 0 0 1
refdes=B_fu_on
T 38400 37150 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 38400 37350 5 10 0 0 0 0 1
footprint=none
T 37100 35800 5 10 1 1 0 0 1
value=V=V(out) > 0 ? 0 : {falling_waveform_max}
}
N 46000 38800 46700 38800 4
{
T 46000 38800 5 10 1 1 0 0 1
netname=fixture0
}
C 37900 36000 1 0 0 gnd-1.sym
C 37700 39100 1 0 0 vdc-1.sym
{
T 37200 40050 5 10 1 1 0 0 1
refdes=B_ru_on
T 38400 39950 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 38400 40150 5 10 0 0 0 0 1
footprint=none
T 37200 38550 5 10 1 1 0 0 1
value=V=V(out) > 0 ? {rising_waveform_max} : 0
}
N 52800 43700 54000 43700 4
{
T 53600 43800 5 10 1 1 0 0 1
netname=pad
}
C 53000 43900 1 90 0 current-1.sym
{
T 52000 44500 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 52900 44600 5 10 1 1 0 0 1
refdes=B_pu
T 52900 44000 5 10 1 1 0 0 1
value=I=V(Ipu)*V(Kpu)
}
C 52600 43500 1 270 0 current-1.sym
{
T 53600 42900 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 52900 43300 5 10 1 1 0 0 1
refdes=B_pd
T 52900 42700 5 10 1 1 0 0 1
value=I=V(Ipd)*V(Kpd)
}
C 53000 42400 1 180 0 vss-1.sym
C 52600 45000 1 0 0 vdd-1.sym
N 52800 43900 52800 43500 4
N 52800 44800 52800 45000 4
N 52800 42400 52800 42600 4
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
B 36800 34700 36000 6200 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
B 43700 41400 11100 4300 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
L 44900 40700 44900 34900 3 0 0 2 150 150
L 58900 40700 58900 34900 3 0 0 2 150 150
T 45100 40600 9 10 1 0 0 0 1
Fixture 0
T 59000 40600 9 10 1 0 0 0 1
Fixture 1
T 43700 45800 9 10 1 0 0 0 1
IBIS Gate Model
T 36800 45400 8 10 1 0 0 0 1
dist-license=GPLv3
T 36806 45600 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 42800 41500 1 0 0 gnd-1.sym
N 42700 41800 42900 41800 4
{
T 42700 41800 5 10 1 1 0 0 1
netname=0
}
C 45900 42700 1 270 0 voltage-3.sym
{
T 46600 42500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 45500 42500 5 10 1 1 0 0 1
refdes=B_Kpd
T 44100 42900 5 10 1 1 0 0 3
value=V=((I(Vfx0) - V(Icomp0) + V(Ipc0) + V(Igc0)) * V(I4) +
+      (I(Vfx1) - V(Icomp1) + V(Ipc0) + V(Igc0)) * -V(I3)) /
+   (V(I1) * V(I3) - V(I2) * V(I4))
}
C 45900 44800 1 270 0 voltage-3.sym
{
T 46600 44600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 45500 44600 5 10 1 1 0 0 1
refdes=B_Kpu
T 44200 45000 5 10 1 1 0 0 3
value=V=((I(Vfx0) - V(Icomp0) + V(Ipc0) + V(Igc0)) * V(I1) + 
+      (I(Vfx1) - V(Icomp1) + V(Ipc1) + V(Igc1)) * -V(I2)) /
+    ( V(I1) * V(I3) - V(I2) * V(I4))
}
C 46000 43600 1 0 0 gnd-1.sym
C 46000 41500 1 0 0 gnd-1.sym
N 46100 42700 46500 42700 4
{
T 46100 42700 5 10 1 1 0 0 1
netname=Kpd
}
N 46100 44800 46500 44800 4
{
T 46100 44800 5 10 1 1 0 0 1
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
C 36800 43900 1 0 0 spice-directive-1.sym
{
T 36900 44200 5 10 0 1 0 0 1
device=directive
T 36900 44300 5 10 1 1 0 0 1
refdes=Apc
T 36800 43600 5 10 1 1 0 0 3
value=.PARAM c_comp_tot={C_comp +
+     C_comp_pullup + C_comp_pulldown +
+     C_comp_power_clamp + C_comp_gnd_clamp}
}
C 36800 42800 1 0 0 spice-directive-1.sym
{
T 36900 43100 5 10 0 1 0 0 1
device=directive
T 36900 43200 5 10 1 1 0 0 1
refdes=Amc0
T 36800 42600 5 10 1 1 0 0 2
value=.MODEL comp0 d_dt(gain={C_comp_tot+C_fixture0}
+    out_lower_limit=-1e12 out_upper_limit=1e12)
}
C 36800 41900 1 0 0 spice-directive-1.sym
{
T 36900 42200 5 10 0 1 0 0 1
device=directive
T 36900 42300 5 10 1 1 0 0 1
refdes=Amc1
T 36800 41700 5 10 1 1 0 0 2
value=.MODEL comp1 d_dt(gain={C_comp_tot+C_fixture1}
+    out_lower_limit=-1e12 out_upper_limit=1e12)
}
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
C 40000 40000 1 90 0 vexp-1.sym
{
T 39700 40550 5 10 1 1 0 0 1
refdes=A_ru_time
T 39150 40700 5 10 0 0 90 0 1
device=vexp
T 38950 40700 5 10 0 0 90 0 1
footprint=none
T 39700 40050 5 10 1 1 0 0 1
value=time
}
N 40000 40300 41700 40300 4
{
T 40400 40300 5 10 1 1 0 0 1
netname=ru_time
}
C 40100 37200 1 90 0 vexp-1.sym
{
T 39800 37750 5 10 1 1 0 0 1
refdes=A_fu_time
T 39250 37900 5 10 0 0 90 0 1
device=vexp
T 39050 37900 5 10 0 0 90 0 1
footprint=none
T 39800 37150 5 10 1 1 0 0 1
value=time
}
N 41700 37500 40100 37500 4
{
T 40400 37500 5 10 1 1 0 0 1
netname=fu_time
}
N 38000 40300 38800 40300 4
{
T 38000 40300 5 10 1 1 0 0 1
netname=ru_on
}
N 38000 37500 38900 37500 4
{
T 38000 37500 5 10 1 1 0 0 1
netname=fu_on
}
C 48800 44800 1 270 0 voltage-3.sym
{
T 49500 44600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 49300 44300 5 10 1 1 0 0 1
refdes=B_pullup
T 49300 44100 5 10 1 1 0 0 1
value=V=pwl(V(Vdd, pad) $pullup0)
}
C 48900 43600 1 0 0 gnd-1.sym
N 49000 44800 49600 44800 4
{
T 49200 44800 5 10 1 1 0 0 1
netname=Ipu
}
C 48800 42700 1 270 0 voltage-3.sym
{
T 49500 42500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 49300 42200 5 10 1 1 0 0 1
refdes=B_pulldown
T 49300 42000 5 10 1 1 0 0 1
value=V=pwl(V(pad, Vss) $pulldown0)
}
C 48900 41500 1 0 0 gnd-1.sym
N 49000 42700 49600 42700 4
{
T 49200 42700 5 10 1 1 0 0 1
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
value=V=V(ru_on) > 0 ? 
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
value=V=V(ru_on) > 0 ? 
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

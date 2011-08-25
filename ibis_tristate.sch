v 20110115 2
N 70800 43600 72000 43600 4
{
T 71600 43700 5 10 1 1 0 0 1
netname=pad
}
C 71000 43800 1 90 0 current-1.sym
{
T 70000 44400 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 70900 44500 5 10 1 1 0 0 1
refdes=B_pu
T 70900 43900 5 10 1 1 0 0 1
value=I=V(Ipu)*V(Kpu)
}
C 70600 43400 1 270 0 current-1.sym
{
T 71600 42800 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 70900 43200 5 10 1 1 0 0 1
refdes=B_pd
T 70900 42600 5 10 1 1 0 0 1
value=I=V(Ipd)*V(Kpd)
}
C 71000 42300 1 180 0 vss-1.sym
C 70600 44900 1 0 0 vdd-1.sym
N 70800 43800 70800 43400 4
N 70800 44700 70800 44900 4
N 70800 42300 70800 42500 4
B 44900 34700 27900 6200 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
B 60800 41400 12000 4200 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
B 44900 28000 27900 6100 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
T 44900 41000 9 10 1 0 0 0 1
Models for pull-up multiplier
T 44900 34200 9 10 1 0 0 0 1
Models for pull-down multiplier
L 58900 40700 58900 34900 3 0 0 2 150 150
L 58900 33900 58900 28100 3 0 0 2 150 150
T 45000 40600 9 10 1 0 0 0 1
Fixture 0
T 59000 40600 9 10 1 0 0 0 1
Fixture 1
T 60800 45700 9 10 1 0 0 0 1
IBIS Gate Model
T 45400 44900 8 10 1 0 0 0 1
use-license=GPL2+
T 45406 45100 8 10 1 0 0 0 1
dist-license=GPL2+
T 45406 45300 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
T 45000 33800 9 10 1 0 0 0 1
Fixture 0
T 59000 33800 9 10 1 0 0 0 1
Fixture 1
C 61800 41900 1 0 0 gnd-1.sym
N 61700 42200 61900 42200 4
{
T 61700 42200 5 10 1 1 0 0 1
netname=0
}
C 63900 42700 1 270 0 voltage-3.sym
{
T 64600 42500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 63500 42500 5 10 1 1 0 0 1
refdes=B_Kpd
T 61200 42900 5 10 1 1 0 0 3
value=V=((I(Vfx_pd0) - V(Icomp_pd0) - V(Ipc_pd0) - V(Igc_pd0)) * -V(I4_pd) +
+      (I(Vfx_pd1) - V(Icomp_pd1) - V(Ipc_pd1) - V(Igc_pd1)) * V(I3_pd)) /
+   (V(I1_pd) * V(I3_pd) - V(I2_pd) * V(I4_pd))
}
C 63900 44800 1 270 0 voltage-3.sym
{
T 64600 44600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 63500 44600 5 10 1 1 0 0 1
refdes=B_Kpu
T 61200 45000 5 10 1 1 0 0 3
value=V=((I(Vfx_pu0) - V(Icomp_pu0) - V(Ipc_pu0) - V(Igc_pu0)) * V(I1_pu) +
+    (I(Vfx_pu1) - V(Icomp_pu1) - V(Ipc_pu1) - V(Igc_pu1)) * -V(I2_pu)) /
+    (V(I1_pu) * V(I3_pu) - V(I2_pu) * V(I4_pu))
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
C 51400 44200 1 0 0 spice-directive-1.sym
{
T 51500 44500 5 10 0 1 0 0 1
device=directive
T 51400 44400 5 10 1 1 180 6 7
value=.PARAM c_comp_tot={C_comp +
+     C_comp_pullup + C_comp_pulldown +
+     C_comp_power_clamp + C_comp_gnd_clamp}
.MODEL comp0 d_dt(gain={C_comp_tot+C_fixture0}
+    out_lower_limit=-1e12 out_upper_limit=1e12)
.MODEL comp1 d_dt(gain={C_comp_tot+C_fixture1}
+    out_lower_limit=-1e12 out_upper_limit=1e12)
T 51500 44600 5 10 1 1 0 0 1
refdes=_comp
}
C 67400 44800 1 270 0 voltage-3.sym
{
T 68100 44600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 67900 44300 5 10 1 1 0 0 1
refdes=B_pullup
T 67900 44100 5 10 1 1 0 0 1
value=V=pwl(V(Vdd, pad) $pullup0)
}
C 67500 43600 1 0 0 gnd-1.sym
N 67600 44800 68200 44800 4
{
T 67800 44800 5 10 1 1 0 0 1
netname=Ipu
}
C 67400 42700 1 270 0 voltage-3.sym
{
T 68100 42500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 67900 42200 5 10 1 1 0 0 1
refdes=B_pulldown
T 67900 42000 5 10 1 1 0 0 1
value=V=pwl(V(pad, Vss) $pulldown0)
}
C 67500 41500 1 0 0 gnd-1.sym
N 67600 42700 68200 42700 4
{
T 67800 42700 5 10 1 1 0 0 1
netname=Ipd
}
N 45900 38700 46600 38700 4
{
T 45900 38700 5 10 1 1 0 0 1
netname=fixture_pu0
}
C 47700 38600 1 0 0 resistor-1.sym
{
T 48000 39000 5 10 0 0 0 0 1
device=RESISTOR
T 47700 38900 5 10 1 1 0 0 1
refdes=R_fixture_pu0
T 47600 38400 5 10 1 1 0 0 1
value={R_fixture0}
}
C 48600 38500 1 270 0 voltage-3.sym
{
T 49300 38300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 48900 38300 5 10 1 1 0 0 1
refdes=V_fixture_pu0
T 48900 37700 5 10 1 1 0 0 1
value=DC {V_fixture0}
}
N 48600 38700 48800 38700 4
{
T 48600 38700 5 10 1 1 0 0 1
netname=fu0b
}
N 48800 38700 48800 38500 4
C 48700 37300 1 0 0 gnd-1.sym
C 45800 37300 1 0 0 gnd-1.sym
N 52600 37700 52000 37700 4
{
T 52000 37700 5 10 1 1 0 0 1
netname=I2_pu
}
N 52600 36900 52000 36900 4
{
T 52000 36900 5 10 1 1 0 0 1
netname=Igc_pu0
}
C 45700 38500 1 270 0 voltage-3.sym
{
T 46400 38300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 46000 38300 5 10 1 1 0 0 1
refdes=B_pu0
T 45600 36700 5 10 1 1 0 0 3
value=V=V(up) > 0 ? 
+    pwl(V(ru_time) $rising_waveform0) :
+    pwl(V(fu_time) $falling_waveform0)
}
C 47500 38900 1 180 0 current-1.sym
{
T 46900 37900 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 46500 38900 5 10 1 1 0 0 1
refdes=Vfx_pu0
T 46500 38400 5 10 1 1 0 0 1
value=DC 0
}
N 45900 38500 45900 38700 4
C 53000 35600 1 90 0 vexp-1.sym
{
T 51200 36250 5 10 1 1 0 0 1
refdes=A_comp_pu0
T 52150 36300 5 10 0 0 90 0 1
device=vexp
T 51950 36300 5 10 0 0 90 0 1
footprint=none
T 52800 36250 5 10 1 1 0 0 1
value=comp0
}
N 53000 35900 53700 35900 4
{
T 53000 35900 5 10 1 1 0 0 1
netname=Icomp_pu0
}
N 47500 38700 47700 38700 4
{
T 47500 38700 5 10 1 1 0 0 1
netname=fu0a
}
C 52000 39100 1 0 1 voltage-3.sym
{
T 51800 39800 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 51000 39600 5 10 1 1 0 0 1
refdes=B_pullup_pu0
T 52800 39600 5 10 1 1 0 0 1
value=V=pwl({pullup_reference} - V(fixture_pu0) $pullup0)
}
C 51000 39000 1 0 0 gnd-1.sym
N 52000 39300 52600 39300 4
{
T 52000 39300 5 10 1 1 0 0 1
netname=I3_pu
}
C 52000 38300 1 0 1 voltage-3.sym
{
T 51800 39000 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 51000 38800 5 10 1 1 0 0 1
refdes=B_power_clamp_pu0
T 52800 38800 5 10 1 1 0 0 1
value=V=pwl({power_clamp_reference} - V(fixture_pu0) $power_clamp0)
}
C 51000 38200 1 0 0 gnd-1.sym
N 52600 38500 52000 38500 4
{
T 52000 38500 5 10 1 1 0 0 1
netname=Ipc_pu0
}
C 52000 37500 1 0 1 voltage-3.sym
{
T 51800 38200 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 51000 38000 5 10 1 1 0 0 1
refdes=B_pulldown_pu0
T 52800 38000 5 10 1 1 0 0 1
value=V=pwl(V(fixture_pu0) - {pulldown_reference} $pulldown0)
}
C 51000 37400 1 0 0 gnd-1.sym
C 52000 37100 1 180 0 voltage-3.sym
{
T 51800 36400 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 51000 37200 5 10 1 1 0 0 1
refdes=B_gnd_clamp_pu0
T 52800 37200 5 10 1 1 0 0 1
value=V=pwl(V(fixture_pu0) - {gnd_clamp_reference} $gnd_clamp0)
}
C 51000 36600 1 0 0 gnd-1.sym
N 51100 35900 51800 35900 4
{
T 50900 35900 5 10 1 1 0 0 1
netname=fixture_pu0
}
N 59900 38700 60600 38700 4
{
T 59900 38700 5 10 1 1 0 0 1
netname=fixture_pu1
}
C 61700 38600 1 0 0 resistor-1.sym
{
T 62000 39000 5 10 0 0 0 0 1
device=RESISTOR
T 61700 38900 5 10 1 1 0 0 1
refdes=R_fixture_pu1
T 61600 38400 5 10 1 1 0 0 1
value={R_fixture1}
}
C 62600 38500 1 270 0 voltage-3.sym
{
T 63300 38300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 62900 38300 5 10 1 1 0 0 1
refdes=V_fixture_pu1
T 62900 37700 5 10 1 1 0 0 1
value=DC {V_fixture1}
}
N 62600 38700 62800 38700 4
{
T 62600 38700 5 10 1 1 0 0 1
netname=fu1b
}
N 62800 38700 62800 38500 4
C 62700 37300 1 0 0 gnd-1.sym
C 61500 38900 1 180 0 current-1.sym
{
T 60900 37900 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 60500 38900 5 10 1 1 0 0 1
refdes=Vfx_pu1
T 60500 38400 5 10 1 1 0 0 1
value=DC 0
}
N 61500 38700 61700 38700 4
{
T 61500 38700 5 10 1 1 0 0 1
netname=fu1a
}
N 45900 32000 46600 32000 4
{
T 45900 32000 5 10 1 1 0 0 1
netname=fixture_pd0
}
C 47700 31900 1 0 0 resistor-1.sym
{
T 48000 32300 5 10 0 0 0 0 1
device=RESISTOR
T 47700 32200 5 10 1 1 0 0 1
refdes=R_fixture_pd0
T 47600 31700 5 10 1 1 0 0 1
value={R_fixture0}
}
C 48600 31800 1 270 0 voltage-3.sym
{
T 49300 31600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 48900 31600 5 10 1 1 0 0 1
refdes=V_fixture_pd0
T 48900 31000 5 10 1 1 0 0 1
value=DC {V_fixture0}
}
N 48600 32000 48800 32000 4
{
T 48600 32000 5 10 1 1 0 0 1
netname=fd0b
}
N 48800 32000 48800 31800 4
C 48700 30600 1 0 0 gnd-1.sym
C 45800 30600 1 0 0 gnd-1.sym
C 45700 31800 1 270 0 voltage-3.sym
{
T 46400 31600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 46000 31600 5 10 1 1 0 0 1
refdes=B_pd0
T 45700 30000 5 10 1 1 0 0 3
value=V=V(down) > 0 ? 
+    pwl(V(rd_time) $rising_waveform0) :
+    pwl(V(fd_time) $falling_waveform0)
}
C 47500 32200 1 180 0 current-1.sym
{
T 46900 31200 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 46500 32200 5 10 1 1 0 0 1
refdes=Vfx_pd0
T 46500 31700 5 10 1 1 0 0 1
value=DC 0
}
N 45900 31800 45900 32000 4
N 47500 32000 47700 32000 4
{
T 47500 32000 5 10 1 1 0 0 1
netname=fd0a
}
N 59900 32000 60600 32000 4
{
T 59900 32000 5 10 1 1 0 0 1
netname=fixture_pd1
}
C 61700 31900 1 0 0 resistor-1.sym
{
T 62000 32300 5 10 0 0 0 0 1
device=RESISTOR
T 61700 32200 5 10 1 1 0 0 1
refdes=R_fixture_pd1
T 61600 31700 5 10 1 1 0 0 1
value={R_fixture1}
}
C 62600 31800 1 270 0 voltage-3.sym
{
T 63300 31600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 62900 31600 5 10 1 1 0 0 1
refdes=V_fixture_pd1
T 62900 31000 5 10 1 1 0 0 1
value=DC {V_fixture1}
}
N 62600 32000 62800 32000 4
{
T 62600 32000 5 10 1 1 0 0 1
netname=fd1b
}
N 62800 32000 62800 31800 4
C 62700 30600 1 0 0 gnd-1.sym
C 61500 32200 1 180 0 current-1.sym
{
T 60900 31200 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 60500 32200 5 10 1 1 0 0 1
refdes=Vfx_pd1
T 60500 31700 5 10 1 1 0 0 1
value=DC 0
}
N 61500 32000 61700 32000 4
{
T 61500 32000 5 10 1 1 0 0 1
netname=fd1a
}
N 52600 31000 52000 31000 4
{
T 52000 31000 5 10 1 1 0 0 1
netname=I2_pd
}
N 52600 30200 52000 30200 4
{
T 52000 30200 5 10 1 1 0 0 1
netname=Igc_pd0
}
C 53000 28900 1 90 0 vexp-1.sym
{
T 51200 29550 5 10 1 1 0 0 1
refdes=A_comp_pd0
T 52150 29600 5 10 0 0 90 0 1
device=vexp
T 51950 29600 5 10 0 0 90 0 1
footprint=none
T 52800 29550 5 10 1 1 0 0 1
value=comp0
}
N 53000 29200 53700 29200 4
{
T 53000 29200 5 10 1 1 0 0 1
netname=Icomp_pd0
}
C 52000 32400 1 0 1 voltage-3.sym
{
T 51800 33100 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 51000 32900 5 10 1 1 0 0 1
refdes=B_pullup_pd0
T 52800 32900 5 10 1 1 0 0 1
value=V=pwl({pullup_reference} - V(fixture_pd0) $pullup0)
}
C 51000 32300 1 0 0 gnd-1.sym
N 52000 32600 52600 32600 4
{
T 52000 32600 5 10 1 1 0 0 1
netname=I3_pd
}
C 52000 31600 1 0 1 voltage-3.sym
{
T 51800 32300 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 51000 32100 5 10 1 1 0 0 1
refdes=B_power_clamp_pd0
T 52800 32100 5 10 1 1 0 0 1
value=V=pwl({power_clamp_reference} - V(fixture_pd0) $power_clamp0)
}
C 51000 31500 1 0 0 gnd-1.sym
N 52600 31800 52000 31800 4
{
T 52000 31800 5 10 1 1 0 0 1
netname=Ipc_pd0
}
C 52000 30800 1 0 1 voltage-3.sym
{
T 51800 31500 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 51000 31300 5 10 1 1 0 0 1
refdes=B_pulldown_pd0
T 52800 31300 5 10 1 1 0 0 1
value=V=pwl(V(fixture_pd0) - {pulldown_reference} $pulldown0)
}
C 51000 30700 1 0 0 gnd-1.sym
C 52000 30400 1 180 0 voltage-3.sym
{
T 51800 29700 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 51000 30500 5 10 1 1 0 0 1
refdes=B_gnd_clamp_pd0
T 52800 30500 5 10 1 1 0 0 1
value=V=pwl(V(fixture_pd0) - {gnd_clamp_reference} $gnd_clamp0)
}
C 51000 29900 1 0 0 gnd-1.sym
N 51100 29200 51800 29200 4
{
T 50900 29200 5 10 1 1 0 0 1
netname=fixture_pd0
}
C 59800 37300 1 0 0 gnd-1.sym
N 66600 37700 66000 37700 4
{
T 66000 37700 5 10 1 1 0 0 1
netname=I1_pu
}
N 66600 36900 66000 36900 4
{
T 66000 36900 5 10 1 1 0 0 1
netname=Igc_pu1
}
C 59700 38500 1 270 0 voltage-3.sym
{
T 60400 38300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 60000 38300 5 10 1 1 0 0 1
refdes=B_pu1
T 59600 36700 5 10 1 1 0 0 3
value=V=V(up) > 0 ? 
+    pwl(V(ru_time) $rising_waveform1) :
+    pwl(V(fu_time) $falling_waveform1)
}
N 59900 38500 59900 38700 4
C 67000 35600 1 90 0 vexp-1.sym
{
T 65200 36250 5 10 1 1 0 0 1
refdes=A_comp_pu1
T 66150 36300 5 10 0 0 90 0 1
device=vexp
T 65950 36300 5 10 0 0 90 0 1
footprint=none
T 66800 36250 5 10 1 1 0 0 1
value=comp1
}
N 67000 35900 67700 35900 4
{
T 67000 35900 5 10 1 1 0 0 1
netname=Icomp_pu1
}
C 66000 39100 1 0 1 voltage-3.sym
{
T 65800 39800 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 65000 39600 5 10 1 1 0 0 1
refdes=B_pullup_pu1
T 66800 39600 5 10 1 1 0 0 1
value=V=pwl({pullup_reference} - V(fixture_pu1) $pullup0)
}
C 65000 39000 1 0 0 gnd-1.sym
N 66000 39300 66600 39300 4
{
T 66000 39300 5 10 1 1 0 0 1
netname=I4_pu
}
C 66000 38300 1 0 1 voltage-3.sym
{
T 65800 39000 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 65000 38800 5 10 1 1 0 0 1
refdes=B_power_clamp_pu1
T 66800 38800 5 10 1 1 0 0 1
value=V=pwl({power_clamp_reference} - V(fixture_pu1) $power_clamp0)
}
C 65000 38200 1 0 0 gnd-1.sym
N 66600 38500 66000 38500 4
{
T 66000 38500 5 10 1 1 0 0 1
netname=Ipc_pu1
}
C 66000 37500 1 0 1 voltage-3.sym
{
T 65800 38200 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 65000 38000 5 10 1 1 0 0 1
refdes=B_pulldown_pu1
T 66800 38000 5 10 1 1 0 0 1
value=V=pwl(V(fixture_pu1) - {pulldown_reference} $pulldown0)
}
C 65000 37400 1 0 0 gnd-1.sym
C 66000 37100 1 180 0 voltage-3.sym
{
T 65800 36400 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 65000 37200 5 10 1 1 0 0 1
refdes=B_gnd_clamp_pu1
T 66800 37200 5 10 1 1 0 0 1
value=V=pwl(V(fixture_pu1) - {gnd_clamp_reference} $gnd_clamp0)
}
C 65000 36600 1 0 0 gnd-1.sym
N 65100 35900 65800 35900 4
{
T 64900 35900 5 10 1 1 0 0 1
netname=fixture_pu1
}
C 59800 30600 1 0 0 gnd-1.sym
C 59700 31800 1 270 0 voltage-3.sym
{
T 60400 31600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 60000 31600 5 10 1 1 0 0 1
refdes=B_pd1
T 59700 30000 5 10 1 1 0 0 3
value=V=V(down) > 0 ? 
+    pwl(V(rd_time) $rising_waveform1) :
+    pwl(V(fd_time) $falling_waveform1)
}
N 59900 31800 59900 32000 4
N 66600 31000 66000 31000 4
{
T 66000 31000 5 10 1 1 0 0 1
netname=I1_pd
}
N 66600 30200 66000 30200 4
{
T 66000 30200 5 10 1 1 0 0 1
netname=Igc_pd1
}
C 67000 28900 1 90 0 vexp-1.sym
{
T 65200 29550 5 10 1 1 0 0 1
refdes=A_comp_pd1
T 66150 29600 5 10 0 0 90 0 1
device=vexp
T 65950 29600 5 10 0 0 90 0 1
footprint=none
T 66800 29550 5 10 1 1 0 0 1
value=comp1
}
N 67000 29200 67700 29200 4
{
T 67000 29200 5 10 1 1 0 0 1
netname=Icomp_pd1
}
C 66000 32400 1 0 1 voltage-3.sym
{
T 65800 33100 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 65000 32900 5 10 1 1 0 0 1
refdes=B_pullup_pd1
T 66800 32900 5 10 1 1 0 0 1
value=V=pwl({pullup_reference} - V(fixture_pd1) $pullup0)
}
C 65000 32300 1 0 0 gnd-1.sym
N 66000 32600 66600 32600 4
{
T 66000 32600 5 10 1 1 0 0 1
netname=I4_pd
}
C 66000 31600 1 0 1 voltage-3.sym
{
T 65800 32300 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 65000 32100 5 10 1 1 0 0 1
refdes=B_power_clamp_pd1
T 66800 32100 5 10 1 1 0 0 1
value=V=pwl({power_clamp_reference} - V(fixture_pd1) $power_clamp0)
}
C 65000 31500 1 0 0 gnd-1.sym
N 66600 31800 66000 31800 4
{
T 66000 31800 5 10 1 1 0 0 1
netname=Ipc_pd1
}
C 66000 30800 1 0 1 voltage-3.sym
{
T 65800 31500 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 65000 31300 5 10 1 1 0 0 1
refdes=B_pulldown_pd1
T 66800 31300 5 10 1 1 0 0 1
value=V=pwl(V(fixture_pd1) - {pulldown_reference} $pulldown0)
}
C 65000 30700 1 0 0 gnd-1.sym
C 66000 30400 1 180 0 voltage-3.sym
{
T 65800 29700 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 65000 30500 5 10 1 1 0 0 1
refdes=B_gnd_clamp_pd1
T 66800 30500 5 10 1 1 0 0 1
value=V=pwl(V(fixture_pd1) - {gnd_clamp_reference} $gnd_clamp0)
}
C 65000 29900 1 0 0 gnd-1.sym
N 65100 29200 65800 29200 4
{
T 64900 29200 5 10 1 1 0 0 1
netname=fixture_pd1
}
C 58100 45300 1 180 1 current-1.sym
{
T 58700 44300 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 57900 45300 5 10 1 1 0 0 1
refdes=A_ru_on
T 57900 44800 5 10 1 1 0 0 1
value=and
}
N 58100 45100 57000 45100 4
{
T 57000 45100 5 10 1 1 0 0 1
netname=[en out]
}
N 59000 45100 60200 45100 4
{
T 59000 45100 5 10 1 1 0 0 1
netname=ru_on
}
C 51400 42200 1 0 0 spice-directive-1.sym
{
T 51500 42500 5 10 0 1 0 0 1
device=directive
T 51400 42400 5 10 1 1 180 6 4
value=.MODEL and d_and(input_load=0
+	rise_delay=1f fall_delay=1f)
.MODEL nand d_nand(input_load=0
+	rise_delay=1f fall_delay=1f)
T 51500 42600 5 10 1 1 0 0 1
refdes=_and
}
C 58100 44500 1 180 1 current-1.sym
{
T 58700 43500 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 57900 44500 5 10 1 1 0 0 1
refdes=A_rd_on
T 57900 44000 5 10 1 1 0 0 1
value=nand
}
N 58100 44300 57000 44300 4
{
T 57000 44300 5 10 1 1 0 0 1
netname=[en ~out]
}
N 59000 44300 60200 44300 4
{
T 59000 44300 5 10 1 1 0 0 1
netname=rd_on
}
C 58100 43700 1 180 1 current-1.sym
{
T 58700 42700 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 57900 43700 5 10 1 1 0 0 1
refdes=A_rtime
T 57900 43200 5 10 1 1 0 0 1
value=rtime
}
N 57000 43500 58100 43500 4
{
T 57000 43500 5 10 1 1 0 0 1
netname=[ru_on rd_on]
}
N 59000 43500 60200 43500 4
{
T 58900 43500 5 10 1 1 0 0 1
netname=[ru_time rd_time]
}
C 58100 42900 1 180 1 current-1.sym
{
T 58700 41900 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 57900 42900 5 10 1 1 0 0 1
refdes=A_dtime
T 57900 42400 5 10 1 1 0 0 1
value=ftime
}
N 57000 42700 58100 42700 4
{
T 57000 42700 5 10 1 1 0 0 1
netname=[~ru_on ~rd_on]
}
N 59000 42700 60200 42700 4
{
T 58900 42700 5 10 1 1 0 0 1
netname=[fu_time fd_time]
}
C 45400 44200 1 0 0 spice-directive-1.sym
{
T 45500 44500 5 10 0 1 0 0 1
device=directive
T 45400 44400 5 10 1 1 180 6 11
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
T 45500 44600 5 10 1 1 0 0 1
refdes=_dac
}
C 58100 42100 1 180 1 current-1.sym
{
T 58700 41100 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 57900 42100 5 10 1 1 0 0 1
refdes=A_sel
T 57900 41600 5 10 1 1 0 0 1
value=dac
}
N 57000 41900 58100 41900 4
{
T 57000 41900 5 10 1 1 0 0 1
netname=[ru_on rd_on]
}
N 59000 41900 60200 41900 4
{
T 58900 41900 5 10 1 1 0 0 1
netname=[up down]
}
B 56800 41400 3700 4200 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
T 56800 45700 9 10 1 0 0 0 1
Control Logic

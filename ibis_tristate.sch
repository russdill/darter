v 20110115 2
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
T 37100 35400 5 10 1 1 0 0 3
value=V=V(en) > 0 ?
+  (V(out) > 0 ? 0 : {falling_waveform_max}) : 
+  {falling_waveform_max}
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
C 37900 36000 1 0 0 gnd-1.sym
C 37700 39100 1 0 0 vdc-1.sym
{
T 37200 40050 5 10 1 1 0 0 1
refdes=B_ru_on
T 38400 39950 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 38400 40150 5 10 0 0 0 0 1
footprint=none
T 37200 38450 5 10 1 1 0 0 2
value=V=V(en) > 0 ?
+  (V(out) > 0 ? {rising_waveform_max} : 0) : 0
}
N 53700 43200 54900 43200 4
{
T 54500 43300 5 10 1 1 0 0 1
netname=pad
}
C 53900 43400 1 90 0 current-1.sym
{
T 52900 44000 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 53800 44100 5 10 1 1 0 0 1
refdes=B_pu
T 53800 43500 5 10 1 1 0 0 1
value=I=V(Ipu)*V(Kpu)
}
C 53500 43000 1 270 0 current-1.sym
{
T 54500 42400 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 53800 42800 5 10 1 1 0 0 1
refdes=B_pd
T 53800 42200 5 10 1 1 0 0 1
value=I=V(Ipd)*V(Kpd)
}
C 53900 41900 1 180 0 vss-1.sym
C 53500 44500 1 0 0 vdd-1.sym
N 53700 43400 53700 43000 4
N 53700 44300 53700 44500 4
N 53700 41900 53700 42100 4
N 41700 39000 41300 39000 4
N 41300 39000 41300 40300 4
N 41700 36200 41300 36200 4
N 41300 36200 41300 37500 4
N 42900 40300 43500 40300 4
{
T 43100 40300 5 10 1 1 0 0 1
netname=vru0
}
N 42900 37500 43500 37500 4
{
T 43100 37500 5 10 1 1 0 0 1
netname=vfu0
}
N 42900 36200 43500 36200 4
{
T 43100 36200 5 10 1 1 0 0 1
netname=vfu1
}
N 42900 39000 43500 39000 4
{
T 43100 39000 5 10 1 1 0 0 1
netname=vru1
}
B 36800 34700 36000 6200 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
B 50200 41200 5500 4000 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
B 36800 28000 36000 6100 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
C 40000 33100 1 90 0 vexp-1.sym
{
T 39700 33650 5 10 1 1 0 0 1
refdes=A_rd_time
T 39150 33800 5 10 0 0 90 0 1
device=vexp
T 38950 33800 5 10 0 0 90 0 1
footprint=none
T 39700 33150 5 10 1 1 0 0 1
value=time
}
N 40000 33400 41700 33400 4
{
T 40400 33400 5 10 1 1 0 0 1
netname=rd_time
}
C 37900 31900 1 0 0 gnd-1.sym
C 37800 29400 1 0 0 vdc-1.sym
{
T 37300 30350 5 10 1 1 0 0 1
refdes=B_fd_on
T 38500 30250 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 38500 30450 5 10 0 0 0 0 1
footprint=none
T 37400 28650 5 10 1 1 0 0 2
value=V=V(en) > 0 ?
+  (V(out) > 0 ? 0 : {falling_waveform_max}) : 0
}
C 40100 30300 1 90 0 vexp-1.sym
{
T 39800 30850 5 10 1 1 0 0 1
refdes=A_fd_time
T 39250 31000 5 10 0 0 90 0 1
device=vexp
T 39050 31000 5 10 0 0 90 0 1
footprint=none
T 39800 30250 5 10 1 1 0 0 1
value=time
}
N 41700 30600 40100 30600 4
{
T 40400 30600 5 10 1 1 0 0 1
netname=fd_time
}
C 38000 29100 1 0 0 gnd-1.sym
C 37700 32200 1 0 0 vdc-1.sym
{
T 37200 33150 5 10 1 1 0 0 1
refdes=B_rd_on
T 38400 33050 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 38400 33250 5 10 0 0 0 0 1
footprint=none
T 37300 31350 5 10 1 1 0 0 3
value=V=V(en) > 0 ?
+  (V(out) > 0 ? {rising_waveform_max} : 0) :
+  {rising_waveform_max}
}
N 41700 32100 41300 32100 4
N 41300 32100 41300 33400 4
N 41700 29300 41300 29300 4
N 41300 29300 41300 30600 4
N 42900 33400 43500 33400 4
{
T 43100 33400 5 10 1 1 0 0 1
netname=vrd0
}
N 42900 30600 43500 30600 4
{
T 43100 30600 5 10 1 1 0 0 1
netname=vfd0
}
N 42900 29300 43500 29300 4
{
T 43100 29300 5 10 1 1 0 0 1
netname=vfd1
}
N 42900 32100 43500 32100 4
{
T 43100 32100 5 10 1 1 0 0 1
netname=vrd1
}
T 36800 41000 9 10 1 0 0 0 1
Models for pull-up multiplier
T 36800 34200 9 10 1 0 0 0 1
Models for pull-down multiplier
L 44900 40700 44900 34900 3 0 0 2 150 150
L 58900 40700 58900 34900 3 0 0 2 150 150
L 58900 33900 58900 28100 3 0 0 2 150 150
L 44900 33900 44900 28100 3 0 0 2 150 150
T 45000 40600 9 10 1 0 0 0 1
Fixture 0
T 59000 40600 9 10 1 0 0 0 1
Fixture 1
T 50200 45300 9 10 1 0 0 0 1
IBIS Gate Model
T 36800 45400 8 10 1 0 0 0 1
dist-license=GPLv3
T 36806 45600 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
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
N 38000 33400 38800 33400 4
{
T 38000 33400 5 10 1 1 0 0 1
netname=rd_on
}
N 38100 30600 38900 30600 4
{
T 38100 30600 5 10 1 1 0 0 1
netname=fd_on
}
T 45000 33800 9 10 1 0 0 0 1
Fixture 0
T 59000 33800 9 10 1 0 0 0 1
Fixture 1
C 42200 41800 1 0 0 gnd-1.sym
N 42100 42100 42300 42100 4
{
T 42100 42100 5 10 1 1 0 0 1
netname=0
}
C 46800 42300 1 270 0 voltage-3.sym
{
T 47500 42100 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 46400 42100 5 10 1 1 0 0 1
refdes=B_Kpd
T 44100 42600 5 10 1 1 0 0 3
value=V=((I(Vfx_pd0) - V(Icomp_pd0) + V(Ipc_pd0) + V(Igc_pd0)) * V(I4_pd) +
+      (I(Vfx_pd1) - V(Icomp_pd1) + V(Ipc_pd1) + V(Igc_pd1)) * V(I3_pd)) /
+   (V(I2_pd) * V(I4_pd) - V(I1_pd) * V(I3_pd))
}
C 46800 44400 1 270 0 voltage-3.sym
{
T 47500 44200 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 46400 44200 5 10 1 1 0 0 1
refdes=B_Kpu
T 44100 44700 5 10 1 1 0 0 3
value=V=((I(Vfx_pu0) - V(Icomp_pu0) + V(Ipc_pu0) + V(Igc_pu0)) * V(I1_pu) +
+    (I(Vfx_pu1) - V(Icomp_pu1) + V(Ipc_pu1) + V(Igc_pu1)) * V(I2_pu)) /
+    (V(I2_pu) * V(I4_pu) - V(I1_pu) * V(I3_pu))
}
C 46900 43200 1 0 0 gnd-1.sym
C 46900 41100 1 0 0 gnd-1.sym
N 47000 42300 47400 42300 4
{
T 47000 42300 5 10 1 1 0 0 1
netname=Kpd
}
N 47000 44400 47400 44400 4
{
T 47000 44400 5 10 1 1 0 0 1
netname=Kpu
}
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
C 50600 44500 1 270 0 voltage-3.sym
{
T 51300 44300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 51100 44000 5 10 1 1 0 0 1
refdes=B_vpu
T 51100 43800 5 10 1 1 0 0 1
value=V=V(Vdd) - V(pad)
}
C 50700 43300 1 0 0 gnd-1.sym
N 50800 44500 51400 44500 4
{
T 50800 44500 5 10 1 1 0 0 1
netname=vpu
}
C 52600 44200 1 90 0 vexp-1.sym
{
T 52300 44750 5 10 1 1 0 0 1
refdes=A_pullup
T 51750 44900 5 10 0 0 90 0 1
device=vexp
T 51550 44900 5 10 0 0 90 0 1
footprint=none
T 52300 44250 5 10 1 1 0 0 1
value=pullup0
}
N 52600 44500 53200 44500 4
{
T 52800 44500 5 10 1 1 0 0 1
netname=Ipu
}
C 50600 42700 1 270 0 voltage-3.sym
{
T 51300 42500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 51100 42200 5 10 1 1 0 0 1
refdes=B_vpd
T 51100 42000 5 10 1 1 0 0 1
value=V=V(pad) - V(Vss)
}
C 50700 41500 1 0 0 gnd-1.sym
N 50800 42700 51400 42700 4
{
T 50800 42700 5 10 1 1 0 0 1
netname=vpd
}
C 52600 42400 1 90 0 vexp-1.sym
{
T 52300 42950 5 10 1 1 0 0 1
refdes=A_pulldown
T 51750 43100 5 10 0 0 90 0 1
device=vexp
T 51550 43100 5 10 0 0 90 0 1
footprint=none
T 52300 42450 5 10 1 1 0 0 1
value=pulldown0
}
N 52600 42700 53200 42700 4
{
T 52800 42700 5 10 1 1 0 0 1
netname=Ipd
}
C 42900 40000 1 90 0 vexp-1.sym
{
T 42600 40550 5 10 1 1 0 0 1
refdes=A_ru0
T 42050 40700 5 10 0 0 90 0 1
device=vexp
T 41850 40700 5 10 0 0 90 0 1
footprint=none
T 41700 39850 5 10 1 1 0 0 1
value=rising_waveform0
}
C 42900 38700 1 90 0 vexp-1.sym
{
T 42600 39250 5 10 1 1 0 0 1
refdes=A_ru1
T 42050 39400 5 10 0 0 90 0 1
device=vexp
T 41850 39400 5 10 0 0 90 0 1
footprint=none
T 41700 38550 5 10 1 1 0 0 1
value=rising_waveform1
}
C 42900 37200 1 90 0 vexp-1.sym
{
T 42600 37750 5 10 1 1 0 0 1
refdes=A_fu0
T 42050 37900 5 10 0 0 90 0 1
device=vexp
T 41850 37900 5 10 0 0 90 0 1
footprint=none
T 41700 37050 5 10 1 1 0 0 1
value=falling_waveform0
}
C 42900 35900 1 90 0 vexp-1.sym
{
T 42600 36450 5 10 1 1 0 0 1
refdes=A_fu1
T 42050 36600 5 10 0 0 90 0 1
device=vexp
T 41850 36600 5 10 0 0 90 0 1
footprint=none
T 41700 35750 5 10 1 1 0 0 1
value=falling_waveform1
}
C 42900 33100 1 90 0 vexp-1.sym
{
T 42600 33650 5 10 1 1 0 0 1
refdes=A_rd0
T 42050 33800 5 10 0 0 90 0 1
device=vexp
T 41850 33800 5 10 0 0 90 0 1
footprint=none
T 41700 32950 5 10 1 1 0 0 1
value=rising_waveform0
}
C 42900 31800 1 90 0 vexp-1.sym
{
T 42600 32350 5 10 1 1 0 0 1
refdes=A_rd1
T 42050 32500 5 10 0 0 90 0 1
device=vexp
T 41850 32500 5 10 0 0 90 0 1
footprint=none
T 41700 31650 5 10 1 1 0 0 1
value=rising_waveform1
}
C 42900 30300 1 90 0 vexp-1.sym
{
T 42600 30850 5 10 1 1 0 0 1
refdes=A_fd0
T 42050 31000 5 10 0 0 90 0 1
device=vexp
T 41850 31000 5 10 0 0 90 0 1
footprint=none
T 41700 30150 5 10 1 1 0 0 1
value=falling_waveform0
}
C 42900 29000 1 90 0 vexp-1.sym
{
T 42600 29550 5 10 1 1 0 0 1
refdes=A_fd1
T 42050 29700 5 10 0 0 90 0 1
device=vexp
T 41850 29700 5 10 0 0 90 0 1
footprint=none
T 41700 28850 5 10 1 1 0 0 1
value=falling_waveform1
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
N 53000 36600 52800 36600 4
{
T 52800 36600 5 10 1 1 0 0 1
netname=I2_pu
}
N 56800 36600 56200 36600 4
{
T 56200 36600 5 10 1 1 0 0 1
netname=Igc_pu0
}
C 45700 38500 1 270 0 voltage-3.sym
{
T 46400 38300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 46000 38300 5 10 1 1 0 0 1
refdes=B_pu0
T 46100 37700 5 10 1 1 0 0 1
value=V=V(ru_on) > 0  ? V(vru0) : V(vfu0)
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
C 48100 35700 1 90 0 vexp-1.sym
{
T 47700 36350 5 10 1 1 0 0 1
refdes=A_comp_pu0
T 47250 36400 5 10 0 0 90 0 1
device=vexp
T 47050 36400 5 10 0 0 90 0 1
footprint=none
T 47800 35750 5 10 1 1 0 0 1
value=comp0
}
N 48100 36000 48800 36000 4
{
T 48100 36000 5 10 1 1 0 0 1
netname=Icomp_pu0
}
N 47500 38700 47700 38700 4
{
T 47500 38700 5 10 1 1 0 0 1
netname=fu0a
}
C 50800 39500 1 270 0 voltage-3.sym
{
T 51500 39300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 51300 39000 5 10 1 1 0 0 1
refdes=B_vpu_pu0
T 51300 38800 5 10 1 1 0 0 1
value=V={pullup_reference} - V(fixture_pu0)
}
C 50900 38300 1 0 0 gnd-1.sym
N 51000 39500 51600 39500 4
{
T 51000 39500 5 10 1 1 0 0 1
netname=vpu_pu0
}
C 52800 39200 1 90 0 vexp-1.sym
{
T 52500 39750 5 10 1 1 0 0 1
refdes=A_pullup_pu0
T 51950 39900 5 10 0 0 90 0 1
device=vexp
T 51750 39900 5 10 0 0 90 0 1
footprint=none
T 52500 39250 5 10 1 1 0 0 1
value=pullup0
}
N 52800 39500 53000 39500 4
{
T 52800 39500 5 10 1 1 0 0 1
netname=I3_pu
}
C 54200 39500 1 270 0 voltage-3.sym
{
T 54900 39300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 54700 39000 5 10 1 1 0 0 1
refdes=B_vpc_pu0
T 54700 38800 5 10 1 1 0 0 1
value=V={power_clamp_reference} - V(fixture_pu0)
}
C 54300 38300 1 0 0 gnd-1.sym
N 54400 39500 55000 39500 4
{
T 54400 39500 5 10 1 1 0 0 1
netname=vpc_pu0
}
C 56200 39200 1 90 0 vexp-1.sym
{
T 55900 39750 5 10 1 1 0 0 1
refdes=A_power_clamp_pu0
T 55350 39900 5 10 0 0 90 0 1
device=vexp
T 55150 39900 5 10 0 0 90 0 1
footprint=none
T 55900 39250 5 10 1 1 0 0 1
value=power_clamp0
}
N 56800 39500 56200 39500 4
{
T 56200 39500 5 10 1 1 0 0 1
netname=Ipc_pu0
}
C 50800 36600 1 270 0 voltage-3.sym
{
T 51500 36400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 51300 36100 5 10 1 1 0 0 1
refdes=B_vpd_pu0
T 51300 35900 5 10 1 1 0 0 1
value=V=V(fixture_pu0) - {pulldown_reference}
}
C 50900 35400 1 0 0 gnd-1.sym
N 51000 36600 51600 36600 4
{
T 51000 36600 5 10 1 1 0 0 1
netname=vpd_pu0
}
C 52800 36300 1 90 0 vexp-1.sym
{
T 52500 36850 5 10 1 1 0 0 1
refdes=A_pulldown_pu0
T 51950 37000 5 10 0 0 90 0 1
device=vexp
T 51750 37000 5 10 0 0 90 0 1
footprint=none
T 52500 36350 5 10 1 1 0 0 1
value=pulldown0
}
C 54200 36600 1 270 0 voltage-3.sym
{
T 54900 36400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 54700 36100 5 10 1 1 0 0 1
refdes=B_vgc_pu0
T 54700 35900 5 10 1 1 0 0 1
value=V=V(fixture_pu0) - {gnd_clamp_reference}
}
C 54300 35400 1 0 0 gnd-1.sym
N 54400 36600 55000 36600 4
{
T 54400 36600 5 10 1 1 0 0 1
netname=vgc_pu0
}
C 56200 36300 1 90 0 vexp-1.sym
{
T 55900 36850 5 10 1 1 0 0 1
refdes=A_gnd_clamp_pu0
T 55350 37000 5 10 0 0 90 0 1
device=vexp
T 55150 37000 5 10 0 0 90 0 1
footprint=none
T 55900 36350 5 10 1 1 0 0 1
value=gnd_clamp0
}
N 46200 36000 46900 36000 4
{
T 46200 36000 5 10 1 1 0 0 1
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
C 59800 37300 1 0 0 gnd-1.sym
N 67000 36600 66800 36600 4
{
T 66800 36600 5 10 1 1 0 0 1
netname=I1_pu
}
N 70800 36600 70200 36600 4
{
T 70200 36600 5 10 1 1 0 0 1
netname=Igc_pu1
}
C 59700 38500 1 270 0 voltage-3.sym
{
T 60400 38300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 60000 38300 5 10 1 1 0 0 1
refdes=B_pu1
T 60100 37700 5 10 1 1 0 0 1
value=V=V(ru_on) > 0  ? V(vru1) : V(vfu1)
}
C 61500 38900 1 180 0 current-1.sym
{
T 60900 37900 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 60500 38900 5 10 1 1 0 0 1
refdes=Vfx_pu1
T 60500 38400 5 10 1 1 0 0 1
value=DC 0
}
N 59900 38500 59900 38700 4
C 62100 35700 1 90 0 vexp-1.sym
{
T 61700 36350 5 10 1 1 0 0 1
refdes=A_comp_pu1
T 61250 36400 5 10 0 0 90 0 1
device=vexp
T 61050 36400 5 10 0 0 90 0 1
footprint=none
T 61800 35750 5 10 1 1 0 0 1
value=comp1
}
N 62100 36000 62800 36000 4
{
T 62100 36000 5 10 1 1 0 0 1
netname=Icomp_pu1
}
N 61500 38700 61700 38700 4
{
T 61500 38700 5 10 1 1 0 0 1
netname=fu1a
}
C 64800 39500 1 270 0 voltage-3.sym
{
T 65500 39300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 65300 39000 5 10 1 1 0 0 1
refdes=B_vpu_pu1
T 65300 38800 5 10 1 1 0 0 1
value=V={pullup_reference} - V(fixture_pu1)
}
C 64900 38300 1 0 0 gnd-1.sym
N 65000 39500 65600 39500 4
{
T 65000 39500 5 10 1 1 0 0 1
netname=vpu_pu1
}
C 66800 39200 1 90 0 vexp-1.sym
{
T 66500 39750 5 10 1 1 0 0 1
refdes=A_pullup_pu1
T 65950 39900 5 10 0 0 90 0 1
device=vexp
T 65750 39900 5 10 0 0 90 0 1
footprint=none
T 66500 39250 5 10 1 1 0 0 1
value=pullup0
}
N 66800 39500 67000 39500 4
{
T 66800 39500 5 10 1 1 0 0 1
netname=I4_pu
}
C 68200 39500 1 270 0 voltage-3.sym
{
T 68900 39300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 68700 39000 5 10 1 1 0 0 1
refdes=B_vpc_pu1
T 68700 38800 5 10 1 1 0 0 1
value=V={power_clamp_reference} - V(fixture_pu1)
}
C 68300 38300 1 0 0 gnd-1.sym
N 68400 39500 69000 39500 4
{
T 68400 39500 5 10 1 1 0 0 1
netname=vpc_pu1
}
C 70200 39200 1 90 0 vexp-1.sym
{
T 69900 39750 5 10 1 1 0 0 1
refdes=A_power_clamp_pu1
T 69350 39900 5 10 0 0 90 0 1
device=vexp
T 69150 39900 5 10 0 0 90 0 1
footprint=none
T 69900 39250 5 10 1 1 0 0 1
value=power_clamp0
}
N 70800 39500 70200 39500 4
{
T 70200 39500 5 10 1 1 0 0 1
netname=Ipc_pu1
}
C 64800 36600 1 270 0 voltage-3.sym
{
T 65500 36400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 65300 36100 5 10 1 1 0 0 1
refdes=B_vpd_pu1
T 65300 35900 5 10 1 1 0 0 1
value=V=V(fixture_pu1) - {pulldown_reference}
}
C 64900 35400 1 0 0 gnd-1.sym
N 65000 36600 65600 36600 4
{
T 65000 36600 5 10 1 1 0 0 1
netname=vpd_pu1
}
C 66800 36300 1 90 0 vexp-1.sym
{
T 66500 36850 5 10 1 1 0 0 1
refdes=A_pulldown_pu1
T 65950 37000 5 10 0 0 90 0 1
device=vexp
T 65750 37000 5 10 0 0 90 0 1
footprint=none
T 66500 36350 5 10 1 1 0 0 1
value=pulldown0
}
C 68200 36600 1 270 0 voltage-3.sym
{
T 68900 36400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 68700 36100 5 10 1 1 0 0 1
refdes=B_vgc_pu1
T 68700 35900 5 10 1 1 0 0 1
value=V=V(fixture_pu1) - {gnd_clamp_reference}
}
C 68300 35400 1 0 0 gnd-1.sym
N 68400 36600 69000 36600 4
{
T 68400 36600 5 10 1 1 0 0 1
netname=vgc_pu1
}
C 70200 36300 1 90 0 vexp-1.sym
{
T 69900 36850 5 10 1 1 0 0 1
refdes=A_gnd_clamp_pu1
T 69350 37000 5 10 0 0 90 0 1
device=vexp
T 69150 37000 5 10 0 0 90 0 1
footprint=none
T 69900 36350 5 10 1 1 0 0 1
value=gnd_clamp0
}
N 60200 36000 60900 36000 4
{
T 60200 36000 5 10 1 1 0 0 1
netname=fixture_pu1
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
N 53000 29900 52800 29900 4
{
T 52800 29900 5 10 1 1 0 0 1
netname=I2_pd
}
N 56800 29900 56200 29900 4
{
T 56200 29900 5 10 1 1 0 0 1
netname=Igc_pd0
}
C 45700 31800 1 270 0 voltage-3.sym
{
T 46400 31600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 46000 31600 5 10 1 1 0 0 1
refdes=B_pd0
T 46100 31000 5 10 1 1 0 0 1
value=V=V(rd_on) > 0  ? V(vrd0) : V(vfd0)
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
C 48100 29000 1 90 0 vexp-1.sym
{
T 47700 29650 5 10 1 1 0 0 1
refdes=A_comp_pd0
T 47250 29700 5 10 0 0 90 0 1
device=vexp
T 47050 29700 5 10 0 0 90 0 1
footprint=none
T 47800 29050 5 10 1 1 0 0 1
value=comp0
}
N 48100 29300 48800 29300 4
{
T 48100 29300 5 10 1 1 0 0 1
netname=Icomp_pd0
}
N 47500 32000 47700 32000 4
{
T 47500 32000 5 10 1 1 0 0 1
netname=fd0a
}
C 50800 32800 1 270 0 voltage-3.sym
{
T 51500 32600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 51300 32300 5 10 1 1 0 0 1
refdes=B_vpu_pd0
T 51300 32100 5 10 1 1 0 0 1
value=V={pullup_reference} - V(fixture_pd0)
}
C 50900 31600 1 0 0 gnd-1.sym
N 51000 32800 51600 32800 4
{
T 51000 32800 5 10 1 1 0 0 1
netname=vpu_pd0
}
C 52800 32500 1 90 0 vexp-1.sym
{
T 52500 33050 5 10 1 1 0 0 1
refdes=A_pullup_pd0
T 51950 33200 5 10 0 0 90 0 1
device=vexp
T 51750 33200 5 10 0 0 90 0 1
footprint=none
T 52500 32550 5 10 1 1 0 0 1
value=pullup0
}
N 52800 32800 53000 32800 4
{
T 52800 32800 5 10 1 1 0 0 1
netname=I3_pd
}
C 54200 32800 1 270 0 voltage-3.sym
{
T 54900 32600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 54700 32300 5 10 1 1 0 0 1
refdes=B_vpc_pd0
T 54700 32100 5 10 1 1 0 0 1
value=V={power_clamp_reference} - V(fixture_pd0)
}
C 54300 31600 1 0 0 gnd-1.sym
N 54400 32800 55000 32800 4
{
T 54400 32800 5 10 1 1 0 0 1
netname=vpc_pd0
}
C 56200 32500 1 90 0 vexp-1.sym
{
T 55900 33050 5 10 1 1 0 0 1
refdes=A_power_clamp_pd0
T 55350 33200 5 10 0 0 90 0 1
device=vexp
T 55150 33200 5 10 0 0 90 0 1
footprint=none
T 55900 32550 5 10 1 1 0 0 1
value=power_clamp0
}
N 56800 32800 56200 32800 4
{
T 56200 32800 5 10 1 1 0 0 1
netname=Ipc_pd0
}
C 50800 29900 1 270 0 voltage-3.sym
{
T 51500 29700 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 51300 29400 5 10 1 1 0 0 1
refdes=B_vpd_pd0
T 51300 29200 5 10 1 1 0 0 1
value=V=V(fixture_pd0) - {pulldown_reference}
}
C 50900 28700 1 0 0 gnd-1.sym
N 51000 29900 51600 29900 4
{
T 51000 29900 5 10 1 1 0 0 1
netname=vpd_pd0
}
C 52800 29600 1 90 0 vexp-1.sym
{
T 52500 30150 5 10 1 1 0 0 1
refdes=A_pulldown_pd0
T 51950 30300 5 10 0 0 90 0 1
device=vexp
T 51750 30300 5 10 0 0 90 0 1
footprint=none
T 52500 29650 5 10 1 1 0 0 1
value=pulldown0
}
C 54200 29900 1 270 0 voltage-3.sym
{
T 54900 29700 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 54700 29400 5 10 1 1 0 0 1
refdes=B_vgc_pd0
T 54700 29200 5 10 1 1 0 0 1
value=V=V(fixture_pd0) - {gnd_clamp_reference}
}
C 54300 28700 1 0 0 gnd-1.sym
N 54400 29900 55000 29900 4
{
T 54400 29900 5 10 1 1 0 0 1
netname=vgc_pd0
}
C 56200 29600 1 90 0 vexp-1.sym
{
T 55900 30150 5 10 1 1 0 0 1
refdes=A_gnd_clamp_pd0
T 55350 30300 5 10 0 0 90 0 1
device=vexp
T 55150 30300 5 10 0 0 90 0 1
footprint=none
T 55900 29650 5 10 1 1 0 0 1
value=gnd_clamp0
}
N 46200 29300 46900 29300 4
{
T 46200 29300 5 10 1 1 0 0 1
netname=fixture_pd0
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
C 59800 30600 1 0 0 gnd-1.sym
N 67000 29900 66800 29900 4
{
T 66800 29900 5 10 1 1 0 0 1
netname=I1_pd
}
N 70800 29900 70200 29900 4
{
T 70200 29900 5 10 1 1 0 0 1
netname=Igc_pd1
}
C 59700 31800 1 270 0 voltage-3.sym
{
T 60400 31600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 60000 31600 5 10 1 1 0 0 1
refdes=B_pd1
T 60100 31000 5 10 1 1 0 0 1
value=V=V(rd_on) > 0  ? V(vrd1) : V(vfd1)
}
C 61500 32200 1 180 0 current-1.sym
{
T 60900 31200 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 60500 32200 5 10 1 1 0 0 1
refdes=Vfx_pd1
T 60500 31700 5 10 1 1 0 0 1
value=DC 0
}
N 59900 31800 59900 32000 4
C 62100 29000 1 90 0 vexp-1.sym
{
T 61700 29650 5 10 1 1 0 0 1
refdes=A_comp_pd1
T 61250 29700 5 10 0 0 90 0 1
device=vexp
T 61050 29700 5 10 0 0 90 0 1
footprint=none
T 61800 29050 5 10 1 1 0 0 1
value=comp1
}
N 62100 29300 62800 29300 4
{
T 62100 29300 5 10 1 1 0 0 1
netname=Icomp_pd1
}
N 61500 32000 61700 32000 4
{
T 61500 32000 5 10 1 1 0 0 1
netname=fd1a
}
C 64800 32800 1 270 0 voltage-3.sym
{
T 65500 32600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 65300 32300 5 10 1 1 0 0 1
refdes=B_vpu_pd1
T 65300 32100 5 10 1 1 0 0 1
value=V={pullup_reference} - V(fixture_pd1)
}
C 64900 31600 1 0 0 gnd-1.sym
N 65000 32800 65600 32800 4
{
T 65000 32800 5 10 1 1 0 0 1
netname=vpu_pd1
}
C 66800 32500 1 90 0 vexp-1.sym
{
T 66500 33050 5 10 1 1 0 0 1
refdes=A_pullup_pd1
T 65950 33200 5 10 0 0 90 0 1
device=vexp
T 65750 33200 5 10 0 0 90 0 1
footprint=none
T 66500 32550 5 10 1 1 0 0 1
value=pullup0
}
N 66800 32800 67000 32800 4
{
T 66800 32800 5 10 1 1 0 0 1
netname=I4_pd
}
C 68200 32800 1 270 0 voltage-3.sym
{
T 68900 32600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 68700 32300 5 10 1 1 0 0 1
refdes=B_vpc_pd1
T 68700 32100 5 10 1 1 0 0 1
value=V={power_clamp_reference} - V(fixture_pd1)
}
C 68300 31600 1 0 0 gnd-1.sym
N 68400 32800 69000 32800 4
{
T 68400 32800 5 10 1 1 0 0 1
netname=vpc_pd1
}
C 70200 32500 1 90 0 vexp-1.sym
{
T 69900 33050 5 10 1 1 0 0 1
refdes=A_power_clamp_pd1
T 69350 33200 5 10 0 0 90 0 1
device=vexp
T 69150 33200 5 10 0 0 90 0 1
footprint=none
T 69900 32550 5 10 1 1 0 0 1
value=power_clamp0
}
N 70800 32800 70200 32800 4
{
T 70200 32800 5 10 1 1 0 0 1
netname=Ipc_pd1
}
C 64800 29900 1 270 0 voltage-3.sym
{
T 65500 29700 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 65300 29400 5 10 1 1 0 0 1
refdes=B_vpd_pd1
T 65300 29200 5 10 1 1 0 0 1
value=V=V(fixture_pd1) - {pulldown_reference}
}
C 64900 28700 1 0 0 gnd-1.sym
N 65000 29900 65600 29900 4
{
T 65000 29900 5 10 1 1 0 0 1
netname=vpd_pd1
}
C 66800 29600 1 90 0 vexp-1.sym
{
T 66500 30150 5 10 1 1 0 0 1
refdes=A_pulldown_pd1
T 65950 30300 5 10 0 0 90 0 1
device=vexp
T 65750 30300 5 10 0 0 90 0 1
footprint=none
T 66500 29650 5 10 1 1 0 0 1
value=pulldown0
}
C 68200 29900 1 270 0 voltage-3.sym
{
T 68900 29700 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 68700 29400 5 10 1 1 0 0 1
refdes=B_vgc_pd1
T 68700 29200 5 10 1 1 0 0 1
value=V=V(fixture_pd1) - {gnd_clamp_reference}
}
C 68300 28700 1 0 0 gnd-1.sym
N 68400 29900 69000 29900 4
{
T 68400 29900 5 10 1 1 0 0 1
netname=vgc_pd1
}
C 70200 29600 1 90 0 vexp-1.sym
{
T 69900 30150 5 10 1 1 0 0 1
refdes=A_gnd_clamp_pd1
T 69350 30300 5 10 0 0 90 0 1
device=vexp
T 69150 30300 5 10 0 0 90 0 1
footprint=none
T 69900 29650 5 10 1 1 0 0 1
value=gnd_clamp0
}
N 60200 29300 60900 29300 4
{
T 60200 29300 5 10 1 1 0 0 1
netname=fixture_pd1
}

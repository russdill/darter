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
T 41000 40300 5 10 1 1 0 0 1
netname=ru_time
}
C 36700 44200 1 0 0 spice-directive-1.sym
{
T 36800 44500 5 10 0 1 0 0 1
device=directive
T 36800 44600 5 10 1 1 0 0 1
refdes=A1
T 36700 44300 5 10 1 1 0 0 1
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
N 49100 37600 50900 37600 4
{
T 49000 37700 5 10 1 1 0 0 1
netname=pullup_fixture0
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
N 58200 43200 59400 43200 4
{
T 59000 43300 5 10 1 1 0 0 1
netname=pad
}
C 58400 43400 1 90 0 current-1.sym
{
T 57400 44000 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 58300 44100 5 10 1 1 0 0 1
refdes=B_pu
T 58300 43500 5 10 1 1 0 0 1
value=I=V(Ipu)*V(Kpu)
}
C 58000 43000 1 270 0 current-1.sym
{
T 59000 42400 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 58300 42800 5 10 1 1 0 0 1
refdes=B_pd
T 58300 42200 5 10 1 1 0 0 1
value=I=V(Ipd)*V(Kpd)
}
C 58400 41900 1 180 0 vss-1.sym
C 58000 44500 1 0 0 vdd-1.sym
N 58200 43400 58200 43000 4
N 58200 44300 58200 44500 4
N 57300 44400 58200 44400 4
N 58200 41900 58200 42100 4
N 57300 42000 58200 42000 4
C 41700 39600 1 0 0 vcvs-1.sym
{
T 41900 40650 5 10 0 0 0 0 1
device=SPICE-vcvs
T 42100 39450 5 10 1 1 0 0 1
refdes=X_ru0
T 41900 40850 5 10 0 0 0 0 1
symversion=0.1
T 43100 40650 5 10 1 1 0 5 1
value=rising_waveform0 spec={spec}
}
C 41700 36800 1 0 0 vcvs-1.sym
{
T 41900 37850 5 10 0 0 0 0 1
device=SPICE-vcvs
T 42200 36650 5 10 1 1 0 0 1
refdes=X_fu0
T 41900 38050 5 10 0 0 0 0 1
symversion=0.1
T 43200 37850 5 10 1 1 0 5 1
value=falling_waveform0 spec={spec}
}
C 41600 39400 1 0 0 gnd-1.sym
C 41600 36600 1 0 0 gnd-1.sym
C 57300 43700 1 0 1 vcvs-1.sym
{
T 57100 44750 5 10 0 0 0 6 1
device=SPICE-vcvs
T 56700 44550 5 10 1 1 0 6 1
refdes=X_pu
T 57100 44950 5 10 0 0 0 6 1
symversion=0.1
T 56600 43450 5 10 1 1 0 5 1
value=pullup0 spec={spec}
}
N 57300 43800 57500 43800 4
N 57500 42600 57500 43800 4
N 57500 43200 58200 43200 4
C 57300 41900 1 0 1 vcvs-1.sym
{
T 57100 42950 5 10 0 0 0 6 1
device=SPICE-vcvs
T 56700 42750 5 10 1 1 0 6 1
refdes=X_pd
T 57100 43150 5 10 0 0 0 6 1
symversion=0.1
T 56700 41650 5 10 1 1 0 5 1
value=pulldown0 spec={spec}
}
N 57300 42600 57500 42600 4
C 41700 38300 1 0 0 vcvs-1.sym
{
T 41900 39350 5 10 0 0 0 0 1
device=SPICE-vcvs
T 42200 38150 5 10 1 1 0 0 1
refdes=X_ru1
T 41900 39550 5 10 0 0 0 0 1
symversion=0.1
T 43200 39350 5 10 1 1 0 5 1
value=rising_waveform1 spec={spec}
}
C 41600 38100 1 0 0 gnd-1.sym
N 41700 39000 41300 39000 4
N 41300 39000 41300 40300 4
C 41700 35500 1 0 0 vcvs-1.sym
{
T 41900 36550 5 10 0 0 0 0 1
device=SPICE-vcvs
T 42200 35350 5 10 1 1 0 0 1
refdes=X_fu1
T 41900 36750 5 10 0 0 0 0 1
symversion=0.1
T 43200 36550 5 10 1 1 0 5 1
value=falling_waveform1 spec={spec}
}
C 41600 35300 1 0 0 gnd-1.sym
C 43100 35300 1 0 0 gnd-1.sym
N 41700 36200 41300 36200 4
N 41300 36200 41300 37500 4
C 51900 35900 1 0 1 gnd-1.sym
C 50300 38300 1 0 0 vcvs-1.sym
{
T 50500 39350 5 10 0 0 0 0 1
device=SPICE-vcvs
T 50600 39150 5 10 1 1 0 0 1
refdes=X_pullup_pu0
T 50500 39550 5 10 0 0 0 0 1
symversion=0.1
T 51000 38250 5 10 1 1 0 5 1
value=pullup0 spec={spec}
}
C 50300 36100 1 0 0 vcvs-1.sym
{
T 50500 37150 5 10 0 0 0 0 1
device=SPICE-vcvs
T 50300 36950 5 10 1 1 0 0 1
refdes=X_pulldown_pu0
T 50500 37350 5 10 0 0 0 0 1
symversion=0.1
T 51500 35850 5 10 1 1 0 5 1
value=pulldown0 spec={spec}
}
C 52000 37500 1 0 0 resistor-1.sym
{
T 52300 37900 5 10 0 0 0 0 1
device=RESISTOR
T 52000 37800 5 10 1 1 0 0 1
refdes=R_fixture_pu0
T 51900 37300 5 10 1 1 0 0 1
value={R_fixture0}
}
C 52900 37400 1 270 0 voltage-3.sym
{
T 53600 37200 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 53200 37200 5 10 1 1 0 0 1
refdes=V_fixture_pu0
T 53200 36600 5 10 1 1 0 0 1
value=DC {V_fixture0}
}
N 52900 37600 53100 37600 4
N 53100 37600 53100 37400 4
C 53000 36200 1 0 0 gnd-1.sym
N 50200 36800 50200 37600 4
N 50200 38400 50300 38400 4
C 51700 38100 1 0 0 gnd-1.sym
N 50300 36800 50200 36800 4
C 44000 44800 1 270 0 voltage-3.sym
{
T 44700 44600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 44500 44300 5 10 1 1 0 0 1
refdes=V_gc
T 44500 44100 5 10 1 1 0 0 1
value=DC {gnd_clamp_reference}
}
C 41000 44800 1 270 0 voltage-3.sym
{
T 41700 44600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 41500 44300 5 10 1 1 0 0 1
refdes=V_pc
T 41500 44100 5 10 1 1 0 0 1
value=DC {power_clamp_reference}
}
C 41100 43600 1 0 0 gnd-1.sym
C 44100 43600 1 0 0 gnd-1.sym
C 41000 44800 1 0 0 generic-power.sym
{
T 41200 45050 5 10 1 1 0 3 1
net=Vpc:1
}
C 44000 44800 1 0 0 generic-power.sym
{
T 44200 45050 5 10 1 1 0 3 1
net=Vgc:1
}
C 43100 38100 1 0 0 gnd-1.sym
C 43100 36600 1 0 0 gnd-1.sym
C 43100 39400 1 0 0 gnd-1.sym
C 49200 36400 1 0 0 vdc-1.sym
{
T 49000 37350 5 10 1 1 0 0 1
refdes=Bpu0
T 49900 37250 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 49900 37450 5 10 0 0 0 0 1
footprint=none
T 47800 35500 5 10 1 1 0 0 1
value=V=V(ru_on) > 0  ? V(vru0) : V(vfu0)
}
C 49400 36100 1 0 0 gnd-1.sym
N 43200 40300 43800 40300 4
{
T 43400 40300 5 10 1 1 0 0 1
netname=vru0
}
N 43200 37500 43800 37500 4
{
T 43400 37500 5 10 1 1 0 0 1
netname=vfu0
}
N 43200 36200 43800 36200 4
{
T 43400 36200 5 10 1 1 0 0 1
netname=vfu1
}
N 43200 39000 43800 39000 4
{
T 43400 39000 5 10 1 1 0 0 1
netname=vru1
}
C 55700 43500 1 0 0 gnd-1.sym
N 55200 44400 55800 44400 4
{
T 55400 44400 5 10 1 1 0 0 1
netname=Ipu
}
N 55200 42600 55800 42600 4
{
T 55400 42600 5 10 1 1 0 0 1
netname=Ipd
}
C 51800 37800 1 180 0 current-1.sym
{
T 51200 36800 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 50700 37800 5 10 1 1 0 0 1
refdes=Vfx_pu0
T 50700 37400 5 10 1 1 0 0 1
value=DC 0
}
N 51800 39000 52000 39000 4
{
T 51800 39000 5 10 1 1 0 0 1
netname=I3_pu
}
N 52000 36800 51800 36800 4
{
T 51800 36800 5 10 1 1 0 0 1
netname=I2_pu
}
C 49100 37400 1 0 1 current-1.sym
{
T 48500 38400 5 10 0 0 0 6 1
device=CURRENT_SOURCE
T 48100 38000 5 10 1 1 0 0 1
refdes=V_comp_pu0
T 48100 37800 5 10 1 1 0 0 1
value=DC 0
}
B 36800 34700 27700 6200 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
B 54700 41200 5500 4000 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
B 36800 28000 27700 6100 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
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
N 40000 33400 41100 33400 4
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
N 41100 30600 40100 30600 4
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
C 41100 32700 1 0 0 vcvs-1.sym
{
T 41300 33750 5 10 0 0 0 0 1
device=SPICE-vcvs
T 41600 32450 5 10 1 1 0 0 1
refdes=X_rd0
T 41300 33950 5 10 0 0 0 0 1
symversion=0.1
T 42500 33750 5 10 1 1 0 5 1
value=rising_waveform0 spec={spec}
}
C 41100 29900 1 0 0 vcvs-1.sym
{
T 41300 30950 5 10 0 0 0 0 1
device=SPICE-vcvs
T 41600 29650 5 10 1 1 0 0 1
refdes=X_fd0
T 41300 31150 5 10 0 0 0 0 1
symversion=0.1
T 42500 30950 5 10 1 1 0 5 1
value=falling_waveform0 spec={spec}
}
C 41000 32500 1 0 0 gnd-1.sym
C 41000 29700 1 0 0 gnd-1.sym
C 41100 31400 1 0 0 vcvs-1.sym
{
T 41300 32450 5 10 0 0 0 0 1
device=SPICE-vcvs
T 41600 31150 5 10 1 1 0 0 1
refdes=X_rd1
T 41300 32650 5 10 0 0 0 0 1
symversion=0.1
T 42500 32450 5 10 1 1 0 5 1
value=rising_waveform1 spec={spec}
}
C 41000 31200 1 0 0 gnd-1.sym
N 41100 32100 40700 32100 4
N 40700 32100 40700 33400 4
C 41100 28600 1 0 0 vcvs-1.sym
{
T 41300 29650 5 10 0 0 0 0 1
device=SPICE-vcvs
T 41600 28350 5 10 1 1 0 0 1
refdes=X_fd1
T 41300 29850 5 10 0 0 0 0 1
symversion=0.1
T 42400 29650 5 10 1 1 0 5 1
value=falling_waveform1 spec={spec}
}
C 41000 28400 1 0 0 gnd-1.sym
C 42500 28400 1 0 0 gnd-1.sym
N 41100 29300 40700 29300 4
N 40700 29300 40700 30600 4
C 42500 31200 1 0 0 gnd-1.sym
C 42500 29700 1 0 0 gnd-1.sym
C 42500 32500 1 0 0 gnd-1.sym
N 42600 33400 43200 33400 4
{
T 42800 33400 5 10 1 1 0 0 1
netname=vrd0
}
N 42600 30600 43200 30600 4
{
T 42800 30600 5 10 1 1 0 0 1
netname=vfd0
}
N 42600 29300 43200 29300 4
{
T 42800 29300 5 10 1 1 0 0 1
netname=vfd1
}
N 42600 32100 43200 32100 4
{
T 42800 32100 5 10 1 1 0 0 1
netname=vrd1
}
T 36800 41000 9 10 1 0 0 0 1
Models for pull-up multiplier
T 36800 34200 9 10 1 0 0 0 1
Models for pull-down multiplier
L 44900 40700 44900 34900 3 0 0 2 150 150
L 54700 40700 54700 34900 3 0 0 2 150 150
L 54700 33900 54700 28100 3 0 0 2 150 150
L 44900 33900 44900 28100 3 0 0 2 150 150
T 45700 40000 9 10 1 0 0 0 1
Fixture 0
T 55200 39900 9 10 1 0 0 0 1
Fixture 1
T 54700 45300 9 10 1 0 0 0 1
IBIS Gate Model
T 36700 45000 8 10 1 0 0 0 1
dist-license=GPLv3
T 36706 45200 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 44000 42800 1 270 0 voltage-3.sym
{
T 44700 42600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 44500 42300 5 10 1 1 0 0 1
refdes=V_pu
T 44500 42100 5 10 1 1 0 0 1
value=DC {pullup_reference}
}
C 41000 42800 1 270 0 voltage-3.sym
{
T 41700 42600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 41500 42300 5 10 1 1 0 0 1
refdes=V_pd
T 41500 42100 5 10 1 1 0 0 1
value=DC {pulldown_reference}
}
C 41100 41600 1 0 0 gnd-1.sym
C 44100 41600 1 0 0 gnd-1.sym
C 41000 42800 1 0 0 generic-power.sym
{
T 41200 43050 5 10 1 1 0 3 1
net=Vpd:1
}
C 44000 42800 1 0 0 generic-power.sym
{
T 44200 43050 5 10 1 1 0 3 1
net=Vpu:1
}
C 47700 36200 1 90 0 capacitor-1.sym
{
T 47000 36400 5 10 0 0 90 0 1
device=CAPACITOR
T 47600 36800 5 10 1 1 0 0 1
refdes=C_comp_gc_pu0
T 46800 36400 5 10 0 0 90 0 1
symversion=0.1
T 47600 36400 5 10 1 1 0 0 1
value={C_comp_gnd_clamp}
}
C 47700 38200 1 90 0 capacitor-1.sym
{
T 47000 38400 5 10 0 0 90 0 1
device=CAPACITOR
T 47600 38800 5 10 1 1 0 0 1
refdes=C_comp_pc_pu0
T 46800 38400 5 10 0 0 90 0 1
symversion=0.1
T 47600 38400 5 10 1 1 0 0 1
value={C_comp_power_clamp}
}
C 45900 38200 1 90 0 capacitor-1.sym
{
T 45200 38400 5 10 0 0 90 0 1
device=CAPACITOR
T 45800 38800 5 10 1 1 0 0 1
refdes=C_comp_pu_pu0
T 45000 38400 5 10 0 0 90 0 1
symversion=0.1
T 45800 38400 5 10 1 1 0 0 1
value={C_comp_pullup}
}
C 45900 36200 1 90 0 capacitor-1.sym
{
T 45200 36400 5 10 0 0 90 0 1
device=CAPACITOR
T 45800 36800 5 10 1 1 0 0 1
refdes=C_comp_pd_pu0
T 45000 36400 5 10 0 0 90 0 1
symversion=0.1
T 45800 36400 5 10 1 1 0 0 1
value={C_comp_pulldown}
}
N 50200 37600 50200 38400 4
C 45500 39100 1 0 0 generic-power.sym
{
T 45700 39350 5 10 1 1 0 3 1
net=Vpu:1
}
C 47700 36200 1 180 0 generic-power.sym
{
T 47500 35950 5 10 1 1 180 3 1
net=Vgc:1
}
C 47300 39100 1 0 0 generic-power.sym
{
T 47500 39350 5 10 1 1 0 3 1
net=Vpc:1
}
C 45900 36200 1 180 0 generic-power.sym
{
T 45700 35950 5 10 1 1 180 3 1
net=Vpd:1
}
N 47500 38200 47500 37100 4
N 45700 38200 45700 37100 4
N 48200 37600 47500 37600 4
N 47500 37600 45700 37600 4
C 50100 39000 1 0 0 generic-power.sym
{
T 50300 39250 5 10 1 1 0 3 1
net=Vpu:1
}
C 50500 36200 1 180 0 generic-power.sym
{
T 50300 35950 5 10 1 1 180 3 1
net=Vpd:1
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
N 52000 37600 51800 37600 4
N 58900 37600 60700 37600 4
{
T 58800 37700 5 10 1 1 0 0 1
netname=pullup_fixture1
}
C 61700 35900 1 0 1 gnd-1.sym
C 60100 38300 1 0 0 vcvs-1.sym
{
T 60300 39350 5 10 0 0 0 0 1
device=SPICE-vcvs
T 60400 39150 5 10 1 1 0 0 1
refdes=X_pullup_pu1
T 60300 39550 5 10 0 0 0 0 1
symversion=0.1
T 60800 38250 5 10 1 1 0 5 1
value=pullup0 spec={spec}
}
C 60100 36100 1 0 0 vcvs-1.sym
{
T 60300 37150 5 10 0 0 0 0 1
device=SPICE-vcvs
T 60100 36950 5 10 1 1 0 0 1
refdes=X_pulldown_pu1
T 60300 37350 5 10 0 0 0 0 1
symversion=0.1
T 61300 35850 5 10 1 1 0 5 1
value=pulldown0 spec={spec}
}
N 62700 37600 62900 37600 4
N 62900 37600 62900 37400 4
C 62800 36200 1 0 0 gnd-1.sym
N 60000 36800 60000 37600 4
N 60000 38400 60100 38400 4
C 61500 38100 1 0 0 gnd-1.sym
N 60100 36800 60000 36800 4
C 59000 36400 1 0 0 vdc-1.sym
{
T 58800 37350 5 10 1 1 0 0 1
refdes=Bpu1
T 59700 37250 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 59700 37450 5 10 0 0 0 0 1
footprint=none
T 57600 35500 5 10 1 1 0 0 1
value=V=V(ru_on) > 0  ? V(vru1) : V(vfu1)
}
C 59200 36100 1 0 0 gnd-1.sym
C 61600 37800 1 180 0 current-1.sym
{
T 61000 36800 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 60500 37800 5 10 1 1 0 0 1
refdes=Vfx_pu1
T 60500 37400 5 10 1 1 0 0 1
value=DC 0
}
N 61600 39000 61800 39000 4
{
T 61600 39000 5 10 1 1 0 0 1
netname=I4_pu
}
N 61800 36800 61600 36800 4
{
T 61600 36800 5 10 1 1 0 0 1
netname=I1_pu
}
C 58900 37400 1 0 1 current-1.sym
{
T 58300 38400 5 10 0 0 0 6 1
device=CURRENT_SOURCE
T 57900 38000 5 10 1 1 0 0 1
refdes=V_comp_pu1
T 57900 37800 5 10 1 1 0 0 1
value=DC 0
}
C 57500 36200 1 90 0 capacitor-1.sym
{
T 56800 36400 5 10 0 0 90 0 1
device=CAPACITOR
T 57400 36800 5 10 1 1 0 0 1
refdes=C_comp_gc_pu1
T 56600 36400 5 10 0 0 90 0 1
symversion=0.1
T 57400 36400 5 10 1 1 0 0 1
value={C_comp_gnd_clamp}
}
C 57500 38200 1 90 0 capacitor-1.sym
{
T 56800 38400 5 10 0 0 90 0 1
device=CAPACITOR
T 57400 38800 5 10 1 1 0 0 1
refdes=C_comp_pc_pu1
T 56600 38400 5 10 0 0 90 0 1
symversion=0.1
T 57400 38400 5 10 1 1 0 0 1
value={C_comp_power_clamp}
}
C 55700 38200 1 90 0 capacitor-1.sym
{
T 55000 38400 5 10 0 0 90 0 1
device=CAPACITOR
T 55600 38800 5 10 1 1 0 0 1
refdes=C_comp_pu_pu1
T 54800 38400 5 10 0 0 90 0 1
symversion=0.1
T 55600 38400 5 10 1 1 0 0 1
value={C_comp_pullup}
}
C 55700 36200 1 90 0 capacitor-1.sym
{
T 55000 36400 5 10 0 0 90 0 1
device=CAPACITOR
T 55600 36800 5 10 1 1 0 0 1
refdes=C_comp_pd_pu1
T 54800 36400 5 10 0 0 90 0 1
symversion=0.1
T 55600 36400 5 10 1 1 0 0 1
value={C_comp_pulldown}
}
N 60000 37600 60000 38400 4
C 55300 39100 1 0 0 generic-power.sym
{
T 55500 39350 5 10 1 1 0 3 1
net=Vpu:1
}
C 57500 36200 1 180 0 generic-power.sym
{
T 57300 35950 5 10 1 1 180 3 1
net=Vgc:1
}
C 57100 39100 1 0 0 generic-power.sym
{
T 57300 39350 5 10 1 1 0 3 1
net=Vpc:1
}
C 55700 36200 1 180 0 generic-power.sym
{
T 55500 35950 5 10 1 1 180 3 1
net=Vpd:1
}
N 57300 38200 57300 37100 4
N 55500 38200 55500 37100 4
N 58000 37600 57300 37600 4
N 57300 37600 55500 37600 4
C 59900 39000 1 0 0 generic-power.sym
{
T 60100 39250 5 10 1 1 0 3 1
net=Vpu:1
}
C 60300 36200 1 180 0 generic-power.sym
{
T 60100 35950 5 10 1 1 180 3 1
net=Vpd:1
}
N 61800 37600 61600 37600 4
N 49100 30700 50900 30700 4
{
T 48900 30800 5 10 1 1 0 0 1
netname=pulldown_fixture0
}
C 51900 29000 1 0 1 gnd-1.sym
C 50300 31400 1 0 0 vcvs-1.sym
{
T 50500 32450 5 10 0 0 0 0 1
device=SPICE-vcvs
T 50600 32250 5 10 1 1 0 0 1
refdes=X_pullup_pd0
T 50500 32650 5 10 0 0 0 0 1
symversion=0.1
T 51000 31350 5 10 1 1 0 5 1
value=pullup0 spec={spec}
}
C 50300 29200 1 0 0 vcvs-1.sym
{
T 50500 30250 5 10 0 0 0 0 1
device=SPICE-vcvs
T 50300 30050 5 10 1 1 0 0 1
refdes=X_pulldown_pd0
T 50500 30450 5 10 0 0 0 0 1
symversion=0.1
T 51500 28950 5 10 1 1 0 5 1
value=pulldown0 spec={spec}
}
N 52900 30700 53100 30700 4
N 53100 30700 53100 30500 4
C 53000 29300 1 0 0 gnd-1.sym
N 50200 29900 50200 30700 4
N 50200 31500 50300 31500 4
C 51700 31200 1 0 0 gnd-1.sym
N 50300 29900 50200 29900 4
C 49200 29500 1 0 0 vdc-1.sym
{
T 49000 30450 5 10 1 1 0 0 1
refdes=Bpd0
T 49900 30350 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 49900 30550 5 10 0 0 0 0 1
footprint=none
T 47800 28600 5 10 1 1 0 0 1
value=V=V(rd_on) > 0  ? V(vrd0) : V(vfd0)
}
C 49400 29200 1 0 0 gnd-1.sym
C 51800 30900 1 180 0 current-1.sym
{
T 51200 29900 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 50700 30900 5 10 1 1 0 0 1
refdes=Vfx_pd0
T 50700 30500 5 10 1 1 0 0 1
value=DC 0
}
N 51800 32100 52000 32100 4
{
T 51800 32100 5 10 1 1 0 0 1
netname=I3_pd
}
N 52000 29900 51800 29900 4
{
T 51800 29900 5 10 1 1 0 0 1
netname=I2_pd
}
C 49100 30500 1 0 1 current-1.sym
{
T 48500 31500 5 10 0 0 0 6 1
device=CURRENT_SOURCE
T 48100 31100 5 10 1 1 0 0 1
refdes=V_comp_pd0
T 48100 30900 5 10 1 1 0 0 1
value=DC 0
}
C 47700 29300 1 90 0 capacitor-1.sym
{
T 47000 29500 5 10 0 0 90 0 1
device=CAPACITOR
T 47600 29900 5 10 1 1 0 0 1
refdes=C_comp_gc_pd0
T 46800 29500 5 10 0 0 90 0 1
symversion=0.1
T 47600 29500 5 10 1 1 0 0 1
value={C_comp_gnd_clamp}
}
C 47700 31300 1 90 0 capacitor-1.sym
{
T 47000 31500 5 10 0 0 90 0 1
device=CAPACITOR
T 47600 31900 5 10 1 1 0 0 1
refdes=C_comp_pc_pd0
T 46800 31500 5 10 0 0 90 0 1
symversion=0.1
T 47600 31500 5 10 1 1 0 0 1
value={C_comp_power_clamp}
}
C 45900 31300 1 90 0 capacitor-1.sym
{
T 45200 31500 5 10 0 0 90 0 1
device=CAPACITOR
T 45800 31900 5 10 1 1 0 0 1
refdes=C_comp_pu_pd0
T 45000 31500 5 10 0 0 90 0 1
symversion=0.1
T 45800 31500 5 10 1 1 0 0 1
value={C_comp_pullup}
}
C 45900 29300 1 90 0 capacitor-1.sym
{
T 45200 29500 5 10 0 0 90 0 1
device=CAPACITOR
T 45800 29900 5 10 1 1 0 0 1
refdes=C_comp_pd_pd0
T 45000 29500 5 10 0 0 90 0 1
symversion=0.1
T 45800 29500 5 10 1 1 0 0 1
value={C_comp_pulldown}
}
N 50200 30700 50200 31500 4
C 45500 32200 1 0 0 generic-power.sym
{
T 45700 32450 5 10 1 1 0 3 1
net=Vpu:1
}
C 47700 29300 1 180 0 generic-power.sym
{
T 47500 29050 5 10 1 1 180 3 1
net=Vgc:1
}
C 47300 32200 1 0 0 generic-power.sym
{
T 47500 32450 5 10 1 1 0 3 1
net=Vpc:1
}
C 45900 29300 1 180 0 generic-power.sym
{
T 45700 29050 5 10 1 1 180 3 1
net=Vpd:1
}
N 47500 31300 47500 30200 4
N 45700 31300 45700 30200 4
N 48200 30700 47500 30700 4
N 47500 30700 45700 30700 4
C 50100 32100 1 0 0 generic-power.sym
{
T 50300 32350 5 10 1 1 0 3 1
net=Vpu:1
}
C 50500 29300 1 180 0 generic-power.sym
{
T 50300 29050 5 10 1 1 180 3 1
net=Vpd:1
}
N 52000 30700 51800 30700 4
N 58900 30700 60700 30700 4
{
T 58700 30800 5 10 1 1 0 0 1
netname=pulldown_fixture1
}
C 61700 29000 1 0 1 gnd-1.sym
C 60100 31400 1 0 0 vcvs-1.sym
{
T 60300 32450 5 10 0 0 0 0 1
device=SPICE-vcvs
T 60400 32250 5 10 1 1 0 0 1
refdes=X_pullup_pd1
T 60300 32650 5 10 0 0 0 0 1
symversion=0.1
T 60800 31350 5 10 1 1 0 5 1
value=pullup0 spec={spec}
}
C 60100 29200 1 0 0 vcvs-1.sym
{
T 60300 30250 5 10 0 0 0 0 1
device=SPICE-vcvs
T 60100 30050 5 10 1 1 0 0 1
refdes=X_pulldown_pd1
T 60300 30450 5 10 0 0 0 0 1
symversion=0.1
T 61400 28950 5 10 1 1 0 5 1
value=pulldown0 spec={spec}
}
N 62700 30700 62900 30700 4
N 62900 30700 62900 30500 4
C 62800 29300 1 0 0 gnd-1.sym
N 60000 29900 60000 30700 4
N 60000 31500 60100 31500 4
C 61500 31200 1 0 0 gnd-1.sym
N 60100 29900 60000 29900 4
C 59000 29500 1 0 0 vdc-1.sym
{
T 58800 30450 5 10 1 1 0 0 1
refdes=Bpd1
T 59700 30350 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 59700 30550 5 10 0 0 0 0 1
footprint=none
T 57600 28600 5 10 1 1 0 0 1
value=V=V(rd_on) > 0  ? V(vrd1) : V(vfd1)
}
C 59200 29200 1 0 0 gnd-1.sym
C 61600 30900 1 180 0 current-1.sym
{
T 61000 29900 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 60500 30900 5 10 1 1 0 0 1
refdes=Vfx_pd1
T 60500 30500 5 10 1 1 0 0 1
value=DC 0
}
N 61600 32100 61800 32100 4
{
T 61600 32100 5 10 1 1 0 0 1
netname=I4_pd
}
N 61800 29900 61600 29900 4
{
T 61600 29900 5 10 1 1 0 0 1
netname=I1_pd
}
C 58900 30500 1 0 1 current-1.sym
{
T 58300 31500 5 10 0 0 0 6 1
device=CURRENT_SOURCE
T 57900 31100 5 10 1 1 0 0 1
refdes=V_comp_pd1
T 57900 30900 5 10 1 1 0 0 1
value=DC 0
}
C 57500 29300 1 90 0 capacitor-1.sym
{
T 56800 29500 5 10 0 0 90 0 1
device=CAPACITOR
T 57400 29900 5 10 1 1 0 0 1
refdes=C_comp_gc_pd1
T 56600 29500 5 10 0 0 90 0 1
symversion=0.1
T 57400 29500 5 10 1 1 0 0 1
value={C_comp_gnd_clamp}
}
C 57500 31300 1 90 0 capacitor-1.sym
{
T 56800 31500 5 10 0 0 90 0 1
device=CAPACITOR
T 57400 31900 5 10 1 1 0 0 1
refdes=C_comp_pc_pd1
T 56600 31500 5 10 0 0 90 0 1
symversion=0.1
T 57400 31500 5 10 1 1 0 0 1
value={C_comp_power_clamp}
}
C 55700 31300 1 90 0 capacitor-1.sym
{
T 55000 31500 5 10 0 0 90 0 1
device=CAPACITOR
T 55600 31900 5 10 1 1 0 0 1
refdes=C_comp_pu_pd1
T 54800 31500 5 10 0 0 90 0 1
symversion=0.1
T 55600 31500 5 10 1 1 0 0 1
value={C_comp_pullup}
}
C 55700 29300 1 90 0 capacitor-1.sym
{
T 55000 29500 5 10 0 0 90 0 1
device=CAPACITOR
T 55600 29900 5 10 1 1 0 0 1
refdes=C_comp_pd_pd1
T 54800 29500 5 10 0 0 90 0 1
symversion=0.1
T 55600 29500 5 10 1 1 0 0 1
value={C_comp_pulldown}
}
N 60000 30700 60000 31500 4
C 55300 32200 1 0 0 generic-power.sym
{
T 55500 32450 5 10 1 1 0 3 1
net=Vpu:1
}
C 57500 29300 1 180 0 generic-power.sym
{
T 57300 29050 5 10 1 1 180 3 1
net=Vgc:1
}
C 57100 32200 1 0 0 generic-power.sym
{
T 57300 32450 5 10 1 1 0 3 1
net=Vpc:1
}
C 55700 29300 1 180 0 generic-power.sym
{
T 55500 29050 5 10 1 1 180 3 1
net=Vpd:1
}
N 57300 31300 57300 30200 4
N 55500 31300 55500 30200 4
N 58000 30700 57300 30700 4
N 57300 30700 55500 30700 4
C 59900 32100 1 0 0 generic-power.sym
{
T 60100 32350 5 10 1 1 0 3 1
net=Vpu:1
}
C 60300 29300 1 180 0 generic-power.sym
{
T 60100 29050 5 10 1 1 180 3 1
net=Vpd:1
}
N 61800 30700 61600 30700 4
T 45700 33100 9 10 1 0 0 0 1
Fixture 0
T 55200 33000 9 10 1 0 0 0 1
Fixture 1
C 61800 37500 1 0 0 resistor-1.sym
{
T 62100 37900 5 10 0 0 0 0 1
device=RESISTOR
T 61800 37800 5 10 1 1 0 0 1
refdes=R_fixture_pu1
T 61700 37300 5 10 1 1 0 0 1
value={R_fixture1}
}
C 62700 37400 1 270 0 voltage-3.sym
{
T 63400 37200 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 63000 37200 5 10 1 1 0 0 1
refdes=V_fixture_pu1
T 63000 36600 5 10 1 1 0 0 1
value=DC {V_fixture1}
}
C 52000 30600 1 0 0 resistor-1.sym
{
T 52300 31000 5 10 0 0 0 0 1
device=RESISTOR
T 52000 30900 5 10 1 1 0 0 1
refdes=R_fixture_pd0
T 51900 30400 5 10 1 1 0 0 1
value={R_fixture0}
}
C 52900 30500 1 270 0 voltage-3.sym
{
T 53600 30300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 53200 30300 5 10 1 1 0 0 1
refdes=V_fixture_pd0
T 53200 29700 5 10 1 1 0 0 1
value=DC {V_fixture0}
}
C 61800 30600 1 0 0 resistor-1.sym
{
T 62100 31000 5 10 0 0 0 0 1
device=RESISTOR
T 61800 30900 5 10 1 1 0 0 1
refdes=R_fixture_pd1
T 61700 30400 5 10 1 1 0 0 1
value={R_fixture1}
}
C 62700 30500 1 270 0 voltage-3.sym
{
T 63400 30300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 63000 30300 5 10 1 1 0 0 1
refdes=V_fixture_pd1
T 63000 29700 5 10 1 1 0 0 1
value=DC {V_fixture1}
}
C 56600 35300 1 90 0 capacitor-1.sym
{
T 55900 35500 5 10 0 0 90 0 1
device=CAPACITOR
T 55300 35500 5 10 1 1 0 0 1
refdes=C_comp_pu1
T 55700 35500 5 10 0 0 90 0 1
symversion=0.1
T 56500 35500 5 10 1 1 0 0 1
value={C_comp}
}
C 56300 35000 1 0 0 gnd-1.sym
N 56400 36200 56400 37600 4
C 56600 28400 1 90 0 capacitor-1.sym
{
T 55900 28600 5 10 0 0 90 0 1
device=CAPACITOR
T 55300 28600 5 10 1 1 0 0 1
refdes=C_comp_pd1
T 55700 28600 5 10 0 0 90 0 1
symversion=0.1
T 56500 28600 5 10 1 1 0 0 1
value={C_comp}
}
C 56300 28100 1 0 0 gnd-1.sym
N 56400 29300 56400 30700 4
C 46800 28400 1 90 0 capacitor-1.sym
{
T 46100 28600 5 10 0 0 90 0 1
device=CAPACITOR
T 45500 28600 5 10 1 1 0 0 1
refdes=C_comp_pd0
T 45900 28600 5 10 0 0 90 0 1
symversion=0.1
T 46700 28600 5 10 1 1 0 0 1
value={C_comp}
}
C 46500 28100 1 0 0 gnd-1.sym
N 46600 29300 46600 30700 4
C 46800 35300 1 90 0 capacitor-1.sym
{
T 46100 35500 5 10 0 0 90 0 1
device=CAPACITOR
T 45500 35500 5 10 1 1 0 0 1
refdes=C_comp_pu0
T 45900 35500 5 10 0 0 90 0 1
symversion=0.1
T 46700 35500 5 10 1 1 0 0 1
value={C_comp}
}
C 46500 35000 1 0 0 gnd-1.sym
N 46600 36200 46600 37600 4
C 42800 41500 1 0 0 gnd-1.sym
N 42700 41800 42900 41800 4
{
T 42700 41800 5 10 1 1 0 0 1
netname=0
}
C 49300 42300 1 270 0 voltage-3.sym
{
T 50000 42100 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 48900 42100 5 10 1 1 0 0 1
refdes=B_Kpd
T 46300 42700 5 10 1 1 0 0 3
value=V=
+   ((I(Vfx_pd0) - I(V_comp_pd0)) * V(I4_pd) + (I(Vfx_pd1) - I(V_comp_pd1)) * V(I3_pd))/
+                                 (V(I2_pd) * V(I4_pd) - V(I1_pd) * V(I3_pd))
}
C 49300 44400 1 270 0 voltage-3.sym
{
T 50000 44200 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 48900 44200 5 10 1 1 0 0 1
refdes=B_Kpu
T 46000 44700 5 10 1 1 0 0 3
value=V=
+    ((I(Vfx_pu0) - I(V_comp_pu0)) * V(I1_pu) + (I(Vfx_pu1) - I(V_comp_pu1)) * V(I2_pu))/
+                               (V(I2_pu) * V(I4_pu) - V(I1_pu) * V(I3_pu))
}
C 49400 43200 1 0 0 gnd-1.sym
C 49400 41100 1 0 0 gnd-1.sym
N 49500 42300 49900 42300 4
{
T 49500 42300 5 10 1 1 0 0 1
netname=Kpd
}
N 49500 44400 49900 44400 4
{
T 49500 44400 5 10 1 1 0 0 1
netname=Kpu
}
C 37200 42100 1 90 0 resistor-1.sym
{
T 36800 42400 5 10 0 0 90 0 1
device=RESISTOR
T 37200 42700 5 10 1 1 0 0 1
refdes=R_out_gnd_ref
T 37200 42300 5 10 1 1 0 0 1
value=1e18
}
C 37000 41800 1 0 0 gnd-1.sym
N 37100 43000 37400 43000 4
{
T 37100 43000 5 10 1 1 0 0 1
netname=out
}
C 39100 42100 1 90 0 resistor-1.sym
{
T 38700 42400 5 10 0 0 90 0 1
device=RESISTOR
T 39100 42700 5 10 1 1 0 0 1
refdes=R_en_gnd_ref
T 39100 42300 5 10 1 1 0 0 1
value=1e18
}
C 38900 41800 1 0 0 gnd-1.sym
N 39000 43000 39300 43000 4
{
T 39000 43000 5 10 1 1 0 0 1
netname=en
}
C 55700 41700 1 0 0 gnd-1.sym

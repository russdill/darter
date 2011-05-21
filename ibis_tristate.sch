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
N 47600 37500 54100 37500 4
{
T 48500 37600 5 10 1 1 0 0 1
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
C 50000 35800 1 0 1 gnd-1.sym
C 48400 38200 1 0 0 vcvs-1.sym
{
T 48600 39250 5 10 0 0 0 0 1
device=SPICE-vcvs
T 48700 39050 5 10 1 1 0 0 1
refdes=X_pullup_pu0
T 48600 39450 5 10 0 0 0 0 1
symversion=0.1
T 49200 37850 5 10 1 1 180 5 1
value=pullup0 spec={spec}
}
C 48400 36000 1 0 0 vcvs-1.sym
{
T 48600 37050 5 10 0 0 0 0 1
device=SPICE-vcvs
T 48400 36850 5 10 1 1 0 0 1
refdes=X_pulldown_pu0
T 48600 37250 5 10 0 0 0 0 1
symversion=0.1
T 49400 35450 5 10 1 1 180 5 1
value=pulldown0 spec={spec}
}
C 55200 37400 1 0 0 resistor-1.sym
{
T 55500 37800 5 10 0 0 0 0 1
device=RESISTOR
T 55200 37700 5 10 1 1 0 0 1
refdes=R_fixture_pu0
T 55100 37200 5 10 1 1 0 0 1
value={R_fixture0}
}
C 56100 37300 1 270 0 voltage-3.sym
{
T 56800 37100 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 56400 37100 5 10 1 1 0 0 1
refdes=V_fixture_pu0
T 56400 36500 5 10 1 1 0 0 1
value=DC {V_fixture0}
}
N 56100 37500 56300 37500 4
N 56300 37500 56300 37300 4
C 56200 36100 1 0 0 gnd-1.sym
N 48300 36700 48300 37500 4
N 47900 38300 48400 38300 4
C 49800 38000 1 0 0 gnd-1.sym
N 48400 36700 48300 36700 4
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
C 47500 36100 1 0 0 gnd-1.sym
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
N 49900 38900 50100 38900 4
{
T 49900 38900 5 10 1 1 0 0 1
netname=I3_pu
}
N 50100 36700 49900 36700 4
{
T 49900 36700 5 10 1 1 0 0 1
netname=I2_pu
}
B 36800 34700 36000 6200 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
B 54700 41200 5500 4000 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
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
L 58900 40700 58900 34900 3 0 0 2 150 150
L 58900 33900 58900 28100 3 0 0 2 150 150
L 44900 33900 44900 28100 3 0 0 2 150 150
T 45700 40000 9 10 1 0 0 0 1
Fixture 0
T 59600 39900 9 10 1 0 0 0 1
Fixture 1
T 54700 45300 9 10 1 0 0 0 1
IBIS Gate Model
T 36800 45400 8 10 1 0 0 0 1
dist-license=GPLv3
T 36806 45600 8 10 1 0 0 0 1
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
N 48300 37500 48300 38300 4
C 48200 38900 1 0 0 generic-power.sym
{
T 48400 39150 5 10 1 1 0 3 1
net=Vpu:1
}
C 48600 36100 1 180 0 generic-power.sym
{
T 48400 35850 5 10 1 1 180 3 1
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
N 61600 37500 68100 37500 4
{
T 62500 37600 5 10 1 1 0 0 1
netname=pullup_fixture1
}
C 64000 35800 1 0 1 gnd-1.sym
C 62400 38200 1 0 0 vcvs-1.sym
{
T 62600 39250 5 10 0 0 0 0 1
device=SPICE-vcvs
T 62700 39050 5 10 1 1 0 0 1
refdes=X_pullup_pu1
T 62600 39450 5 10 0 0 0 0 1
symversion=0.1
T 63200 37850 5 10 1 1 180 5 1
value=pullup0 spec={spec}
}
C 62400 36000 1 0 0 vcvs-1.sym
{
T 62600 37050 5 10 0 0 0 0 1
device=SPICE-vcvs
T 62400 36850 5 10 1 1 0 0 1
refdes=X_pulldown_pu1
T 62600 37250 5 10 0 0 0 0 1
symversion=0.1
T 63200 35450 5 10 1 1 180 5 1
value=pulldown0 spec={spec}
}
N 70100 37500 70300 37500 4
N 70300 37500 70300 37300 4
C 70200 36100 1 0 0 gnd-1.sym
N 62300 36700 62300 37500 4
N 61900 38300 62400 38300 4
C 63800 38000 1 0 0 gnd-1.sym
N 62400 36700 62300 36700 4
N 63900 38900 64100 38900 4
{
T 63900 38900 5 10 1 1 0 0 1
netname=I4_pu
}
N 64100 36700 63900 36700 4
{
T 63900 36700 5 10 1 1 0 0 1
netname=I1_pu
}
N 62300 37500 62300 38300 4
C 62200 38900 1 0 0 generic-power.sym
{
T 62400 39150 5 10 1 1 0 3 1
net=Vpu:1
}
C 62600 36100 1 180 0 generic-power.sym
{
T 62400 35850 5 10 1 1 180 3 1
net=Vpd:1
}
N 47600 30600 54100 30600 4
{
T 48600 30700 5 10 1 1 0 0 1
netname=pulldown_fixture0
}
C 50000 28900 1 0 1 gnd-1.sym
C 48400 31300 1 0 0 vcvs-1.sym
{
T 48600 32350 5 10 0 0 0 0 1
device=SPICE-vcvs
T 48700 32150 5 10 1 1 0 0 1
refdes=X_pullup_pd0
T 48600 32550 5 10 0 0 0 0 1
symversion=0.1
T 49300 30950 5 10 1 1 180 5 1
value=pullup0 spec={spec}
}
C 48400 29100 1 0 0 vcvs-1.sym
{
T 48600 30150 5 10 0 0 0 0 1
device=SPICE-vcvs
T 48400 29950 5 10 1 1 0 0 1
refdes=X_pulldown_pd0
T 48600 30350 5 10 0 0 0 0 1
symversion=0.1
T 49400 28550 5 10 1 1 180 5 1
value=pulldown0 spec={spec}
}
N 56100 30600 56300 30600 4
N 56300 30600 56300 30400 4
C 56200 29200 1 0 0 gnd-1.sym
N 48300 29800 48300 30600 4
N 47900 31400 48400 31400 4
C 49800 31100 1 0 0 gnd-1.sym
N 48400 29800 48300 29800 4
N 49900 32000 50100 32000 4
{
T 49900 32000 5 10 1 1 0 0 1
netname=I3_pd
}
N 50100 29800 49900 29800 4
{
T 49900 29800 5 10 1 1 0 0 1
netname=I2_pd
}
N 48300 30600 48300 31400 4
C 48200 32000 1 0 0 generic-power.sym
{
T 48400 32250 5 10 1 1 0 3 1
net=Vpu:1
}
C 48600 29200 1 180 0 generic-power.sym
{
T 48400 28950 5 10 1 1 180 3 1
net=Vpd:1
}
N 61600 30600 68100 30600 4
{
T 62500 30700 5 10 1 1 0 0 1
netname=pulldown_fixture1
}
C 64000 28900 1 0 1 gnd-1.sym
C 62400 31300 1 0 0 vcvs-1.sym
{
T 62600 32350 5 10 0 0 0 0 1
device=SPICE-vcvs
T 62700 32150 5 10 1 1 0 0 1
refdes=X_pullup_pd1
T 62600 32550 5 10 0 0 0 0 1
symversion=0.1
T 63200 30950 5 10 1 1 180 5 1
value=pullup0 spec={spec}
}
C 62400 29100 1 0 0 vcvs-1.sym
{
T 62600 30150 5 10 0 0 0 0 1
device=SPICE-vcvs
T 62400 29950 5 10 1 1 0 0 1
refdes=X_pulldown_pd1
T 62600 30350 5 10 0 0 0 0 1
symversion=0.1
T 63300 28550 5 10 1 1 180 5 1
value=pulldown0 spec={spec}
}
N 70100 30600 70300 30600 4
N 70300 30600 70300 30400 4
C 70200 29200 1 0 0 gnd-1.sym
N 62300 29800 62300 30600 4
N 61900 31400 62400 31400 4
C 63800 31100 1 0 0 gnd-1.sym
N 62400 29800 62300 29800 4
N 63900 32000 64100 32000 4
{
T 63900 32000 5 10 1 1 0 0 1
netname=I4_pd
}
N 64100 29800 63900 29800 4
{
T 63900 29800 5 10 1 1 0 0 1
netname=I1_pd
}
N 62300 30600 62300 31400 4
C 62200 32000 1 0 0 generic-power.sym
{
T 62400 32250 5 10 1 1 0 3 1
net=Vpu:1
}
C 62600 29200 1 180 0 generic-power.sym
{
T 62400 28950 5 10 1 1 180 3 1
net=Vpd:1
}
T 45900 33100 9 10 1 0 0 0 1
Fixture 0
T 59600 33000 9 10 1 0 0 0 1
Fixture 1
C 69200 37400 1 0 0 resistor-1.sym
{
T 69500 37800 5 10 0 0 0 0 1
device=RESISTOR
T 69200 37700 5 10 1 1 0 0 1
refdes=R_fixture_pu1
T 69100 37200 5 10 1 1 0 0 1
value={R_fixture1}
}
C 70100 37300 1 270 0 voltage-3.sym
{
T 70800 37100 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 70400 37100 5 10 1 1 0 0 1
refdes=V_fixture_pu1
T 70400 36500 5 10 1 1 0 0 1
value=DC {V_fixture1}
}
C 55200 30500 1 0 0 resistor-1.sym
{
T 55500 30900 5 10 0 0 0 0 1
device=RESISTOR
T 55200 30800 5 10 1 1 0 0 1
refdes=R_fixture_pd0
T 55100 30300 5 10 1 1 0 0 1
value={R_fixture0}
}
C 56100 30400 1 270 0 voltage-3.sym
{
T 56800 30200 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 56400 30200 5 10 1 1 0 0 1
refdes=V_fixture_pd0
T 56400 29600 5 10 1 1 0 0 1
value=DC {V_fixture0}
}
C 69200 30500 1 0 0 resistor-1.sym
{
T 69500 30900 5 10 0 0 0 0 1
device=RESISTOR
T 69200 30800 5 10 1 1 0 0 1
refdes=R_fixture_pd1
T 69100 30300 5 10 1 1 0 0 1
value={R_fixture1}
}
C 70100 30400 1 270 0 voltage-3.sym
{
T 70800 30200 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 70400 30200 5 10 1 1 0 0 1
refdes=V_fixture_pd1
T 70400 29600 5 10 1 1 0 0 1
value=DC {V_fixture1}
}
C 42800 41500 1 0 0 gnd-1.sym
N 42700 41800 42900 41800 4
{
T 42700 41800 5 10 1 1 0 0 1
netname=0
}
C 53100 42300 1 270 0 voltage-3.sym
{
T 53800 42100 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 52700 42100 5 10 1 1 0 0 1
refdes=B_Kpd
T 47700 42600 5 10 1 1 0 0 2
value=V=((I(Vfx_pd0) - V(Icomp_pd0)) * V(I4_pd) + (I(Vfx_pd1) - V(Icomp_pd1)) * V(I3_pd)) /
+   (V(I2_pd) * V(I4_pd) - V(I1_pd) * V(I3_pd))
}
C 53100 44400 1 270 0 voltage-3.sym
{
T 53800 44200 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 52700 44200 5 10 1 1 0 0 1
refdes=B_Kpu
T 47700 44700 5 10 1 1 0 0 2
value=V=((I(Vfx_pu0) - V(Icomp_pu0)) * V(I1_pu) + (I(Vfx_pu1) - V(Icomp_pu1)) * V(I2_pu)) /
+    (V(I2_pu) * V(I4_pu) - V(I1_pu) * V(I3_pu))
}
C 53200 43200 1 0 0 gnd-1.sym
C 53200 41100 1 0 0 gnd-1.sym
N 53300 42300 53700 42300 4
{
T 53300 42300 5 10 1 1 0 0 1
netname=Kpd
}
N 53300 44400 53700 44400 4
{
T 53300 44400 5 10 1 1 0 0 1
netname=Kpu
}
C 42400 42800 1 90 0 resistor-1.sym
{
T 42000 43100 5 10 0 0 90 0 1
device=RESISTOR
T 42400 43400 5 10 1 1 0 0 1
refdes=R_out_gnd_ref
T 42400 43000 5 10 1 1 0 0 1
value=1e18
}
C 42200 42500 1 0 0 gnd-1.sym
N 42300 43700 42600 43700 4
{
T 42300 43700 5 10 1 1 0 0 1
netname=out
}
C 45400 42800 1 90 0 resistor-1.sym
{
T 45000 43100 5 10 0 0 90 0 1
device=RESISTOR
T 45400 43400 5 10 1 1 0 0 1
refdes=R_en_gnd_ref
T 45400 43000 5 10 1 1 0 0 1
value=1e18
}
C 45200 42500 1 0 0 gnd-1.sym
N 45300 43700 45600 43700 4
{
T 45300 43700 5 10 1 1 0 0 1
netname=en
}
C 55700 41700 1 0 0 gnd-1.sym
N 50500 36700 50500 37500 4
C 52100 35800 1 0 1 gnd-1.sym
C 50500 38200 1 0 0 vcvs-1.sym
{
T 50700 39250 5 10 0 0 0 0 1
device=SPICE-vcvs
T 51100 39050 5 10 1 1 0 0 1
refdes=X_pc_pu0
T 50700 39450 5 10 0 0 0 0 1
symversion=0.1
T 51700 37850 5 10 1 1 180 5 1
value=power_clamp0 spec={spec}
}
C 50500 36000 1 0 0 vcvs-1.sym
{
T 50700 37050 5 10 0 0 0 0 1
device=SPICE-vcvs
T 51100 36850 5 10 1 1 0 0 1
refdes=X_gc_pu0
T 50700 37250 5 10 0 0 0 0 1
symversion=0.1
T 51400 35450 5 10 1 1 180 5 1
value=gnd_clamp0 spec={spec}
}
C 52100 38000 1 0 1 gnd-1.sym
N 52600 38900 52000 38900 4
{
T 52000 38900 5 10 1 1 0 0 1
netname=Ipc_pu0
}
N 52600 36700 52000 36700 4
{
T 52000 36700 5 10 1 1 0 0 1
netname=Igc_pu0
}
C 50300 38900 1 0 0 generic-power.sym
{
T 50500 39150 5 10 1 1 0 3 1
net=Vpc:1
}
C 50700 36100 1 180 0 generic-power.sym
{
T 50500 35850 5 10 1 1 180 3 1
net=Vgc:1
}
N 50500 37500 50500 38300 4
N 50500 29800 50500 30600 4
C 52100 28900 1 0 1 gnd-1.sym
C 50500 31300 1 0 0 vcvs-1.sym
{
T 50700 32350 5 10 0 0 0 0 1
device=SPICE-vcvs
T 51100 32150 5 10 1 1 0 0 1
refdes=X_pc_pd0
T 50700 32550 5 10 0 0 0 0 1
symversion=0.1
T 51700 30950 5 10 1 1 180 5 1
value=power_clamp0 spec={spec}
}
C 50500 29100 1 0 0 vcvs-1.sym
{
T 50700 30150 5 10 0 0 0 0 1
device=SPICE-vcvs
T 51100 29950 5 10 1 1 0 0 1
refdes=X_gc_pd0
T 50700 30350 5 10 0 0 0 0 1
symversion=0.1
T 51400 28550 5 10 1 1 180 5 1
value=gnd_clamp0 spec={spec}
}
C 52100 31100 1 0 1 gnd-1.sym
N 52600 32000 52000 32000 4
{
T 52000 32000 5 10 1 1 0 0 1
netname=Ipc_pd0
}
N 52600 29800 52000 29800 4
{
T 52000 29800 5 10 1 1 0 0 1
netname=Igc_pd0
}
C 50300 32000 1 0 0 generic-power.sym
{
T 50500 32250 5 10 1 1 0 3 1
net=Vpc:1
}
C 50700 29200 1 180 0 generic-power.sym
{
T 50500 28950 5 10 1 1 180 3 1
net=Vgc:1
}
N 50500 30600 50500 31400 4
N 64500 36700 64500 37500 4
C 66100 35800 1 0 1 gnd-1.sym
C 64500 38200 1 0 0 vcvs-1.sym
{
T 64700 39250 5 10 0 0 0 0 1
device=SPICE-vcvs
T 65100 39050 5 10 1 1 0 0 1
refdes=X_pc_pu1
T 64700 39450 5 10 0 0 0 0 1
symversion=0.1
T 65700 37850 5 10 1 1 180 5 1
value=power_clamp0 spec={spec}
}
C 64500 36000 1 0 0 vcvs-1.sym
{
T 64700 37050 5 10 0 0 0 0 1
device=SPICE-vcvs
T 65100 36850 5 10 1 1 0 0 1
refdes=X_gc_pu1
T 64700 37250 5 10 0 0 0 0 1
symversion=0.1
T 65300 35450 5 10 1 1 180 5 1
value=gnd_clamp0 spec={spec}
}
C 66100 38000 1 0 1 gnd-1.sym
N 66600 38900 66000 38900 4
{
T 66000 38900 5 10 1 1 0 0 1
netname=Ipc_pu1
}
N 66600 36700 66000 36700 4
{
T 66000 36700 5 10 1 1 0 0 1
netname=Igc_pu1
}
C 64300 38900 1 0 0 generic-power.sym
{
T 64500 39150 5 10 1 1 0 3 1
net=Vpc:1
}
C 64700 36100 1 180 0 generic-power.sym
{
T 64500 35850 5 10 1 1 180 3 1
net=Vgc:1
}
N 64500 37500 64500 38300 4
N 64500 29800 64500 30600 4
C 66100 28900 1 0 1 gnd-1.sym
C 64500 31300 1 0 0 vcvs-1.sym
{
T 64700 32350 5 10 0 0 0 0 1
device=SPICE-vcvs
T 65100 32150 5 10 1 1 0 0 1
refdes=X_pc_pd1
T 64700 32550 5 10 0 0 0 0 1
symversion=0.1
T 65700 30950 5 10 1 1 180 5 1
value=power_clamp0 spec={spec}
}
C 64500 29100 1 0 0 vcvs-1.sym
{
T 64700 30150 5 10 0 0 0 0 1
device=SPICE-vcvs
T 65100 29950 5 10 1 1 0 0 1
refdes=X_gc_pd1
T 64700 30350 5 10 0 0 0 0 1
symversion=0.1
T 65400 28550 5 10 1 1 180 5 1
value=gnd_clamp0 spec={spec}
}
C 66100 31100 1 0 1 gnd-1.sym
N 66600 32000 66000 32000 4
{
T 66000 32000 5 10 1 1 0 0 1
netname=Ipc_pd1
}
N 66600 29800 66000 29800 4
{
T 66000 29800 5 10 1 1 0 0 1
netname=Igc_pd1
}
C 64300 32000 1 0 0 generic-power.sym
{
T 64500 32250 5 10 1 1 0 3 1
net=Vpc:1
}
C 64700 29200 1 180 0 generic-power.sym
{
T 64500 28950 5 10 1 1 180 3 1
net=Vgc:1
}
N 64500 30600 64500 31400 4
C 47400 37300 1 270 0 voltage-3.sym
{
T 48100 37100 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 47000 37100 5 10 1 1 0 0 1
refdes=B_pu0
T 45400 37600 5 10 1 1 0 0 1
value=V=V(ru_on) > 0  ? V(vru0) : V(vfu0)
}
C 55000 37700 1 180 0 current-1.sym
{
T 54400 36700 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 53800 37700 5 10 1 1 0 0 1
refdes=Vfx_pu0
T 54000 37200 5 10 1 1 0 0 1
value=DC 0
}
N 47600 37300 47600 37500 4
C 69000 37700 1 180 0 current-1.sym
{
T 68400 36700 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 67700 37600 5 10 1 1 0 0 1
refdes=Vfx_pu1
T 68000 37200 5 10 1 1 0 0 1
value=DC 0
}
N 61600 37300 61600 37500 4
C 61400 37300 1 270 0 voltage-3.sym
{
T 62100 37100 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 61000 36500 5 10 1 1 0 0 1
refdes=B_pu1
T 59400 37600 5 10 1 1 0 0 1
value=V=V(ru_on) > 0  ? V(vru1) : V(vfu1)
}
C 61500 36100 1 0 0 gnd-1.sym
C 47500 29200 1 0 0 gnd-1.sym
C 47400 30400 1 270 0 voltage-3.sym
{
T 48100 30200 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 47000 29600 5 10 1 1 0 0 1
refdes=B_pd0
T 45400 30700 5 10 1 1 0 0 1
value=V=V(rd_on) > 0  ? V(vrd0) : V(vfd0)
}
C 55000 30800 1 180 0 current-1.sym
{
T 54400 29800 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 53700 30800 5 10 1 1 0 0 1
refdes=Vfx_pd0
T 54000 30300 5 10 1 1 0 0 1
value=DC 0
}
N 47600 30400 47600 30600 4
C 69000 30800 1 180 0 current-1.sym
{
T 68400 29800 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 67700 30800 5 10 1 1 0 0 1
refdes=Vfx_pd1
T 68000 30300 5 10 1 1 0 0 1
value=DC 0
}
N 61600 30400 61600 30600 4
C 61400 30400 1 270 0 voltage-3.sym
{
T 62100 30200 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 61000 29600 5 10 1 1 0 0 1
refdes=B_pd1
T 59400 30700 5 10 1 1 0 0 1
value=V=V(rd_on) > 0  ? V(vrd1) : V(vfd1)
}
C 61500 29200 1 0 0 gnd-1.sym
C 53700 37700 1 90 0 current-1.sym
{
T 52700 38300 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 52600 37600 5 10 1 1 0 0 1
refdes=B_pc_pu0
T 52400 38400 5 10 1 1 0 0 1
value=I=V(Ipc_pu0)
}
C 53300 37300 1 270 0 current-1.sym
{
T 54300 36700 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 52600 37100 5 10 1 1 0 0 1
refdes=B_gc_pu0
T 52400 36400 5 10 1 1 0 0 1
value=I=V(Igc_pu0)
}
N 53500 37500 53500 37700 4
N 53500 37500 53500 37300 4
N 53500 38600 53500 38700 4
N 53500 36400 53500 36300 4
C 53300 38700 1 0 0 generic-power.sym
{
T 53500 38950 5 10 1 1 0 3 1
net=Vpc:1
}
C 53700 36300 1 180 0 generic-power.sym
{
T 53500 36050 5 10 1 1 180 3 1
net=Vgc:1
}
C 53700 30800 1 90 0 current-1.sym
{
T 52700 31400 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 52600 30700 5 10 1 1 0 0 1
refdes=B_pc_pd0
T 52400 31500 5 10 1 1 0 0 1
value=I=V(Ipc_pd0)
}
C 53300 30400 1 270 0 current-1.sym
{
T 54300 29800 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 52600 30200 5 10 1 1 0 0 1
refdes=B_gc_pd0
T 52400 29500 5 10 1 1 0 0 1
value=I=V(Igc_pd0)
}
N 53500 30600 53500 30800 4
N 53500 30600 53500 30400 4
N 53500 31700 53500 31800 4
N 53500 29500 53500 29400 4
C 53300 31800 1 0 0 generic-power.sym
{
T 53500 32050 5 10 1 1 0 3 1
net=Vpc:1
}
C 53700 29400 1 180 0 generic-power.sym
{
T 53500 29150 5 10 1 1 180 3 1
net=Vgc:1
}
C 67700 37700 1 90 0 current-1.sym
{
T 66700 38300 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 66600 37600 5 10 1 1 0 0 1
refdes=B_pc_pu1
T 66400 38400 5 10 1 1 0 0 1
value=I=V(Ipc_pu1)
}
C 67300 37300 1 270 0 current-1.sym
{
T 68300 36700 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 66600 37100 5 10 1 1 0 0 1
refdes=B_gc_pu1
T 66400 36400 5 10 1 1 0 0 1
value=I=V(Igc_pu1)
}
N 67500 37500 67500 37700 4
N 67500 37500 67500 37300 4
N 67500 38600 67500 38700 4
N 67500 36400 67500 36300 4
C 67300 38700 1 0 0 generic-power.sym
{
T 67500 38950 5 10 1 1 0 3 1
net=Vpc:1
}
C 67700 36300 1 180 0 generic-power.sym
{
T 67500 36050 5 10 1 1 180 3 1
net=Vgc:1
}
C 67700 30800 1 90 0 current-1.sym
{
T 66700 31400 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 66600 30700 5 10 1 1 0 0 1
refdes=B_pc_pd1
T 66400 31500 5 10 1 1 0 0 1
value=I=V(Ipc_pd1)
}
C 67300 30400 1 270 0 current-1.sym
{
T 68300 29800 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 66600 30200 5 10 1 1 0 0 1
refdes=B_gc_pd1
T 66400 29500 5 10 1 1 0 0 1
value=I=V(Igc_pd1)
}
N 67500 30600 67500 30800 4
N 67500 30600 67500 30400 4
N 67500 31700 67500 31800 4
N 67500 29500 67500 29400 4
C 67300 31800 1 0 0 generic-power.sym
{
T 67500 32050 5 10 1 1 0 3 1
net=Vpc:1
}
C 67700 29400 1 180 0 generic-power.sym
{
T 67500 29150 5 10 1 1 180 3 1
net=Vgc:1
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
C 46700 38000 1 270 1 vexp-1.sym
{
T 46700 38650 5 10 1 1 0 0 1
refdes=A_comp_pu0
T 47550 38700 5 10 0 0 90 2 1
device=vexp
T 47750 38700 5 10 0 0 90 2 1
footprint=none
T 46400 38050 5 10 1 1 0 0 1
value=comp0
}
N 46700 38300 46000 38300 4
{
T 45800 38400 5 10 1 1 0 0 1
netname=Icomp_pu0
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
N 55000 37500 55200 37500 4
N 69000 30600 69200 30600 4
N 69000 37500 69200 37500 4
N 55000 30600 55200 30600 4
C 46700 31100 1 270 1 vexp-1.sym
{
T 46700 31750 5 10 1 1 0 0 1
refdes=A_comp_pd0
T 47550 31800 5 10 0 0 90 2 1
device=vexp
T 47750 31800 5 10 0 0 90 2 1
footprint=none
T 46400 31150 5 10 1 1 0 0 1
value=comp0
}
N 46700 31400 46000 31400 4
{
T 45800 31500 5 10 1 1 0 0 1
netname=Icomp_pd0
}
C 60700 38000 1 270 1 vexp-1.sym
{
T 60700 38650 5 10 1 1 0 0 1
refdes=A_comp_pu1
T 61550 38700 5 10 0 0 90 2 1
device=vexp
T 61750 38700 5 10 0 0 90 2 1
footprint=none
T 60400 38050 5 10 1 1 0 0 1
value=comp1
}
N 60700 38300 60000 38300 4
{
T 59800 38400 5 10 1 1 0 0 1
netname=Icomp_pu1
}
C 60700 31100 1 270 1 vexp-1.sym
{
T 60700 31750 5 10 1 1 0 0 1
refdes=A_comp_pd1
T 61550 31800 5 10 0 0 90 2 1
device=vexp
T 61750 31800 5 10 0 0 90 2 1
footprint=none
T 60400 31150 5 10 1 1 0 0 1
value=comp1
}
N 60700 31400 60000 31400 4
{
T 59800 31500 5 10 1 1 0 0 1
netname=Icomp_pd1
}

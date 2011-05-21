v 20110115 2
N 39600 31300 41500 31300 4
{
T 41100 31400 5 10 1 1 0 0 1
netname=pad
}
N 39600 31900 39600 31300 4
C 39400 31800 1 0 1 vcvs-1.sym
{
T 39200 32850 5 10 0 0 0 6 1
device=SPICE-vcvs
T 38800 32650 5 10 1 1 0 6 1
refdes=X_pu
T 39200 33050 5 10 0 0 0 6 1
symversion=0.1
T 38800 31550 5 10 1 1 0 5 1
value=pullup0 spec={spec}
}
N 39400 31900 39600 31900 4
C 44100 43800 1 270 0 voltage-3.sym
{
T 44800 43600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 44600 43300 5 10 1 1 0 0 1
refdes=V_gc
T 44600 43100 5 10 1 1 0 0 1
value=DC {gnd_clamp_reference}
}
C 41100 43800 1 270 0 voltage-3.sym
{
T 41800 43600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 41600 43300 5 10 1 1 0 0 1
refdes=V_pc
T 41600 43100 5 10 1 1 0 0 1
value=DC {power_clamp_reference}
}
C 41200 42600 1 0 0 gnd-1.sym
C 44200 42600 1 0 0 gnd-1.sym
C 41100 43800 1 0 0 generic-power.sym
{
T 41300 44050 5 10 1 1 0 3 1
net=Vpc:1
}
C 44100 43800 1 0 0 generic-power.sym
{
T 44300 44050 5 10 1 1 0 3 1
net=Vgc:1
}
N 37300 32500 37900 32500 4
{
T 37500 32500 5 10 1 1 0 0 1
netname=Ipd
}
B 36800 29300 5500 4000 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
B 36800 33900 21900 6100 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
C 40000 38600 1 90 0 vexp-1.sym
{
T 39700 39150 5 10 1 1 0 0 1
refdes=A_r_time
T 39150 39300 5 10 0 0 90 0 1
device=vexp
T 38950 39300 5 10 0 0 90 0 1
footprint=none
T 39700 38650 5 10 1 1 0 0 1
value=time
}
N 40000 38900 41100 38900 4
{
T 40400 38900 5 10 1 1 0 0 1
netname=r_time
}
C 37900 37500 1 0 0 gnd-1.sym
C 40100 35800 1 90 0 vexp-1.sym
{
T 39800 36350 5 10 1 1 0 0 1
refdes=A_f_time
T 39250 36500 5 10 0 0 90 0 1
device=vexp
T 39050 36500 5 10 0 0 90 0 1
footprint=none
T 39800 35750 5 10 1 1 0 0 1
value=time
}
N 41100 36100 40100 36100 4
{
T 40400 36100 5 10 1 1 0 0 1
netname=f_time
}
C 38000 34700 1 0 0 gnd-1.sym
C 41100 38200 1 0 0 vcvs-1.sym
{
T 41300 39250 5 10 0 0 0 0 1
device=SPICE-vcvs
T 41600 37950 5 10 1 1 0 0 1
refdes=X_r0
T 41300 39450 5 10 0 0 0 0 1
symversion=0.1
T 42500 39250 5 10 1 1 0 5 1
value=rising_waveform0 spec={spec}
}
C 41100 35400 1 0 0 vcvs-1.sym
{
T 41300 36450 5 10 0 0 0 0 1
device=SPICE-vcvs
T 41600 35150 5 10 1 1 0 0 1
refdes=X_f0
T 41300 36650 5 10 0 0 0 0 1
symversion=0.1
T 42500 36450 5 10 1 1 0 5 1
value=falling_waveform0 spec={spec}
}
C 41000 38000 1 0 0 gnd-1.sym
C 41000 35200 1 0 0 gnd-1.sym
C 42500 35200 1 0 0 gnd-1.sym
C 42500 38000 1 0 0 gnd-1.sym
N 42600 38900 43200 38900 4
{
T 42800 38900 5 10 1 1 0 0 1
netname=vr0
}
N 42600 36100 43200 36100 4
{
T 42800 36100 5 10 1 1 0 0 1
netname=vf0
}
T 36800 40100 9 10 1 0 0 0 1
Models for fixture
L 44900 39800 44900 34000 3 0 0 2 150 150
T 36800 33400 9 10 1 0 0 0 1
IBIS Gate Model
T 36800 44000 8 10 1 0 0 0 1
dist-license=GPLv3
T 36806 44200 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 41100 41800 1 270 0 voltage-3.sym
{
T 41800 41600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 41600 41300 5 10 1 1 0 0 1
refdes=V_pd
T 41600 41100 5 10 1 1 0 0 1
value=DC {pullup_reference}
}
C 41200 40600 1 0 0 gnd-1.sym
C 41100 41800 1 0 0 generic-power.sym
{
T 41300 42050 5 10 1 1 0 3 1
net=Vpu:1
}
N 38000 38900 38800 38900 4
{
T 38000 38900 5 10 1 1 0 0 1
netname=r_on
}
N 38100 36100 38900 36100 4
{
T 38100 36100 5 10 1 1 0 0 1
netname=f_on
}
T 44900 40100 9 10 1 0 0 0 1
Fixture 0
C 42900 40500 1 0 0 gnd-1.sym
N 42800 40800 43000 40800 4
{
T 42800 40800 5 10 1 1 0 0 1
netname=0
}
C 38400 30600 1 270 0 voltage-3.sym
{
T 39100 30400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 38000 30400 5 10 1 1 0 0 1
refdes=B_Kpu
T 37300 30900 5 10 1 1 0 0 1
value=V=(I(Vfx0) - V(Icomp0))/V(I3)
}
C 38500 29400 1 0 0 gnd-1.sym
N 38600 30600 39000 30600 4
{
T 38600 30600 5 10 1 1 0 0 1
netname=Kpu
}
C 42600 41800 1 90 0 resistor-1.sym
{
T 42200 42100 5 10 0 0 90 0 1
device=RESISTOR
T 42600 42400 5 10 1 1 0 0 1
refdes=R_en_gnd_ref
T 42600 42000 5 10 1 1 0 0 1
value=1e18
}
C 42400 41500 1 0 0 gnd-1.sym
N 42500 42700 42800 42700 4
{
T 42500 42700 5 10 1 1 0 0 1
netname=en
}
C 37800 31600 1 0 0 gnd-1.sym
C 37900 35900 1 270 0 voltage-3.sym
{
T 38600 35700 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 38200 35700 5 10 1 1 0 0 1
refdes=B_f_on
T 38300 34600 5 10 1 1 0 0 1
value=V=V(en) > 0 ? {falling_waveform_max} : 0
}
N 38100 35900 38100 36100 4
C 37800 38700 1 270 0 voltage-3.sym
{
T 38500 38500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 38100 38500 5 10 1 1 0 0 1
refdes=B_r_on
T 38200 37400 5 10 1 1 0 0 1
value=V=V(en) > 0 ? 0 : {rising_waveform_max}
}
N 38000 38700 38000 38900 4
C 44100 41700 1 270 0 voltage-3.sym
{
T 44800 41500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 44600 41200 5 10 1 1 0 0 1
refdes=V_pd
T 44600 41000 5 10 1 1 0 0 1
value=DC {pulldown_reference}
}
C 44200 40500 1 0 0 gnd-1.sym
C 44100 41700 1 0 0 generic-power.sym
{
T 44300 41950 5 10 1 1 0 3 1
net=Vpd:1
}
C 40100 32600 1 0 0 vcc-1.sym
C 40500 31500 1 90 0 current-1.sym
{
T 39500 32100 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 40400 32200 5 10 1 1 0 0 1
refdes=B_pd
T 40400 31600 5 10 1 1 0 0 1
value=I=V(Ipd)*V(Kpd)
}
N 40300 32400 40300 32600 4
N 40300 31500 40300 31300 4
N 39400 32500 40300 32500 4
N 47900 37000 54400 37000 4
{
T 48800 37100 5 10 1 1 0 0 1
netname=fixture0
}
C 48700 37700 1 0 0 vcvs-1.sym
{
T 48900 38750 5 10 0 0 0 0 1
device=SPICE-vcvs
T 49000 38550 5 10 1 1 0 0 1
refdes=X_pullup0
T 48900 38950 5 10 0 0 0 0 1
symversion=0.1
T 49500 37350 5 10 1 1 180 5 1
value=pullup0 spec={spec}
}
C 55500 36900 1 0 0 resistor-1.sym
{
T 55800 37300 5 10 0 0 0 0 1
device=RESISTOR
T 55500 37200 5 10 1 1 0 0 1
refdes=R_fixture0
T 55400 36700 5 10 1 1 0 0 1
value={R_fixture0}
}
C 56400 36800 1 270 0 voltage-3.sym
{
T 57100 36600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 56700 36600 5 10 1 1 0 0 1
refdes=V_fixture0
T 56700 36000 5 10 1 1 0 0 1
value=DC {V_fixture0}
}
N 56400 37000 56600 37000 4
N 56600 37000 56600 36800 4
C 56500 35600 1 0 0 gnd-1.sym
N 48200 37800 48700 37800 4
C 50100 37500 1 0 0 gnd-1.sym
C 47800 35600 1 0 0 gnd-1.sym
N 50200 38400 50400 38400 4
{
T 50200 38400 5 10 1 1 0 0 1
netname=I3
}
N 48600 37000 48600 37800 4
C 48500 38400 1 0 0 generic-power.sym
{
T 48700 38650 5 10 1 1 0 3 1
net=Vpu:1
}
N 50800 36200 50800 37000 4
C 52400 35300 1 0 1 gnd-1.sym
C 50800 37700 1 0 0 vcvs-1.sym
{
T 51000 38750 5 10 0 0 0 0 1
device=SPICE-vcvs
T 51400 38550 5 10 1 1 0 0 1
refdes=X_pc0
T 51000 38950 5 10 0 0 0 0 1
symversion=0.1
T 52000 37350 5 10 1 1 180 5 1
value=power_clamp0 spec={spec}
}
C 50800 35500 1 0 0 vcvs-1.sym
{
T 51000 36550 5 10 0 0 0 0 1
device=SPICE-vcvs
T 51400 36350 5 10 1 1 0 0 1
refdes=X_gc0
T 51000 36750 5 10 0 0 0 0 1
symversion=0.1
T 51700 34950 5 10 1 1 180 5 1
value=gnd_clamp0 spec={spec}
}
C 52400 37500 1 0 1 gnd-1.sym
N 52900 38400 52300 38400 4
{
T 52300 38400 5 10 1 1 0 0 1
netname=Ipc0
}
N 52900 36200 52300 36200 4
{
T 52300 36200 5 10 1 1 0 0 1
netname=Igc0
}
C 50600 38400 1 0 0 generic-power.sym
{
T 50800 38650 5 10 1 1 0 3 1
net=Vpc:1
}
C 51000 35600 1 180 0 generic-power.sym
{
T 50800 35350 5 10 1 1 180 3 1
net=Vgc:1
}
N 50800 37000 50800 37800 4
C 47700 36800 1 270 0 voltage-3.sym
{
T 48400 36600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 47600 36600 5 10 1 1 0 0 1
refdes=B0
T 45700 37100 5 10 1 1 0 0 1
value=V=V(r_on) > 0  ? V(vr0) : V(vf0)
}
C 55300 37200 1 180 0 current-1.sym
{
T 54700 36200 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 54300 37200 5 10 1 1 0 0 1
refdes=Vfx0
T 54300 36700 5 10 1 1 0 0 1
value=DC 0
}
N 47900 36800 47900 37000 4
C 54000 37200 1 90 0 current-1.sym
{
T 53000 37800 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 53200 37100 5 10 1 1 0 0 1
refdes=B_pc0
T 53000 37900 5 10 1 1 0 0 1
value=I=V(Ipc0)
}
C 53600 36800 1 270 0 current-1.sym
{
T 54600 36200 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 53200 36600 5 10 1 1 0 0 1
refdes=B_gc0
T 53000 35900 5 10 1 1 0 0 1
value=I=V(Igc0)
}
N 53800 37000 53800 37200 4
N 53800 37000 53800 36800 4
N 53800 38100 53800 38200 4
N 53800 35900 53800 35800 4
C 53600 38200 1 0 0 generic-power.sym
{
T 53800 38450 5 10 1 1 0 3 1
net=Vpc:1
}
C 54000 35800 1 180 0 generic-power.sym
{
T 53800 35550 5 10 1 1 180 3 1
net=Vgc:1
}
C 47000 37500 1 270 1 vexp-1.sym
{
T 47000 38150 5 10 1 1 0 0 1
refdes=A_comp0
T 47850 38200 5 10 0 0 90 2 1
device=vexp
T 48050 38200 5 10 0 0 90 2 1
footprint=none
T 46700 37550 5 10 1 1 0 0 1
value=comp0
}
N 47000 37800 46300 37800 4
{
T 46100 37900 5 10 1 1 0 0 1
netname=Icomp0
}
N 55300 37000 55500 37000 4
C 36800 43000 1 0 0 spice-directive-1.sym
{
T 36900 43300 5 10 0 1 0 0 1
device=directive
T 36900 43400 5 10 1 1 0 0 1
refdes=Atime
T 36800 43100 5 10 1 1 0 0 1
value=.MODEL time slew(rise_slope=1 fall_slope=10)
}
C 36800 42300 1 0 0 spice-directive-1.sym
{
T 36900 42600 5 10 0 1 0 0 1
device=directive
T 36900 42700 5 10 1 1 0 0 1
refdes=Apc
T 36800 42000 5 10 1 1 0 0 3
value=.PARAM c_comp_tot={C_comp +
+     C_comp_pullup + C_comp_pulldown +
+     C_comp_power_clamp + C_comp_gnd_clamp}
}
C 36800 41200 1 0 0 spice-directive-1.sym
{
T 36900 41500 5 10 0 1 0 0 1
device=directive
T 36900 41600 5 10 1 1 0 0 1
refdes=Amc0
T 36800 41000 5 10 1 1 0 0 2
value=.MODEL comp0 d_dt(gain={C_comp_tot+C_fixture0}
+    out_lower_limit=-1e12 out_upper_limit=1e12)
}

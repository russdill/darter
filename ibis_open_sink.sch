v 20110115 2
C 36800 43200 1 0 0 spice-directive-1.sym
{
T 36900 43500 5 10 0 1 0 0 1
device=directive
T 36900 43600 5 10 1 1 0 0 1
refdes=A1
T 36800 43300 5 10 1 1 0 0 1
value=.MODEL time slew(rise_slope=1 fall_slope=10)
}
N 39600 31300 41500 31300 4
{
T 41100 31400 5 10 1 1 0 0 1
netname=pad
}
C 40100 31100 1 270 0 current-1.sym
{
T 41100 30500 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 40400 30900 5 10 1 1 0 0 1
refdes=B_pd
T 40400 30300 5 10 1 1 0 0 1
value=I=V(Ipd)*V(Kpd)
}
C 40500 30000 1 180 0 vss-1.sym
N 40300 31300 40300 31100 4
N 40300 30000 40300 30200 4
N 39400 30100 40300 30100 4
N 39600 30700 39600 31300 4
C 39400 30000 1 0 1 vcvs-1.sym
{
T 39200 31050 5 10 0 0 0 6 1
device=SPICE-vcvs
T 38800 30850 5 10 1 1 0 6 1
refdes=X_pd
T 39200 31250 5 10 0 0 0 6 1
symversion=0.1
T 38800 29750 5 10 1 1 0 5 1
value=pulldown0 spec={spec}
}
N 39400 30700 39600 30700 4
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
N 37300 30700 37900 30700 4
{
T 37500 30700 5 10 1 1 0 0 1
netname=Ipd
}
B 36800 29300 5500 4000 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
B 36800 33800 18000 6200 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
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
N 49100 36600 50900 36600 4
{
T 48900 36700 5 10 1 1 0 0 1
netname=fixture0
}
C 51900 34900 1 0 1 gnd-1.sym
C 50300 35100 1 0 0 vcvs-1.sym
{
T 50500 36150 5 10 0 0 0 0 1
device=SPICE-vcvs
T 50300 35950 5 10 1 1 0 0 1
refdes=X_pulldown0
T 50500 36350 5 10 0 0 0 0 1
symversion=0.1
T 51500 34850 5 10 1 1 0 5 1
value=pulldown0 spec={spec}
}
N 52900 36600 53100 36600 4
N 53100 36600 53100 36400 4
C 53000 35200 1 0 0 gnd-1.sym
N 50200 35800 50200 36600 4
N 50300 35800 50200 35800 4
C 49400 35200 1 0 0 gnd-1.sym
C 51800 36800 1 180 0 current-1.sym
{
T 51200 35800 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 50700 36800 5 10 1 1 0 0 1
refdes=Vfx0
T 50700 36400 5 10 1 1 0 0 1
value=DC 0
}
N 52000 35800 51800 35800 4
{
T 51800 35800 5 10 1 1 0 0 1
netname=I2
}
C 49100 36400 1 0 1 current-1.sym
{
T 48500 37400 5 10 0 0 0 6 1
device=CURRENT_SOURCE
T 48100 37000 5 10 1 1 0 0 1
refdes=V_comp0
T 48100 36800 5 10 1 1 0 0 1
value=DC 0
}
C 47700 35200 1 90 0 capacitor-1.sym
{
T 47000 35400 5 10 0 0 90 0 1
device=CAPACITOR
T 47600 35800 5 10 1 1 0 0 1
refdes=C_comp_gc0
T 46800 35400 5 10 0 0 90 0 1
symversion=0.1
T 47600 35400 5 10 1 1 0 0 1
value={C_comp_gnd_clamp}
}
C 47700 37200 1 90 0 capacitor-1.sym
{
T 47000 37400 5 10 0 0 90 0 1
device=CAPACITOR
T 47600 37800 5 10 1 1 0 0 1
refdes=C_comp_pc0
T 46800 37400 5 10 0 0 90 0 1
symversion=0.1
T 47600 37400 5 10 1 1 0 0 1
value={C_comp_power_clamp}
}
C 45900 37200 1 90 0 capacitor-1.sym
{
T 45200 37400 5 10 0 0 90 0 1
device=CAPACITOR
T 45800 37800 5 10 1 1 0 0 1
refdes=C_comp_pu0
T 45000 37400 5 10 0 0 90 0 1
symversion=0.1
T 45800 37400 5 10 1 1 0 0 1
value={C_comp_pullup}
}
C 45900 35200 1 90 0 capacitor-1.sym
{
T 45200 35400 5 10 0 0 90 0 1
device=CAPACITOR
T 45800 35800 5 10 1 1 0 0 1
refdes=C_comp_pd0
T 45000 35400 5 10 0 0 90 0 1
symversion=0.1
T 45800 35400 5 10 1 1 0 0 1
value={C_comp_pulldown}
}
C 45500 38100 1 0 0 generic-power.sym
{
T 45700 38350 5 10 1 1 0 3 1
net=Vpu:1
}
C 47700 35200 1 180 0 generic-power.sym
{
T 47500 34950 5 10 1 1 180 3 1
net=Vgc:1
}
C 47300 38100 1 0 0 generic-power.sym
{
T 47500 38350 5 10 1 1 0 3 1
net=Vpc:1
}
C 45900 35200 1 180 0 generic-power.sym
{
T 45700 34950 5 10 1 1 180 3 1
net=Vpd:1
}
N 47500 37200 47500 36100 4
N 45700 37200 45700 36100 4
N 48200 36600 47500 36600 4
N 47500 36600 45700 36600 4
C 50500 35200 1 180 0 generic-power.sym
{
T 50300 34950 5 10 1 1 180 3 1
net=Vpd:1
}
N 52000 36600 51800 36600 4
T 44900 40100 9 10 1 0 0 0 1
Fixture 0
C 52000 36500 1 0 0 resistor-1.sym
{
T 52300 36900 5 10 0 0 0 0 1
device=RESISTOR
T 52000 36800 5 10 1 1 0 0 1
refdes=R_fixture0
T 51900 36300 5 10 1 1 0 0 1
value={R_fixture0}
}
C 52900 36400 1 270 0 voltage-3.sym
{
T 53600 36200 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 53200 36200 5 10 1 1 0 0 1
refdes=V_fixture0
T 53200 35600 5 10 1 1 0 0 1
value=DC {V_fixture0}
}
C 46800 34300 1 90 0 capacitor-1.sym
{
T 46100 34500 5 10 0 0 90 0 1
device=CAPACITOR
T 45500 34500 5 10 1 1 0 0 1
refdes=C_comp_pd0
T 45900 34500 5 10 0 0 90 0 1
symversion=0.1
T 46700 34500 5 10 1 1 0 0 1
value={C_comp}
}
C 46500 34000 1 0 0 gnd-1.sym
N 46600 35200 46600 36600 4
C 42900 40500 1 0 0 gnd-1.sym
N 42800 40800 43000 40800 4
{
T 42800 40800 5 10 1 1 0 0 1
netname=0
}
C 38300 32500 1 270 0 voltage-3.sym
{
T 39000 32300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 37900 32300 5 10 1 1 0 0 1
refdes=B_Kpd
T 37200 32800 5 10 1 1 0 0 1
value=V=(I(Vfx0) - I(V_comp0))/V(I2)
}
C 38400 31300 1 0 0 gnd-1.sym
N 38500 32500 38900 32500 4
{
T 38500 32500 5 10 1 1 0 0 1
netname=Kpd
}
C 39200 41100 1 90 0 resistor-1.sym
{
T 38800 41400 5 10 0 0 90 0 1
device=RESISTOR
T 39200 41700 5 10 1 1 0 0 1
refdes=R_en_gnd_ref
T 39200 41300 5 10 1 1 0 0 1
value=1e18
}
C 39000 40800 1 0 0 gnd-1.sym
N 39100 42000 39400 42000 4
{
T 39100 42000 5 10 1 1 0 0 1
netname=en
}
C 37800 29800 1 0 0 gnd-1.sym
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
C 49300 36400 1 270 0 voltage-3.sym
{
T 50000 36200 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 48600 36200 5 10 1 1 0 0 1
refdes=B_fixture0
T 47700 34600 5 10 1 1 0 0 1
value=V=V(r_on) > 0  ? V(vr0) : V(vf0)
}
N 49500 36400 49500 36600 4

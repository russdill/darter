v 20110115 2
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
B 36800 33800 22900 6200 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
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
C 38300 32500 1 270 0 voltage-3.sym
{
T 39000 32300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 37900 32300 5 10 1 1 0 0 1
refdes=B_Kpd
T 37200 32800 5 10 1 1 0 0 1
value=V=(I(Vfx0) - V(Icomp0))/V(I2)
}
C 38400 31300 1 0 0 gnd-1.sym
N 38500 32500 38900 32500 4
{
T 38500 32500 5 10 1 1 0 0 1
netname=Kpd
}
C 42700 41800 1 90 0 resistor-1.sym
{
T 42300 42100 5 10 0 0 90 0 1
device=RESISTOR
T 42700 42400 5 10 1 1 0 0 1
refdes=R_en_gnd_ref
T 42700 42000 5 10 1 1 0 0 1
value=1e18
}
C 42500 41500 1 0 0 gnd-1.sym
N 42600 42700 42900 42700 4
{
T 42600 42700 5 10 1 1 0 0 1
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
N 48100 37100 54600 37100 4
{
T 49000 37200 5 10 1 1 0 0 1
netname=fixture0
}
C 50500 35400 1 0 1 gnd-1.sym
C 48900 35600 1 0 0 vcvs-1.sym
{
T 49100 36650 5 10 0 0 0 0 1
device=SPICE-vcvs
T 48900 36450 5 10 1 1 0 0 1
refdes=X_pulldown0
T 49100 36850 5 10 0 0 0 0 1
symversion=0.1
T 49900 35050 5 10 1 1 180 5 1
value=pulldown0 spec={spec}
}
C 55700 37000 1 0 0 resistor-1.sym
{
T 56000 37400 5 10 0 0 0 0 1
device=RESISTOR
T 55700 37300 5 10 1 1 0 0 1
refdes=R_fixture0
T 55600 36800 5 10 1 1 0 0 1
value={R_fixture0}
}
C 56600 36900 1 270 0 voltage-3.sym
{
T 57300 36700 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 56900 36700 5 10 1 1 0 0 1
refdes=V_fixture0
T 56900 36100 5 10 1 1 0 0 1
value=DC {V_fixture0}
}
N 56600 37100 56800 37100 4
N 56800 37100 56800 36900 4
C 56700 35700 1 0 0 gnd-1.sym
N 48800 36300 48800 37100 4
N 48400 37900 48800 37900 4
N 48900 36300 48800 36300 4
C 48000 35700 1 0 0 gnd-1.sym
N 50600 36300 50400 36300 4
{
T 50400 36300 5 10 1 1 0 0 1
netname=I2
}
N 48800 37100 48800 37900 4
C 49100 35700 1 180 0 generic-power.sym
{
T 48900 35450 5 10 1 1 180 3 1
net=Vpd:1
}
N 51000 36300 51000 37100 4
C 52600 35400 1 0 1 gnd-1.sym
C 51000 37800 1 0 0 vcvs-1.sym
{
T 51200 38850 5 10 0 0 0 0 1
device=SPICE-vcvs
T 51600 38650 5 10 1 1 0 0 1
refdes=X_pc0
T 51200 39050 5 10 0 0 0 0 1
symversion=0.1
T 52200 37450 5 10 1 1 180 5 1
value=power_clamp0 spec={spec}
}
C 51000 35600 1 0 0 vcvs-1.sym
{
T 51200 36650 5 10 0 0 0 0 1
device=SPICE-vcvs
T 51600 36450 5 10 1 1 0 0 1
refdes=X_gc0
T 51200 36850 5 10 0 0 0 0 1
symversion=0.1
T 51900 35050 5 10 1 1 180 5 1
value=gnd_clamp0 spec={spec}
}
C 52600 37600 1 0 1 gnd-1.sym
N 53100 38500 52500 38500 4
{
T 52500 38500 5 10 1 1 0 0 1
netname=Ipc0
}
N 53100 36300 52500 36300 4
{
T 52500 36300 5 10 1 1 0 0 1
netname=Igc0
}
C 50800 38500 1 0 0 generic-power.sym
{
T 51000 38750 5 10 1 1 0 3 1
net=Vpc:1
}
C 51200 35700 1 180 0 generic-power.sym
{
T 51000 35450 5 10 1 1 180 3 1
net=Vgc:1
}
N 51000 37100 51000 37900 4
C 47900 36900 1 270 0 voltage-3.sym
{
T 48600 36700 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 47800 36700 5 10 1 1 0 0 1
refdes=B0
T 45900 37200 5 10 1 1 0 0 1
value=V=V(r_on) > 0  ? V(vr0) : V(vf0)
}
C 55500 37300 1 180 0 current-1.sym
{
T 54900 36300 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 54500 37300 5 10 1 1 0 0 1
refdes=Vfx0
T 54500 36800 5 10 1 1 0 0 1
value=DC 0
}
N 48100 36900 48100 37100 4
C 54200 37300 1 90 0 current-1.sym
{
T 53200 37900 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 53400 37200 5 10 1 1 0 0 1
refdes=B_pc0
T 53200 38000 5 10 1 1 0 0 1
value=I=V(Ipc0)
}
C 53800 36900 1 270 0 current-1.sym
{
T 54800 36300 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 53400 36700 5 10 1 1 0 0 1
refdes=B_gc0
T 53200 36000 5 10 1 1 0 0 1
value=I=V(Igc0)
}
N 54000 37100 54000 37300 4
N 54000 37100 54000 36900 4
N 54000 38200 54000 38300 4
N 54000 36000 54000 35900 4
C 53800 38300 1 0 0 generic-power.sym
{
T 54000 38550 5 10 1 1 0 3 1
net=Vpc:1
}
C 54200 35900 1 180 0 generic-power.sym
{
T 54000 35650 5 10 1 1 180 3 1
net=Vgc:1
}
C 47200 37600 1 270 1 vexp-1.sym
{
T 47200 38250 5 10 1 1 0 0 1
refdes=A_comp0
T 48050 38300 5 10 0 0 90 2 1
device=vexp
T 48250 38300 5 10 0 0 90 2 1
footprint=none
T 46900 37650 5 10 1 1 0 0 1
value=comp0
}
N 47200 37900 46500 37900 4
{
T 46300 38000 5 10 1 1 0 0 1
netname=Icomp0
}
N 55500 37100 55700 37100 4
C 36800 42900 1 0 0 spice-directive-1.sym
{
T 36900 43200 5 10 0 1 0 0 1
device=directive
T 36900 43300 5 10 1 1 0 0 1
refdes=Atime
T 36800 43000 5 10 1 1 0 0 1
value=.MODEL time slew(rise_slope=1 fall_slope=10)
}
C 36800 42200 1 0 0 spice-directive-1.sym
{
T 36900 42500 5 10 0 1 0 0 1
device=directive
T 36900 42600 5 10 1 1 0 0 1
refdes=Apc
T 36800 41900 5 10 1 1 0 0 3
value=.PARAM c_comp_tot={C_comp +
+     C_comp_pullup + C_comp_pulldown +
+     C_comp_power_clamp + C_comp_gnd_clamp}
}
C 36800 41100 1 0 0 spice-directive-1.sym
{
T 36900 41400 5 10 0 1 0 0 1
device=directive
T 36900 41500 5 10 1 1 0 0 1
refdes=Amc0
T 36800 40900 5 10 1 1 0 0 2
value=.MODEL comp0 d_dt(gain={C_comp_tot+C_fixture0}
+    out_lower_limit=-1e12 out_upper_limit=1e12)
}

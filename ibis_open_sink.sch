v 20110115 2
N 48400 42300 49600 42300 4
{
T 49200 42400 5 10 1 1 0 0 1
netname=pad
}
C 48200 42100 1 270 0 current-1.sym
{
T 49200 41500 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 48500 41900 5 10 1 1 0 0 1
refdes=B_pd
T 48500 41300 5 10 1 1 0 0 1
value=I=V(Ipd)*V(Kpd)
}
C 48600 41000 1 180 0 vss-1.sym
N 48400 42300 48400 42100 4
N 48400 41000 48400 41200 4
B 44900 40300 5500 4000 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
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
T 36800 40100 9 10 1 0 0 0 1
Models for fixture
L 44900 39800 44900 34000 3 0 0 2 150 150
T 44900 44400 9 10 1 0 0 0 1
IBIS Gate Model
T 36800 44000 8 10 1 0 0 0 1
dist-license=GPLv3
T 36806 44200 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
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
T 45000 39700 9 10 1 0 0 0 1
Fixture 0
C 42500 40800 1 0 0 gnd-1.sym
N 42400 41100 42600 41100 4
{
T 42400 41100 5 10 1 1 0 0 1
netname=0
}
C 45300 44000 1 270 0 voltage-3.sym
{
T 46000 43800 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 45800 43700 5 10 1 1 0 0 1
refdes=B_Kpd
T 45700 43200 5 10 1 1 0 0 1
value=V=(I(Vfx0) - V(Icomp0) + V(Ipc0) + V(Igc0))/V(I2)
}
C 45400 42800 1 0 0 gnd-1.sym
N 45500 44000 45900 44000 4
{
T 45500 44000 5 10 1 1 0 0 1
netname=Kpd
}
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
N 46300 37900 47000 37900 4
{
T 46300 37900 5 10 1 1 0 0 1
netname=fixture0
}
C 48100 37800 1 0 0 resistor-1.sym
{
T 48400 38200 5 10 0 0 0 0 1
device=RESISTOR
T 48100 38100 5 10 1 1 0 0 1
refdes=R_fixture0
T 48000 37600 5 10 1 1 0 0 1
value={R_fixture0}
}
C 49000 37700 1 270 0 voltage-3.sym
{
T 49700 37500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 49300 37500 5 10 1 1 0 0 1
refdes=V_fixture0
T 49300 36900 5 10 1 1 0 0 1
value=DC {V_fixture0}
}
N 49000 37900 49200 37900 4
{
T 49000 37900 5 10 1 1 0 0 1
netname=f0b
}
N 49200 37900 49200 37700 4
C 49100 36500 1 0 0 gnd-1.sym
C 46200 36500 1 0 0 gnd-1.sym
N 42300 38900 42900 38900 4
{
T 42500 38900 5 10 1 1 0 0 1
netname=vr0
}
N 42300 36100 42900 36100 4
{
T 42500 36100 5 10 1 1 0 0 1
netname=vf0
}
N 53400 35800 53200 35800 4
{
T 53200 35800 5 10 1 1 0 0 1
netname=I2
}
N 57200 35800 56600 35800 4
{
T 56600 35800 5 10 1 1 0 0 1
netname=Igc0
}
C 46100 37700 1 270 0 voltage-3.sym
{
T 46800 37500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 46400 37500 5 10 1 1 0 0 1
refdes=B0
T 46500 36900 5 10 1 1 0 0 1
value=V=V(r_on) > 0  ? V(vr0) : V(vf0)
}
C 47900 38100 1 180 0 current-1.sym
{
T 47300 37100 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 46900 38100 5 10 1 1 0 0 1
refdes=Vfx0
T 46900 37600 5 10 1 1 0 0 1
value=DC 0
}
N 46300 37700 46300 37900 4
C 48500 34900 1 90 0 vexp-1.sym
{
T 48100 35550 5 10 1 1 0 0 1
refdes=A_comp0
T 47650 35600 5 10 0 0 90 0 1
device=vexp
T 47450 35600 5 10 0 0 90 0 1
footprint=none
T 48200 34950 5 10 1 1 0 0 1
value=comp0
}
N 48500 35200 49200 35200 4
{
T 48500 35200 5 10 1 1 0 0 1
netname=Icomp0
}
N 47900 37900 48100 37900 4
{
T 47900 37900 5 10 1 1 0 0 1
netname=f0a
}
C 42300 38600 1 90 0 vexp-1.sym
{
T 42000 39150 5 10 1 1 0 0 1
refdes=A_r0
T 41450 39300 5 10 0 0 90 0 1
device=vexp
T 41250 39300 5 10 0 0 90 0 1
footprint=none
T 41100 38450 5 10 1 1 0 0 1
value=rising_waveform0
}
C 42300 35800 1 90 0 vexp-1.sym
{
T 42000 36350 5 10 1 1 0 0 1
refdes=A_f0
T 41450 36500 5 10 0 0 90 0 1
device=vexp
T 41250 36500 5 10 0 0 90 0 1
footprint=none
T 41100 35650 5 10 1 1 0 0 1
value=falling_waveform0
}
C 54600 38700 1 270 0 voltage-3.sym
{
T 55300 38500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 55100 38200 5 10 1 1 0 0 1
refdes=B_vpc0
T 55100 38000 5 10 1 1 0 0 1
value=V={power_clamp_reference} - V(fixture0)
}
C 54700 37500 1 0 0 gnd-1.sym
N 54800 38700 55400 38700 4
{
T 54800 38700 5 10 1 1 0 0 1
netname=vpc0
}
C 56600 38400 1 90 0 vexp-1.sym
{
T 56300 38950 5 10 1 1 0 0 1
refdes=A_power_clamp0
T 55750 39100 5 10 0 0 90 0 1
device=vexp
T 55550 39100 5 10 0 0 90 0 1
footprint=none
T 56300 38450 5 10 1 1 0 0 1
value=power_clamp0
}
N 57200 38700 56600 38700 4
{
T 56600 38700 5 10 1 1 0 0 1
netname=Ipc0
}
C 51200 35800 1 270 0 voltage-3.sym
{
T 51900 35600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 51700 35300 5 10 1 1 0 0 1
refdes=B_vpd0
T 51700 35100 5 10 1 1 0 0 1
value=V=V(fixture0) - {pulldown_reference}
}
C 51300 34600 1 0 0 gnd-1.sym
N 51400 35800 52000 35800 4
{
T 51400 35800 5 10 1 1 0 0 1
netname=vpd0
}
C 53200 35500 1 90 0 vexp-1.sym
{
T 52900 36050 5 10 1 1 0 0 1
refdes=A_pulldown0
T 52350 36200 5 10 0 0 90 0 1
device=vexp
T 52150 36200 5 10 0 0 90 0 1
footprint=none
T 52900 35550 5 10 1 1 0 0 1
value=pulldown0
}
C 54600 35800 1 270 0 voltage-3.sym
{
T 55300 35600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 55100 35300 5 10 1 1 0 0 1
refdes=B_vgc0
T 55100 35100 5 10 1 1 0 0 1
value=V=V(fixture0) - {gnd_clamp_reference}
}
C 54700 34600 1 0 0 gnd-1.sym
N 54800 35800 55400 35800 4
{
T 54800 35800 5 10 1 1 0 0 1
netname=vgc0
}
C 56600 35500 1 90 0 vexp-1.sym
{
T 56300 36050 5 10 1 1 0 0 1
refdes=A_gnd_clamp0
T 55750 36200 5 10 0 0 90 0 1
device=vexp
T 55550 36200 5 10 0 0 90 0 1
footprint=none
T 56300 35550 5 10 1 1 0 0 1
value=gnd_clamp0
}
N 46600 35200 47300 35200 4
{
T 46600 35200 5 10 1 1 0 0 1
netname=fixture0
}
C 45300 42300 1 270 0 voltage-3.sym
{
T 46000 42100 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 45800 41800 5 10 1 1 0 0 1
refdes=B_vpd
T 45800 41600 5 10 1 1 0 0 1
value=V=V(pad) - V(Vss)
}
C 45400 41100 1 0 0 gnd-1.sym
N 45500 42300 46100 42300 4
{
T 45500 42300 5 10 1 1 0 0 1
netname=vpd
}
C 47300 42000 1 90 0 vexp-1.sym
{
T 47000 42550 5 10 1 1 0 0 1
refdes=A_pulldown
T 46450 42700 5 10 0 0 90 0 1
device=vexp
T 46250 42700 5 10 0 0 90 0 1
footprint=none
T 47000 42050 5 10 1 1 0 0 1
value=pulldown0
}
N 47300 42300 47900 42300 4
{
T 47500 42300 5 10 1 1 0 0 1
netname=Ipd
}

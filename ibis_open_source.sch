v 20110115 2
N 48400 42200 49600 42200 4
{
T 49200 42300 5 10 1 1 0 0 1
netname=pad
}
B 44900 40200 5500 4000 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
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
T 36800 40100 9 10 1 0 0 0 1
Models for fixture
L 44900 39800 44900 34000 3 0 0 2 150 150
T 44900 44300 9 10 1 0 0 0 1
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
C 42400 40700 1 0 0 gnd-1.sym
N 42300 41000 42500 41000 4
{
T 42300 41000 5 10 1 1 0 0 1
netname=0
}
C 45500 41800 1 270 0 voltage-3.sym
{
T 46200 41600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 45800 41500 5 10 1 1 0 0 1
refdes=B_Kpu
T 45800 41000 5 10 1 1 0 0 1
value=V=(I(Vfx0) - V(Icomp0) + V(Ipc0) + V(Igc0))/V(I3)
}
C 45600 40600 1 0 0 gnd-1.sym
N 45700 41800 46100 41800 4
{
T 45700 41800 5 10 1 1 0 0 1
netname=Kpu
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
C 48200 43500 1 0 0 vcc-1.sym
C 48600 42400 1 90 0 current-1.sym
{
T 47600 43000 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 48500 43100 5 10 1 1 0 0 1
refdes=B_pd
T 48500 42500 5 10 1 1 0 0 1
value=I=V(Ipd)*V(Kpd)
}
N 48400 43300 48400 43500 4
N 48400 42400 48400 42200 4
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
N 45900 38000 46600 38000 4
{
T 45900 38000 5 10 1 1 0 0 1
netname=fixture0
}
C 47700 37900 1 0 0 resistor-1.sym
{
T 48000 38300 5 10 0 0 0 0 1
device=RESISTOR
T 47700 38200 5 10 1 1 0 0 1
refdes=R_fixture0
T 47600 37700 5 10 1 1 0 0 1
value={R_fixture0}
}
C 48600 37800 1 270 0 voltage-3.sym
{
T 49300 37600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 48900 37600 5 10 1 1 0 0 1
refdes=V_fixture0
T 48900 37000 5 10 1 1 0 0 1
value=DC {V_fixture0}
}
N 48600 38000 48800 38000 4
{
T 48600 38000 5 10 1 1 0 0 1
netname=f0b
}
N 48800 38000 48800 37800 4
C 48700 36600 1 0 0 gnd-1.sym
C 45800 36600 1 0 0 gnd-1.sym
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
N 56800 35900 56200 35900 4
{
T 56200 35900 5 10 1 1 0 0 1
netname=Igc0
}
C 45700 37800 1 270 0 voltage-3.sym
{
T 46400 37600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 46000 37600 5 10 1 1 0 0 1
refdes=B0
T 46100 37000 5 10 1 1 0 0 1
value=V=V(r_on) > 0  ? V(vr0) : V(vf0)
}
C 47500 38200 1 180 0 current-1.sym
{
T 46900 37200 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 46500 38200 5 10 1 1 0 0 1
refdes=Vfx0
T 46500 37700 5 10 1 1 0 0 1
value=DC 0
}
N 45900 37800 45900 38000 4
C 48100 35000 1 90 0 vexp-1.sym
{
T 47700 35650 5 10 1 1 0 0 1
refdes=A_comp0
T 47250 35700 5 10 0 0 90 0 1
device=vexp
T 47050 35700 5 10 0 0 90 0 1
footprint=none
T 47800 35050 5 10 1 1 0 0 1
value=comp0
}
N 48100 35300 48800 35300 4
{
T 48100 35300 5 10 1 1 0 0 1
netname=Icomp0
}
N 47500 38000 47700 38000 4
{
T 47500 38000 5 10 1 1 0 0 1
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
C 50800 38800 1 270 0 voltage-3.sym
{
T 51500 38600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 51300 38300 5 10 1 1 0 0 1
refdes=B_vpu0
T 51300 38100 5 10 1 1 0 0 1
value=V={pullup_reference} - V(fixture0)
}
C 50900 37600 1 0 0 gnd-1.sym
N 51000 38800 51600 38800 4
{
T 51000 38800 5 10 1 1 0 0 1
netname=vpu0
}
C 52800 38500 1 90 0 vexp-1.sym
{
T 52500 39050 5 10 1 1 0 0 1
refdes=A_pullup0
T 51950 39200 5 10 0 0 90 0 1
device=vexp
T 51750 39200 5 10 0 0 90 0 1
footprint=none
T 52500 38550 5 10 1 1 0 0 1
value=pullup0
}
N 52800 38800 53000 38800 4
{
T 52800 38800 5 10 1 1 0 0 1
netname=I3
}
C 54200 38800 1 270 0 voltage-3.sym
{
T 54900 38600 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 54700 38300 5 10 1 1 0 0 1
refdes=B_vpc0
T 54700 38100 5 10 1 1 0 0 1
value=V={power_clamp_reference} - V(fixture0)
}
C 54300 37600 1 0 0 gnd-1.sym
N 54400 38800 55000 38800 4
{
T 54400 38800 5 10 1 1 0 0 1
netname=vpc0
}
C 56200 38500 1 90 0 vexp-1.sym
{
T 55900 39050 5 10 1 1 0 0 1
refdes=A_power_clamp0
T 55350 39200 5 10 0 0 90 0 1
device=vexp
T 55150 39200 5 10 0 0 90 0 1
footprint=none
T 55900 38550 5 10 1 1 0 0 1
value=power_clamp0
}
N 56800 38800 56200 38800 4
{
T 56200 38800 5 10 1 1 0 0 1
netname=Ipc0
}
C 54200 35900 1 270 0 voltage-3.sym
{
T 54900 35700 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 54700 35400 5 10 1 1 0 0 1
refdes=B_vgc0
T 54700 35200 5 10 1 1 0 0 1
value=V=V(fixture0) - {gnd_clamp_reference}
}
C 54300 34700 1 0 0 gnd-1.sym
N 54400 35900 55000 35900 4
{
T 54400 35900 5 10 1 1 0 0 1
netname=vgc0
}
C 56200 35600 1 90 0 vexp-1.sym
{
T 55900 36150 5 10 1 1 0 0 1
refdes=A_gnd_clamp0
T 55350 36300 5 10 0 0 90 0 1
device=vexp
T 55150 36300 5 10 0 0 90 0 1
footprint=none
T 55900 35650 5 10 1 1 0 0 1
value=gnd_clamp0
}
N 46200 35300 46900 35300 4
{
T 46200 35300 5 10 1 1 0 0 1
netname=fixture0
}
C 45500 43400 1 270 0 voltage-3.sym
{
T 46200 43200 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 46000 42900 5 10 1 1 0 0 1
refdes=B_vpu
T 46000 42700 5 10 1 1 0 0 1
value=V=V(Vdd) - V(pad)
}
C 45600 42200 1 0 0 gnd-1.sym
N 45700 43400 46300 43400 4
{
T 45700 43400 5 10 1 1 0 0 1
netname=vpu
}
C 47500 43100 1 90 0 vexp-1.sym
{
T 47200 43650 5 10 1 1 0 0 1
refdes=A_pullup
T 46650 43800 5 10 0 0 90 0 1
device=vexp
T 46450 43800 5 10 0 0 90 0 1
footprint=none
T 47200 43150 5 10 1 1 0 0 1
value=pullup0
}
N 47500 43400 48100 43400 4
{
T 47700 43400 5 10 1 1 0 0 1
netname=Ipu
}

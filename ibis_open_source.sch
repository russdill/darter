v 20110115 2
B 36800 33900 21900 6100 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
T 36800 40100 9 10 1 0 0 0 1
Models for fixture
L 44900 39800 44900 34000 3 0 0 2 150 150
T 36800 44000 8 10 1 0 0 0 1
dist-license=GPLv3
T 36806 44200 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
T 45000 39700 9 10 1 0 0 0 1
Fixture 0
C 42400 40700 1 0 0 gnd-1.sym
N 42300 41000 42500 41000 4
{
T 42300 41000 5 10 1 1 0 0 1
netname=0
}
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
C 38100 37700 1 0 0 gnd-1.sym
C 37900 35200 1 0 0 vdc-1.sym
{
T 37400 36150 5 10 1 1 0 0 1
refdes=B_fu_on
T 38600 36050 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 38600 36250 5 10 0 0 0 0 1
footprint=none
T 37300 34700 5 10 1 1 0 0 1
value=V=V(out) > 0 ? 0 : {falling_waveform_max}
}
N 46200 37700 46900 37700 4
{
T 46200 37700 5 10 1 1 0 0 1
netname=fixture0
}
C 38100 34900 1 0 0 gnd-1.sym
C 37900 38000 1 0 0 vdc-1.sym
{
T 37400 38950 5 10 1 1 0 0 1
refdes=B_ru_on
T 38600 38850 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 38600 39050 5 10 0 0 0 0 1
footprint=none
T 37400 37450 5 10 1 1 0 0 1
value=V=V(out) > 0 ? {rising_waveform_max} : 0
}
N 54000 42500 55200 42500 4
{
T 54800 42600 5 10 1 1 0 0 1
netname=pad
}
C 54200 42700 1 90 0 current-1.sym
{
T 53200 43300 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 54100 43400 5 10 1 1 0 0 1
refdes=B_pu
T 54100 42800 5 10 1 1 0 0 1
value=I=V(Ipu)*V(Kpu)
}
C 53800 43800 1 0 0 vdd-1.sym
N 54000 42700 54000 42500 4
N 54000 43600 54000 43800 4
C 48000 37600 1 0 0 resistor-1.sym
{
T 48300 38000 5 10 0 0 0 0 1
device=RESISTOR
T 48000 37900 5 10 1 1 0 0 1
refdes=R_fixture0
T 47900 37400 5 10 1 1 0 0 1
value={R_fixture0}
}
C 48900 37500 1 270 0 voltage-3.sym
{
T 49600 37300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 49200 37300 5 10 1 1 0 0 1
refdes=V_fixture0
T 49200 36700 5 10 1 1 0 0 1
value=DC {V_fixture0}
}
N 48900 37700 49100 37700 4
{
T 48900 37700 5 10 1 1 0 0 1
netname=f0b
}
N 49100 37700 49100 37500 4
C 49000 36300 1 0 0 gnd-1.sym
C 46100 36300 1 0 0 gnd-1.sym
B 44900 40200 11100 4300 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
C 47100 43600 1 270 0 voltage-3.sym
{
T 47800 43400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 46700 43400 5 10 1 1 0 0 1
refdes=B_Kpu
T 45400 43800 5 10 1 1 0 0 1
value=V=(I(Vfx0) - V(Icomp0) + V(Ipc0) + V(Igc0)) / V(I3)
}
C 47200 42400 1 0 0 gnd-1.sym
N 47300 43600 47700 43600 4
{
T 47300 43600 5 10 1 1 0 0 1
netname=Kpu
}
C 47800 37900 1 180 0 current-1.sym
{
T 47200 36900 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 46800 37900 5 10 1 1 0 0 1
refdes=Vfx0
T 46800 37400 5 10 1 1 0 0 1
value=DC 0
}
N 46200 37500 46200 37700 4
N 47800 37700 48000 37700 4
{
T 47800 37700 5 10 1 1 0 0 1
netname=f0a
}
C 40200 38900 1 90 0 vexp-1.sym
{
T 39900 39450 5 10 1 1 0 0 1
refdes=A_ru_time
T 39350 39600 5 10 0 0 90 0 1
device=vexp
T 39150 39600 5 10 0 0 90 0 1
footprint=none
T 39900 38950 5 10 1 1 0 0 1
value=time
}
N 40200 39200 41900 39200 4
{
T 40600 39200 5 10 1 1 0 0 1
netname=ru_time
}
C 40300 36100 1 90 0 vexp-1.sym
{
T 40000 36650 5 10 1 1 0 0 1
refdes=A_fu_time
T 39450 36800 5 10 0 0 90 0 1
device=vexp
T 39250 36800 5 10 0 0 90 0 1
footprint=none
T 40000 36050 5 10 1 1 0 0 1
value=time
}
N 41900 36400 40300 36400 4
{
T 40600 36400 5 10 1 1 0 0 1
netname=fu_time
}
N 38200 39200 39000 39200 4
{
T 38200 39200 5 10 1 1 0 0 1
netname=ru_on
}
N 38200 36400 39100 36400 4
{
T 38200 36400 5 10 1 1 0 0 1
netname=fu_on
}
C 50000 43600 1 270 0 voltage-3.sym
{
T 50700 43400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 50500 43100 5 10 1 1 0 0 1
refdes=B_pullup
T 50500 42900 5 10 1 1 0 0 1
value=V=pwl(V(Vdd, pad) $pullup0)
}
C 50100 42400 1 0 0 gnd-1.sym
N 50200 43600 50800 43600 4
{
T 50400 43600 5 10 1 1 0 0 1
netname=Ipu
}
N 52900 35900 52300 35900 4
{
T 52300 35900 5 10 1 1 0 0 1
netname=Igc0
}
C 46000 37500 1 270 0 voltage-3.sym
{
T 46700 37300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 46300 37300 5 10 1 1 0 0 1
refdes=B0
T 45900 35700 5 10 1 1 0 0 3
value=V=V(ru_on) > 0 ? 
+    pwl(V(ru_time) $rising_waveform0) :
+    pwl(V(fu_time) $falling_waveform0)
}
C 53300 34600 1 90 0 vexp-1.sym
{
T 51500 35250 5 10 1 1 0 0 1
refdes=A_comp0
T 52450 35300 5 10 0 0 90 0 1
device=vexp
T 52250 35300 5 10 0 0 90 0 1
footprint=none
T 53100 35250 5 10 1 1 0 0 1
value=comp0
}
N 53300 34900 54000 34900 4
{
T 53300 34900 5 10 1 1 0 0 1
netname=Icomp0
}
C 52300 38100 1 0 1 voltage-3.sym
{
T 52100 38800 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 51300 38600 5 10 1 1 0 0 1
refdes=B_pullup0
T 53100 38600 5 10 1 1 0 0 1
value=V=pwl({pullup_reference} - V(fixture0) $pullup0)
}
C 51300 38000 1 0 0 gnd-1.sym
N 52300 38300 52900 38300 4
{
T 52300 38300 5 10 1 1 0 0 1
netname=I3
}
C 52300 37300 1 0 1 voltage-3.sym
{
T 52100 38000 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 51300 37800 5 10 1 1 0 0 1
refdes=B_power_clamp0
T 53100 37800 5 10 1 1 0 0 1
value=V=pwl({power_clamp_reference} - V(fixture0) $power_clamp0)
}
C 51300 37200 1 0 0 gnd-1.sym
N 52900 37500 52300 37500 4
{
T 52300 37500 5 10 1 1 0 0 1
netname=Ipc0
}
C 52300 36100 1 180 0 voltage-3.sym
{
T 52100 35400 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 51300 36200 5 10 1 1 0 0 1
refdes=B_gnd_clamp0
T 53100 36200 5 10 1 1 0 0 1
value=V=pwl(V(fixture0) - {gnd_clamp_reference} $gnd_clamp0)
}
C 51300 35600 1 0 0 gnd-1.sym
N 51400 34900 52100 34900 4
{
T 51200 34900 5 10 1 1 0 0 1
netname=fixture0
}
T 44900 44600 9 10 1 0 0 0 1
IBIS Gate Model

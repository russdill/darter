v 20110115 2
T 43600 42000 8 10 1 0 0 0 1
use-license=GPL2+
T 43606 42200 8 10 1 0 0 0 1
dist-license=GPL2+
T 43600 42400 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 43600 41300 1 0 0 spice-directive-1.sym
{
T 43700 41600 5 10 0 1 0 0 1
device=directive
T 43600 41600 5 10 1 1 180 6 3
value=.model only_up slew(rise_slope=1e12 fall_slope=0)
.model overshoot_area int(out_lower_limit=0 out_upper_limit=1e12 limit_range=0)

T 43700 41700 5 10 1 1 0 0 1
refdes=spec
}
C 44800 40300 1 180 0 voltage-3.sym
{
T 44600 39600 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 43600 40600 5 10 1 1 0 0 1
refdes=B_ampl_overshoot_h
T 43600 40400 5 10 1 1 0 0 1
value=V={max(V(A_signal, A_pcref), 0)}
}
C 43600 40200 1 270 0 gnd-1.sym
N 44800 40100 46600 40100 4
{
T 44900 40100 5 10 1 1 0 0 1
netname=ampl_overshoot_h
}
C 46600 40300 1 180 1 current-1.sym
{
T 47200 39300 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 46400 40600 5 10 1 1 0 0 1
refdes=A_area_h
T 46400 40400 5 10 1 1 0 0 1
value=overshoot_area
}
C 50100 40300 1 180 0 voltage-3.sym
{
T 49900 39600 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 48900 40600 5 10 1 1 0 0 1
refdes=B_ampl_overshoot_l
T 48900 40400 5 10 1 1 0 0 1
value=V={max(V(A_gcref, A_signal), 0)}
}
C 48900 40200 1 270 0 gnd-1.sym
N 50100 40100 51900 40100 4
{
T 50200 40100 5 10 1 1 0 0 1
netname=ampl_overshoot_l
}
C 51900 40300 1 180 1 current-1.sym
{
T 52500 39300 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 51800 40600 5 10 1 1 0 0 1
refdes=A_area_l
T 51800 40400 5 10 1 1 0 0 1
value=overshoot_area
}
N 47500 40100 48100 40100 4
{
T 47500 40100 5 10 1 1 0 0 1
netname=area_h
}
N 52800 40100 53400 40100 4
{
T 52800 40100 5 10 1 1 0 0 1
netname=area_l
}
C 44800 36500 1 180 0 voltage-3.sym
{
T 44600 35800 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 43600 37000 5 10 1 1 0 0 1
refdes=B_D_overshoot_area
T 43600 36600 5 10 1 1 0 0 2
value=V={max(V(area_l, flat_full_l) - D_overshoot_area_l, 0) +
+    max(V(area_h, flat_full_h) - D_overshoot_area_h, 0)}
}
C 43600 36400 1 270 0 gnd-1.sym
N 44800 36300 46600 36300 4
{
T 44900 36300 5 10 1 1 0 0 1
netname=violation_d_overshoot_area
}
C 44800 38900 1 180 0 voltage-3.sym
{
T 44600 38200 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 43600 39200 5 10 1 1 0 0 1
refdes=B_flat_half_l
T 43600 39000 5 10 1 1 0 0 1
value=V={V(ampl_overshoot_l) > 0 ? 0 : V(area_l)}
}
C 43600 38800 1 270 0 gnd-1.sym
N 44800 38700 46600 38700 4
{
T 45000 38700 5 10 1 1 0 0 1
netname=flat_half_l
}
C 46600 38900 1 180 1 current-1.sym
{
T 47200 37900 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 47300 39200 5 10 1 1 0 0 1
refdes=A_flat_full_l
T 47300 39000 5 10 1 1 0 0 1
value=only_up
}
N 47500 38700 48100 38700 4
{
T 47500 38700 5 10 1 1 0 0 1
netname=flat_full_l
}
C 50100 38900 1 180 0 voltage-3.sym
{
T 49900 38200 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 48900 39200 5 10 1 1 0 0 1
refdes=B_flat_half_h
T 48900 39000 5 10 1 1 0 0 1
value=V={V(ampl_overshoot_h) > 0 ? 0 : V(area_h)}
}
C 48900 38800 1 270 0 gnd-1.sym
N 50100 38700 51900 38700 4
{
T 50300 38700 5 10 1 1 0 0 1
netname=flat_half_h
}
C 51900 38900 1 180 1 current-1.sym
{
T 52500 37900 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 52700 39200 5 10 1 1 0 0 1
refdes=A_flat_full_h
T 52700 39000 5 10 1 1 0 0 1
value=only_up
}
N 52800 38700 53400 38700 4
{
T 52800 38700 5 10 1 1 0 0 1
netname=flat_full_h
}
C 44800 37600 1 180 0 voltage-3.sym
{
T 44600 36900 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 43600 37900 5 10 1 1 0 0 1
refdes=B_no_glitch_l
T 43600 37700 5 10 1 1 0 0 1
value=V={V(ampl_overshoot_l) > 0 ? 1 : 0}
}
C 43600 37500 1 270 0 gnd-1.sym
N 44800 37400 46600 37400 4
{
T 45000 37400 5 10 1 1 0 0 1
netname=no_glitch0_l
}
C 46600 37600 1 180 1 current-1.sym
{
T 47200 36600 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 46700 37900 5 10 1 1 0 0 1
refdes=A_no_glitch_l
T 46700 37700 5 10 1 1 0 0 1
value=time_ramp
}
N 47500 37400 48100 37400 4
{
T 47500 37400 5 10 1 1 0 0 1
netname=no_glitch1_l
}
C 50100 37600 1 180 0 voltage-3.sym
{
T 49900 36900 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 48900 37900 5 10 1 1 0 0 1
refdes=B_no_glitch_h
T 48900 37700 5 10 1 1 0 0 1
value=V={V(ampl_overshoot_h) > 0 ? 1 : 0}
}
C 48900 37500 1 270 0 gnd-1.sym
N 50100 37400 51900 37400 4
{
T 50300 37400 5 10 1 1 0 0 1
netname=no_glitch0_h
}
C 51900 37600 1 180 1 current-1.sym
{
T 52500 36600 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 52000 37900 5 10 1 1 0 0 1
refdes=A_no_glitch_h
T 52000 37700 5 10 1 1 0 0 1
value=time_ramp
}
N 52800 37400 53400 37400 4
{
T 52800 37400 5 10 1 1 0 0 1
netname=no_glitch1_h
}
T 43600 38100 9 10 1 0 0 0 1
Check on the cat (seriously)
T 43600 40800 9 10 1 0 0 0 2
Store the total amount of overshoot...ever.
Attempting to empty an integration block causes problems.
T 43600 39400 9 10 1 0 0 0 2
Calculate the voltage last stored in the integration block when there was no overshoot.
This can be subtracted from total overshoot to get the amount of overshoot of this excursion.

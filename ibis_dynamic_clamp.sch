v 20110115 2
C 46400 39500 1 90 0 vexp-1.sym
{
T 44700 40150 5 10 1 1 0 0 1
refdes=A_trigger_r
T 45550 40200 5 10 0 0 90 0 1
device=vexp
T 45350 40200 5 10 0 0 90 0 1
footprint=none
T 46100 39550 5 10 1 1 0 0 1
value=time
}
N 46400 39800 47500 39800 4
{
T 46900 39800 5 10 1 1 0 0 1
netname=pp_time
}
C 44200 41200 1 0 0 spice-directive-1.sym
{
T 44300 41500 5 10 0 1 0 0 1
device=directive
T 44300 41600 5 10 1 1 0 0 1
refdes=Atime
T 44200 41300 5 10 1 1 0 0 1
value=.MODEL time slew(rise_slope=1 fall_slope=10)
}
C 44300 38300 1 0 0 gnd-1.sym
C 44100 35300 1 0 0 vdc-1.sym
{
T 43400 36250 5 10 1 1 0 0 1
refdes=B_trigger_f
T 44800 36150 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 44800 36350 5 10 0 0 0 0 1
footprint=none
T 42100 34750 5 10 1 1 0 0 1
value=V=V(on) > 0 ? (V(pad) < {V_trigger_f} ? {gnd_pulse_table0_max} : 0) : 0
}
C 46500 36200 1 90 0 vexp-1.sym
{
T 44700 36750 5 10 1 1 0 0 1
refdes=A_trigger_f
T 45650 36900 5 10 0 0 90 0 1
device=vexp
T 45450 36900 5 10 0 0 90 0 1
footprint=none
T 46200 36150 5 10 1 1 0 0 1
value=time
}
N 46500 36500 47600 36500 4
{
T 47000 36500 5 10 1 1 0 0 1
netname=gp_time
}
C 44300 35000 1 0 0 gnd-1.sym
C 44100 38600 1 0 0 vdc-1.sym
{
T 43300 39550 5 10 1 1 0 0 1
refdes=B_trigger_r
T 44800 39450 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 44800 39650 5 10 0 0 0 0 1
footprint=none
T 42200 38050 5 10 1 1 0 0 1
value=V=V(on) > 0 ? (V(pad) > {V_trigger_r} ? {power_pulse_table0_max} : 0) : 0
}
C 44300 37200 1 0 0 gnd-1.sym
N 44200 37500 44400 37500 4
{
T 44200 37500 5 10 1 1 0 0 1
netname=0
}
T 44200 41900 8 10 1 0 0 0 1
use-license=GPL2+
T 44206 42100 8 10 1 0 0 0 1
dist-license=GPL2+
T 44206 42300 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
N 44400 39800 45200 39800 4
{
T 44400 39800 5 10 1 1 0 0 1
netname=pp_on
}
N 44400 36500 45300 36500 4
{
T 44400 36500 5 10 1 1 0 0 1
netname=gp_on
}
C 55100 38100 1 90 0 current-1.sym
{
T 54100 38700 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 55000 38800 5 10 1 1 0 0 1
refdes=B_pc
T 55600 38500 5 10 1 1 0 0 4
value=I=modv(
+	pwl(V(power_pulse,pad) $power_clamp0_typ),
+	pwl(V(power_pulse,pad) $power_clamp0_min),
+	pwl(V(power_pulse,pad) $power_clamp0_max))
}
C 54700 37700 1 270 0 current-1.sym
{
T 55700 37100 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 55000 37500 5 10 1 1 0 0 1
refdes=B_gc
T 55600 36900 5 10 1 1 0 0 4
value=I=modv(
+	pwl(V(pad, ground_pulse) $gnd_clamp0_typ),
+	pwl(V(pad, ground_pulse) $gnd_clamp0_min),
+	pwl(V(pad, ground_pulse) $gnd_clamp0_max))
}
N 54900 38100 54900 37700 4
N 54900 39000 54900 39200 4
N 54900 36600 54900 36800 4
C 54700 39200 1 0 0 vcc-1.sym
C 55100 36600 1 180 0 vee-1.sym
N 54900 37900 56600 37900 4
{
T 55800 38000 5 10 1 1 0 0 1
netname=pad
}
N 50700 37100 50100 37100 4
{
T 50100 37100 5 10 1 1 0 0 1
netname=ground_pulse
}
C 50100 37700 1 0 1 voltage-3.sym
{
T 49900 38400 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 49400 38200 5 10 1 1 0 0 1
refdes=B_power_pulse0
T 49200 38600 5 10 1 1 0 0 4
value=V=modv(
+	pwl(V(pp_time) $power_pulse_table0_typ),
+	pwl(V(pp_time) $power_pulse_table0_min),
+	pwl(V(pp_time) $power_pulse_table0_max))
}
N 50700 37900 50100 37900 4
{
T 50100 37900 5 10 1 1 0 0 1
netname=power_pulse
}
C 49200 37300 1 180 1 voltage-3.sym
{
T 49400 36600 5 8 0 0 180 6 1
device=VOLTAGE_SOURCE
T 49400 37400 5 10 1 1 0 0 1
refdes=B_gnd_pulse0
T 49400 35900 5 10 1 1 0 0 4
value=V=modv(
+	pwl(V(gp_time) $gnd_pulse_table0_typ),
+	pwl(V(gp_time) $gnd_pulse_table0_min),
+	pwl(V(gp_time) $gnd_pulse_table0_max))
}
C 49000 37900 1 0 0 vcc-1.sym
C 49400 37100 1 180 0 vee-1.sym
C 49000 41600 1 180 1 current-1.sym
{
T 49600 40600 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 48800 41600 5 10 1 1 0 0 1
refdes=A_sel
T 48800 41100 5 10 1 1 0 0 1
value=dac
}
N 48400 41400 49000 41400 4
{
T 48400 41400 5 10 1 1 0 0 1
netname=[en]
}
N 49900 41400 50200 41400 4
{
T 49800 41400 5 10 1 1 0 0 1
netname=[on]
}
C 44200 40600 1 0 0 spice-directive-1.sym
{
T 44300 40900 5 10 0 1 0 0 1
device=directive
T 44200 40800 5 10 1 1 180 6 1
value=.MODEL dac dac_bridge(t_rise=0 t_fall=0)
T 44300 41000 5 10 1 1 0 0 1
refdes=_dac
}

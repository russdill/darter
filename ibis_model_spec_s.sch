v 20110115 2
T 43600 42300 8 10 1 0 0 0 1
use-license=GPL2+
T 43606 42500 8 10 1 0 0 0 1
dist-license=GPL2+
T 43600 42700 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 44800 40900 1 180 0 voltage-3.sym
{
T 44600 40200 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 43600 41500 5 10 1 1 0 0 1
refdes=B_S_overshoot
T 43600 40900 5 10 1 1 0 0 3
value=V={(max(V(meas) - S_overshoot_high, 0) +
+    max(S_overshoot_low - V(meas) , 0)) > 0 ? 
+    1 : -D_overshoot_time}
}
C 43600 40800 1 270 0 gnd-1.sym
N 44800 40700 46100 40700 4
{
T 44900 40700 5 10 1 1 0 0 1
netname=S_overshoot
}
C 46100 40900 1 180 1 current-1.sym
{
T 46700 39900 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 47500 41200 5 10 1 1 0 0 1
refdes=A_overshoot_slew
T 47500 41000 5 10 1 1 0 0 1
value=time_ramp
}
C 43600 41600 1 0 0 spice-directive-1.sym
{
T 43700 41900 5 10 0 1 0 0 1
device=directive
T 43600 41900 5 10 1 1 180 6 1
value=.model time_ramp slew(rise_slope=1 fall_slope=1e12)
T 43700 42000 5 10 1 1 0 0 1
refdes=spec
}
C 44800 40000 1 180 0 voltage-3.sym
{
T 44600 39300 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 43600 40300 5 10 1 1 0 0 1
refdes=B_S_overshoot2
T 43600 40100 5 10 1 1 0 0 1
value=V={max(V(overshoot_slewed), 0)}
}
C 43600 39900 1 270 0 gnd-1.sym
N 47000 40700 48500 40700 4
{
T 47000 40700 5 10 1 1 0 0 1
netname=overshoot_slewed
}
N 44800 39800 46600 39800 4
{
T 44900 39800 5 10 1 1 0 0 1
netname=violation_s_overshoot
}

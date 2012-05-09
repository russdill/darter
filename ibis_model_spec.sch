v 20110115 2
T 43600 42300 8 10 1 0 0 0 1
use-license=GPL2+
T 43606 42500 8 10 1 0 0 0 1
dist-license=GPL2+
T 43600 42700 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 44800 41100 1 180 0 voltage-3.sym
{
T 44600 40400 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 43600 42000 5 10 1 1 0 0 1
refdes=B_violation
T 43600 41200 5 10 1 1 0 0 4
value=V={V(violation_d_overshoot) +
+    V(violation_s_overshoot) +
+    V(violation_d_overshoot_ampl) +
+    V(violation_d_overshoot_area)}
}
C 43600 41000 1 270 0 gnd-1.sym
N 44800 40900 46600 40900 4
{
T 44900 40900 5 10 1 1 0 0 1
netname=violation
}

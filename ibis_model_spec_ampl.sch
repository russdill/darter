v 20110115 2
T 43600 42300 8 10 1 0 0 0 1
use-license=GPL2+
T 43606 42500 8 10 1 0 0 0 1
dist-license=GPL2+
T 43600 42700 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 44800 41500 1 180 0 voltage-3.sym
{
T 44600 40800 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 43600 42000 5 10 1 1 0 0 1
refdes=B_D_overshoot_ampl
T 43600 41600 5 10 1 1 0 0 2
value=V={max(V(A_signal, A_pcref) - D_overshoot_ampl_h, 0) +
+    max(V(A_gcref, A_signal) - D_overshoot_ampl_l , 0)}
}
C 43600 41400 1 270 0 gnd-1.sym
N 44800 41300 46600 41300 4
{
T 44900 41300 5 10 1 1 0 0 1
netname=violation_d_overshoot_ampl
}
C 44800 29800 1 180 0 voltage-3.sym
{
T 44600 29100 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 43600 30700 5 10 1 1 0 0 1
refdes=B_violation
T 43600 29900 5 10 1 1 0 0 4
value=V={V(violation_d_overshoot) +
+    V(violation_s_overshoot_time) +
+    V(violation_d_overshoot_ampl) +
+    V(violation_d_overshoot_area)}
}
C 43600 29700 1 270 0 gnd-1.sym
N 44800 29600 46600 29600 4
{
T 44900 29600 5 10 1 1 0 0 1
netname=violation
}

v 20110115 2
N 49800 45900 52300 45900 4
{
T 52000 46000 5 10 1 1 0 0 1
netname=A_signal
}
C 50000 44800 1 90 0 capacitor-1.sym
{
T 49300 45000 5 10 0 0 90 0 1
device=CAPACITOR
T 49900 45400 5 10 1 1 0 0 1
refdes=C_comp_gc
T 49100 45000 5 10 0 0 90 0 1
symversion=0.1
T 49900 45000 5 10 1 1 0 0 1
value={C_comp_gnd_clamp}
}
C 50000 46100 1 90 0 capacitor-1.sym
{
T 49300 46300 5 10 0 0 90 0 1
device=CAPACITOR
T 49900 46700 5 10 1 1 0 0 1
refdes=C_comp_pc
T 49100 46300 5 10 0 0 90 0 1
symversion=0.1
T 49900 46300 5 10 1 1 0 0 1
value={C_comp_power_clamp}
}
N 49800 45700 49800 46100 4
N 49200 45900 49800 45900 4
N 49800 44700 49800 44800 4
N 49200 47100 49800 47100 4
N 49800 47100 49800 47000 4
N 49800 44700 49200 44700 4
C 49400 46100 1 90 0 current-1.sym
{
T 48400 46700 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 48700 46800 5 10 1 1 0 0 1
refdes=B_pc
T 44400 47000 5 10 1 1 180 6 5
value=I=modv(
+	pwl(V(A_pcref, A_signal) $Power_Clamp_typ),
+	pwl(V(A_pcref, A_signal) $Power_Clamp_min),
+	pwl(V(A_pcref, A_signal) $Power_Clamp_max))

}
C 49000 45700 1 270 0 current-1.sym
{
T 50000 45100 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 48700 45500 5 10 1 1 0 0 1
refdes=B_gc
T 44400 45700 5 10 1 1 180 6 4
value=I=modv(
+	pwl(V(A_signal, A_gcref) $GND_Clamp_typ),
+	pwl(V(A_signal, A_gcref) $GND_Clamp_min),
+	pwl(V(A_signal, A_gcref) $GND_Clamp_max))
}
N 49200 45700 49200 46100 4
N 49200 47000 49200 47200 4
N 49200 44600 49200 44800 4
T 45200 47900 8 10 1 0 0 0 1
use-license=GPL2+
T 45206 48100 8 10 1 0 0 0 1
dist-license=GPL2+
T 45200 48300 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 52100 44800 1 90 0 resistor-1.sym
{
T 51700 45100 5 10 0 0 90 0 1
device=RESISTOR
T 52100 45400 5 10 1 1 0 0 1
refdes=R_pad_gnd_ref
T 52100 45000 5 10 1 1 0 0 1
value=1e12
}
N 52000 45700 52000 45900 4
C 45000 44000 1 270 0 voltage-3.sym
{
T 45700 43800 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 45300 43800 5 10 1 1 0 0 1
refdes=B_meas
T 45300 43200 5 10 1 1 0 0 1
value=V=V(A_signal) - V(A_gcref)
}
C 45100 42800 1 0 0 gnd-1.sym
C 51900 44500 1 0 0 gnd-1.sym
N 45200 44000 45800 44000 4
{
T 45300 44000 5 10 1 1 0 0 1
netname=meas
}
C 49000 47200 1 0 0 generic-power.sym
{
T 49200 47450 5 10 1 1 0 3 1
net=A_pcref:1
}
C 49000 44600 1 180 1 generic-power.sym
{
T 49200 44350 5 10 1 1 180 3 1
net=A_gcref:1
}

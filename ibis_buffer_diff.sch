v 20110115 2
T 45100 44400 8 10 1 0 0 0 1
use-license=GPL2+
T 45106 44600 8 10 1 0 0 0 1
dist-license=GPL2+
T 45100 44800 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 45000 44000 1 270 0 voltage-3.sym
{
T 45700 43800 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 45300 43800 5 10 1 1 0 0 1
refdes=B_odd
T 45300 43200 5 10 1 1 0 0 1
value=V=V(A_signal_pos, A_signal_neg)
}
C 45100 42800 1 0 0 gnd-1.sym
N 45200 44000 45800 44000 4
{
T 45300 44000 5 10 1 1 0 0 1
netname=odd
}
C 48600 44000 1 270 0 voltage-3.sym
{
T 49300 43800 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 48900 43800 5 10 1 1 0 0 1
refdes=B_common
T 48900 43200 5 10 1 1 0 0 1
value=V=(V(A_signal_pos) + V(A_signal_neg))/2
}
C 48700 42800 1 0 0 gnd-1.sym
N 48800 44000 49400 44000 4
{
T 48900 44000 5 10 1 1 0 0 1
netname=common
}

v 20110115 2
T 40000 46000 8 10 1 0 0 0 1
use-license=GPL2+
T 40006 46200 8 10 1 0 0 0 1
dist-license=GPL2+
T 40000 46400 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 40000 45300 1 0 0 spice-directive-1.sym
{
T 40100 45600 5 10 0 1 0 0 1
device=directive
T 40000 45500 5 10 1 1 180 6 1
value=.MODEL adc_in adc_bridge(in_low={Vinl} in_high={Vinh})
T 40100 45700 5 10 1 1 0 0 1
refdes=_adc
}
C 40300 44700 1 0 0 current-1.sym
{
T 40900 45700 5 10 0 0 0 0 1
device=CURRENT_SOURCE
T 40200 45100 5 10 1 1 0 0 1
refdes=A_in
T 40900 45100 5 10 1 1 0 0 1
value=adc_in
}
N 41500 44900 41200 44900 4
{
T 41200 44900 5 10 1 1 0 0 1
netname=[in]
}
N 40300 44900 40000 44900 4
{
T 40000 44900 5 10 1 1 0 0 1
netname=[pad]
}
C 41200 44500 1 180 0 voltage-3.sym
{
T 41000 43800 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 40200 44400 5 10 1 1 0 0 1
refdes=Vinl
T 40500 43900 5 10 1 1 0 0 1
value=DC {Vinl}
}
N 41500 44300 41200 44300 4
{
T 41200 44300 5 10 1 1 0 0 1
netname=Vinl
}
C 43700 45900 1 0 0 gnd-1.sym
N 43900 46200 43800 46200 4
{
T 43800 46200 5 10 1 1 0 0 1
netname=0
}
C 40200 44000 1 0 0 gnd-1.sym
C 41200 43700 1 180 0 voltage-3.sym
{
T 41000 43000 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 40200 43600 5 10 1 1 0 0 1
refdes=Vinh
T 40500 43100 5 10 1 1 0 0 1
value=DC {Vinh}
}
N 41500 43500 41200 43500 4
{
T 41200 43500 5 10 1 1 0 0 1
netname=Vinh
}
C 40200 43200 1 0 0 gnd-1.sym

v 20110115 2
T 40000 46200 8 10 1 0 0 0 1
use-license=GPL2+
T 40006 46400 8 10 1 0 0 0 1
dist-license=GPL2+
T 40000 46600 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 40000 45500 1 0 0 spice-directive-1.sym
{
T 40100 45800 5 10 0 1 0 0 1
device=directive
T 40000 45800 5 10 1 1 180 6 2
value=.MODEL adc_in adc_bridge(in_low={Vinl} in_high={Vinh} rise_delay=1f fall_delay=1f)
.MODEL dac_inv dac_bridge(t_rise=0 t_fall=0)
T 40100 45900 5 10 1 1 0 0 1
refdes=_spice
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
C 43100 45100 1 180 0 voltage-3.sym
{
T 42900 44400 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 42100 45000 5 10 1 1 0 0 1
refdes=Vinl
T 42400 44500 5 10 1 1 0 0 1
value=DC {Vinl}
}
N 43400 44900 43100 44900 4
{
T 43100 44900 5 10 1 1 0 0 1
netname=Vinl
}
C 43700 46100 1 0 0 gnd-1.sym
N 43900 46400 43800 46400 4
{
T 43800 46400 5 10 1 1 0 0 1
netname=0
}
C 42100 44600 1 0 0 gnd-1.sym
C 43100 44300 1 180 0 voltage-3.sym
{
T 42900 43600 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 42100 44200 5 10 1 1 0 0 1
refdes=Vinh
T 42400 43700 5 10 1 1 0 0 1
value=DC {Vinh}
}
N 43400 44100 43100 44100 4
{
T 43100 44100 5 10 1 1 0 0 1
netname=Vinh
}
C 42100 43800 1 0 0 gnd-1.sym
C 40200 43900 1 0 0 current-1.sym
{
T 40800 44900 5 10 0 0 0 0 1
device=CURRENT_SOURCE
T 40100 44300 5 10 1 1 0 0 1
refdes=A_inv
T 40800 44300 5 10 1 1 0 0 1
value=dac_inv
}
N 41400 44100 41100 44100 4
{
T 41100 44100 5 10 1 1 0 0 1
netname=[inv]
}
N 40200 44100 39900 44100 4
{
T 39900 44100 5 10 1 1 0 0 1
netname=[in]
}

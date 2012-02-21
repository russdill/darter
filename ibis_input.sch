v 20110115 2
T 41500 43900 8 10 1 0 0 0 1
use-license=GPL2+
T 41506 44100 8 10 1 0 0 0 1
dist-license=GPL2+
T 41500 44300 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 41500 43200 1 0 0 spice-directive-1.sym
{
T 41600 43500 5 10 0 1 0 0 1
device=directive
T 41400 43400 5 10 1 1 180 6 3
value=.model adc_in adc_bridge(in_low=0 in_high=1 rise_delay=1f fall_delay=1f)
.model on sw(vt={(Vinh_ac + Vinh_dc)/2} vh={(Vinh_ac - Vinh_dc)/2} ron=1 roff=9)
.model off sw(vt={(Vinl_dc + Vinl_ac)/2} vh={(Vinl_dc - Vinl_ac)/2} ron=9 roff=1)
T 41600 43600 5 10 1 1 0 0 1
refdes=input
}
C 42400 42000 1 0 0 current-1.sym
{
T 43000 43000 5 10 0 0 0 0 1
device=CURRENT_SOURCE
T 42300 42400 5 10 1 1 0 0 1
refdes=A_in
T 43000 42400 5 10 1 1 0 0 1
value=adc_in
}
N 43600 42200 43300 42200 4
{
T 43300 42200 5 10 1 1 0 0 1
netname=[in]
}
N 42400 42200 42100 42200 4
{
T 42100 42200 5 10 1 1 0 0 1
netname=[state]
}
C 47000 40500 1 0 1 spice-vc-switch-1.sym
{
T 45400 41200 5 8 0 0 0 6 1
device=SPICE-VC-switch
T 45800 41700 5 12 1 1 0 0 1
refdes=S_on
T 45800 40650 5 8 1 1 0 0 1
model-name=on OFF
}
N 46800 41500 47400 41500 4
{
T 47400 41500 5 10 1 1 0 6 1
netname=A_signal
}
C 41800 40500 1 0 0 spice-vc-switch-1.sym
{
T 43400 41200 5 8 0 0 0 0 1
device=SPICE-VC-switch
T 42500 41700 5 12 1 1 0 0 1
refdes=S_off
T 42500 40650 5 8 1 1 0 0 1
model-name=off ON
}
N 42000 41500 41400 41500 4
{
T 41400 41500 5 10 1 1 0 0 1
netname=A_signal
}
N 43500 41500 45300 41500 4
{
T 44700 41500 5 10 1 1 0 6 1
netname=state
}
C 45300 40700 1 0 1 voltage-3.sym
{
T 45100 41400 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 44600 40500 5 10 1 1 0 0 1
refdes=V_sw1
T 44600 40300 5 10 1 1 0 0 1
value=DC 1.125V
}
C 44400 40700 1 0 1 voltage-3.sym
{
T 44200 41400 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 43600 40500 5 10 1 1 0 0 1
refdes=V_sw0
T 43600 40300 5 10 1 1 0 0 1
value=DC 0.125V
}
C 45800 42000 1 0 1 voltage-3.sym
{
T 45600 42700 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 44600 42400 5 10 1 1 0 0 1
refdes=B_Vth
T 44600 42600 5 10 1 1 0 0 1
value=V={Vth+threshold_sensitivity*(V($ref_supply)-Vth)}
}
N 41700 40900 42000 40900 4
N 47100 40900 46800 40900 4
N 44200 42000 44100 42000 4
{
T 44200 42100 5 10 1 1 180 2 1
netname=0
}
C 44000 41700 1 0 0 gnd-1.sym
C 44300 40600 1 0 0 gnd-1.sym
C 44600 42300 1 270 0 gnd-1.sym
C 45800 42400 1 270 0 generic-power.sym
{
T 46050 42200 5 10 1 1 270 3 1
net=Vth:1
}
C 46900 40900 1 0 0 generic-power.sym
{
T 47100 41150 5 10 1 1 0 3 1
net=Vth:1
}
C 41500 40900 1 0 0 generic-power.sym
{
T 41700 41150 5 10 1 1 0 3 1
net=Vth:1
}
T 46100 43600 9 10 1 0 0 0 5
S_off	S_on	state
off		off		0V
off		on		0.5V
on		off		0.5V
on		on		1V

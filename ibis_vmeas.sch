v 20110115 2
T 45500 44600 8 10 1 0 0 0 1
use-license=GPL2+
T 45506 44800 8 10 1 0 0 0 1
dist-license=GPL2+
T 45500 45000 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 45500 43900 1 0 0 spice-directive-1.sym
{
T 45600 44200 5 10 0 1 0 0 1
device=directive
T 45500 44200 5 10 1 1 180 6 5
value=.model time_ramp slew(rise_slope=1 fall_slope=0)
.model delay adc_bridge(in_low=0 in_high=1 rise_delay=1f)
.model inv d_inverter(rise_delay=1f fall_delay=1f input_load=0)
.model pullup d_pullup(load=0)
A_hi hi pullup
T 45600 44300 5 10 1 1 0 0 1
refdes=spec
}
C 47900 40600 1 180 0 gnd-1.sym
C 45800 37600 1 0 0 ibis_io.sym
{
T 45300 37550 5 10 1 1 0 0 1
value=$model spec={spec}
T 46000 39600 5 10 0 0 0 0 1
symversion=1.0
T 46000 39250 5 10 1 1 0 0 1
refdes=X0
}
C 48000 39400 1 90 0 voltage-3.sym
{
T 47300 39600 5 8 0 0 90 0 1
device=VOLTAGE_SOURCE
T 48100 40000 5 10 1 1 0 0 1
refdes=V_pcref
T 48100 39800 5 10 1 1 0 0 1
value=DC={pcref}
}
C 47500 39400 1 90 0 voltage-3.sym
{
T 46800 39600 5 8 0 0 90 0 1
device=VOLTAGE_SOURCE
T 46900 40900 5 10 1 1 0 0 1
refdes=V_puref
T 46900 40700 5 10 1 1 0 0 1
value=DC={puref}
}
C 47400 40600 1 180 0 gnd-1.sym
C 46900 39400 1 90 0 voltage-3.sym
{
T 46200 39600 5 8 0 0 90 0 1
device=VOLTAGE_SOURCE
T 45700 40000 5 10 1 1 0 0 1
refdes=V_extref
T 45400 39800 5 10 1 1 0 0 1
value=DC={extref}
}
C 46800 40600 1 180 0 gnd-1.sym
C 47600 37600 1 270 0 voltage-3.sym
{
T 48300 37400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 48100 37200 5 10 1 1 0 0 1
refdes=V_gcref
T 48100 37000 5 10 1 1 0 0 1
value=DC={gcref}
}
C 47100 37600 1 270 0 voltage-3.sym
{
T 47800 37400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 46400 37200 5 10 1 1 0 0 1
refdes=V_pdref
T 46100 37000 5 10 1 1 0 0 1
value=DC={pdref}
}
C 47700 36400 1 0 0 gnd-1.sym
C 47200 36400 1 0 0 gnd-1.sym
N 48500 38500 49800 38500 4
{
T 49000 38550 5 10 1 1 0 0 1
netname=meas
}
C 49800 37400 1 90 0 capacitor-1.sym
{
T 49100 37600 5 10 0 0 90 0 1
device=CAPACITOR
T 49700 38000 5 10 1 1 0 0 1
refdes=Cref
T 48900 37600 5 10 0 0 90 0 1
symversion=0.1
T 49700 37600 5 10 1 1 0 0 1
value={Cref}
}
C 49800 38400 1 0 0 resistor-1.sym
{
T 50100 38800 5 10 0 0 0 0 1
device=RESISTOR
T 50000 38700 5 10 1 1 0 0 1
refdes=Rref
T 50400 38700 5 10 1 1 0 0 1
value={Rref}
}
N 49600 38300 49600 38500 4
C 49500 37100 1 0 0 gnd-1.sym
N 50700 38500 50900 38500 4
N 45800 38100 45000 38100 4
{
T 44900 38150 5 10 1 1 0 0 1
netname=$D_enable
}
N 45800 38900 45000 38900 4
{
T 44900 38950 5 10 1 1 0 0 1
netname=$D_drive
}
C 46700 41600 1 180 0 voltage-3.sym
{
T 46500 40900 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 44800 41900 5 10 1 1 0 0 1
refdes=B_meas
T 44800 41700 5 10 1 1 0 0 1
value=V=V(meas) $gtlt {Vmeas} ? V(delay) : 0
}
C 45500 41500 1 270 0 gnd-1.sym
C 47800 41600 1 180 1 current-1.sym
{
T 48400 40600 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 48100 41900 5 10 1 1 0 0 1
refdes=A_time
T 48100 41700 5 10 1 1 0 0 1
value=time_ramp
}
N 47800 41400 46700 41400 4
{
T 46900 41450 5 10 1 1 0 0 1
netname=not_ready
}
N 49300 41400 48700 41400 4
{
T 48900 41450 5 10 1 1 0 0 1
netname=time
}
C 48000 42500 1 180 1 current-1.sym
{
T 48600 41500 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 48200 42800 5 10 1 1 0 0 1
refdes=A_delay
T 48200 42600 5 10 1 1 0 0 1
value=delay
}
N 48900 42300 49300 42300 4
{
T 48900 42350 5 10 1 1 0 0 1
netname=[drive]
}
N 46700 42300 47200 42300 4
{
T 46700 42350 5 10 1 1 0 0 1
netname=delay
}
C 46700 42500 1 180 0 voltage-3.sym
{
T 46500 41800 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 45500 42800 5 10 1 1 0 0 1
refdes=V_delay
T 45500 42600 5 10 1 1 0 0 1
value=DC=0V pulse(0 1 1f 0 0 1Meg)
}
N 47600 42300 48000 42300 4
{
T 47600 42350 5 10 1 1 0 0 1
netname=[delay]
}
C 45500 42400 1 270 0 gnd-1.sym
C 50700 38300 1 270 0 voltage-3.sym
{
T 51400 38100 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 51200 37900 5 10 1 1 0 0 1
refdes=Vref
T 51200 37700 5 10 1 1 0 0 1
value=DC={Vref}
}
C 50800 37100 1 0 0 gnd-1.sym
N 50900 38300 50900 38500 4
C 50000 42500 1 180 1 current-1.sym
{
T 50600 41500 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 50200 42800 5 10 1 1 0 0 1
refdes=A_inv
T 50200 42600 5 10 1 1 0 0 1
value=inv
}
N 50900 42300 51300 42300 4
{
T 50700 42350 5 10 1 1 0 0 1
netname=not_drive
}
N 49600 42300 50000 42300 4
{
T 49600 42350 5 10 1 1 0 0 1
netname=drive
}

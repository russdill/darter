v 20110115 2
T 41500 44400 8 10 1 0 0 0 1
use-license=GPL2+
T 41506 44600 8 10 1 0 0 0 1
dist-license=GPL2+
T 41500 44800 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 41500 43700 1 0 0 spice-directive-1.sym
{
T 41600 44000 5 10 0 1 0 0 1
device=directive
T 41400 43900 5 10 1 1 180 6 4
value=.model adc_in adc_bridge(in_low=0 in_high=1 rise_delay=1f fall_delay=1f)
.model on sw(vt={(Vdiff_ac + Vdiff_dc)/2} vh={(Vdiff_ac - Vdiff_dc)/2} ron=1 roff=9)
.model off sw(vt={-(Vdiff_ac + Vdiff_dc)/2} vh={(Vdiff_ac - Vdiff_dc)/2} ron=9 roff=1)
.model time_ramp slew(rise_slope=1 fall_slope=1e12)
T 41600 44100 5 10 1 1 0 0 1
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
N 44200 42200 43300 42200 4
{
T 43300 42200 5 10 1 1 0 0 1
netname=[D_receive]
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
N 46800 41500 47900 41500 4
{
T 47900 41500 5 10 1 1 0 6 1
netname=A_signal_pos
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
N 42000 41500 40900 41500 4
{
T 40900 41500 5 10 1 1 0 0 1
netname=A_signal_pos
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
C 44300 40600 1 0 0 gnd-1.sym
T 46100 44100 9 10 1 0 0 0 5
S_off	S_on	state
off		off		0V
off		on		0.5V
on		off		0.5V
on		on		1V
N 42000 40900 40900 40900 4
{
T 40900 40900 5 10 1 1 0 0 1
netname=A_signal_neg
}
N 46800 40900 47900 40900 4
{
T 47900 40900 5 10 1 1 0 6 1
netname=A_signal_neg
}
C 42600 38900 1 180 0 voltage-3.sym
{
T 42400 38200 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 41400 39600 5 10 1 1 0 0 1
refdes=B_vcross
T 41400 39000 5 10 1 1 0 0 3
value=V=V(pulse) > 0 && 
+    (V(A_signal_pos, A_gcref) < Vcross_low ||
+     V(A_signal_pos, A_gcref) > Vcross_high)
}
C 41400 38800 1 270 0 gnd-1.sym
N 43700 38700 42600 38700 4
{
T 42600 38700 5 10 1 1 0 0 1
netname=vcross_violation
}
C 47000 39000 1 180 0 voltage-3.sym
{
T 46800 38300 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 46000 39300 5 10 1 1 0 0 1
refdes=B_violation
T 46000 39100 5 10 1 1 0 0 1
value=V=V(vcross_violation)
}
C 45800 38900 1 270 0 gnd-1.sym
N 48100 38800 47000 38800 4
{
T 47000 38800 5 10 1 1 0 0 1
netname=violation
}
C 42600 37800 1 180 0 voltage-3.sym
{
T 42400 37100 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 41400 38100 5 10 1 1 0 0 1
refdes=B_unknown
T 41400 37900 5 10 1 1 0 0 1
value=V={V(state) > 0 && V(state) < 1 ? 1 : 0}
}
C 43900 37800 1 180 1 current-1.sym
{
T 44500 36800 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 44500 38100 5 10 1 1 0 0 1
refdes=A_unknown
T 44500 37900 5 10 1 1 0 0 1
value=time_ramp
}
N 42600 37600 43900 37600 4
{
T 42700 37600 5 10 1 1 0 0 1
netname=unknown
}
N 44800 37600 46300 37600 4
{
T 44800 37600 5 10 1 1 0 0 1
netname=unknown_time
}
C 41400 37700 1 270 0 gnd-1.sym
C 42600 36900 1 180 0 voltage-3.sym
{
T 42400 36200 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 41400 37200 5 10 1 1 0 0 1
refdes=B_slew_violation
T 41400 37000 5 10 1 1 0 0 1
value=V={max(V(unknown_time) - Tdiffslew_ac, 0)}
}
C 41400 36800 1 270 0 gnd-1.sym
N 42600 36700 44100 36700 4
{
T 42600 36700 5 10 1 1 0 0 1
netname=slew_violation
}
C 42600 35600 1 0 1 voltage-3.sym
{
T 42400 36300 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 41400 36000 5 10 1 1 0 0 1
refdes=B_AC_Margin
T 41400 36200 5 10 1 1 0 0 1
value=V={max(V(A_signal_pos, A_signal_neg) - Vdiff_ac, 0) + max(V(A_signal_pos, A_signal_neg) - Vdiff_ac, 0)}
}
C 41400 35900 1 270 0 gnd-1.sym
N 42600 35800 44100 35800 4
{
T 42600 35800 5 10 1 1 0 0 1
netname=ac_margin
}
C 42600 34800 1 0 1 voltage-3.sym
{
T 42400 35500 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 41400 35200 5 10 1 1 0 0 1
refdes=B_DC_Margin
T 41400 35400 5 10 1 1 0 0 1
value=V={max(V(A_signal_pos, A_signal_neg) - Vdiff_dc, 0) + max(V(A_signal_neg, A_signal_pos) - Vdiff_dc, 0)}
}
C 41400 35100 1 270 0 gnd-1.sym
N 42600 35000 44100 35000 4
{
T 42600 35000 5 10 1 1 0 0 1
netname=dc_margin
}
C 48500 42100 1 0 0 spice-directive-1.sym
{
T 48600 42400 5 10 0 1 0 0 1
device=directive
T 48400 42300 5 10 1 1 180 6 12
value=.model adc0 adc_bridge(in_low=-0 in_high=0 rise_delay=1f fall_delay=1f)
.model dac_pulse dac_bridge(t_rise=1f t_fall=1f)
.model dff_pulse d_dff(clk_delay=1f set_delay=1f reset_delay=1f rise_delay=1f fall_delay=1f)
.model or_pulse d_or(rise_delay=1f fall_delay=1f)
.model dac_pullup d_pullup(load=0)
A_dac_hi hi dac_pullup
b_in0 A_signal_odd 0 V=V(A_signal_pos, A_signal_neg)
a_in0 [A_signal_odd] [D_receive0] adc0
a_pulse_pos hi D_receive0 ~hi pulse_pos pulse_pos pulse_pos_inv dff_pulse
a_pulse_neg hi ~D_receive0 ~hi pulse_neg pulse_neg pulse_neg_inv dff_pulse
a_pulse_or [pulse_pos pulse_neg] pulse_digital or_pulse
a_pulse_dac [pulse_digital] [pulse] dac_pulse
T 48600 42500 5 10 1 1 0 0 1
refdes=input0
}

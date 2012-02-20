v 20110115 2
T 52600 48600 8 10 1 0 0 0 1
use-license=GPL2+
T 52606 48800 8 10 1 0 0 0 1
dist-license=GPL2+
T 52606 49000 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 52600 47900 1 0 0 spice-directive-1.sym
{
T 52700 48200 5 10 0 1 0 0 1
device=directive
T 52600 48200 5 10 1 1 180 6 8
value=.model dac dac_bridge(t_rise=0 t_fall=0)
.model dly adc_bridge(in_low=0 in_high=1 rise_delay=1f)
.model and d_and(input_load=0 rise_delay=1f fall_delay=1f)
.model nand d_nand(input_load=0 rise_delay=1f fall_delay=1f)
.model rtime dac_bridge(out_low=0 out_high={Rising_time}
+	t_rise={Rising_time} t_fall={Rising_time/10})
.model ftime dac_bridge(out_low=0 out_high={Falling_time}
+	t_rise={Falling_time} t_fall={Falling_time/10})
T 52700 48300 5 10 1 1 0 0 1
refdes=_dac
}
N 53100 43800 52900 43800 4
{
T 52900 43800 5 10 1 1 0 0 1
netname=0
}
C 54900 44000 1 180 1 current-1.sym
{
T 55500 43000 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 54800 44100 5 10 1 1 0 0 1
refdes=A_delay
T 55000 43400 5 10 1 1 0 0 1
value=dly
}
N 55800 43800 56200 43800 4
{
T 55800 43800 5 10 1 1 0 0 1
netname=[ddly]
}
N 54000 43800 54300 43800 4
{
T 54000 43800 5 10 1 1 0 0 1
netname=dly
}
C 54000 44000 1 180 0 voltage-3.sym
{
T 53800 43300 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 53000 44100 5 10 1 1 0 0 1
refdes=V_delay
T 51600 43400 5 10 1 1 0 0 1
value=DC=0V pulse({start_on} 1 1f 0 0 1Meg)
}
T 52800 44400 9 10 1 0 0 0 6
This is a bit of a hack. ngspice's DC solution
for two IBIS buffers connected by a txl or cpl
transmission line causes noise in the transient
for about 150ns. This problem does not
occur if the buffers are off at t=0. The below
causes the buffer to start out tristated.
N 54600 43800 54900 43800 4
{
T 54600 43800 5 10 1 1 0 0 1
netname=[dly]
}

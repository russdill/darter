v 20110115 2
T 52600 47000 8 10 1 0 0 0 1
use-license=GPL2+
T 52606 47200 8 10 1 0 0 0 1
dist-license=GPL2+
T 52606 47400 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 59300 46500 1 180 1 current-1.sym
{
T 59900 45500 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 59100 46500 5 10 1 1 0 0 1
refdes=A_ru_on
T 59100 46000 5 10 1 1 0 0 1
value=and
}
N 59300 46300 58200 46300 4
{
T 58200 46300 5 10 1 1 0 0 1
netname=[en ddly out]
}
N 60200 46300 61400 46300 4
{
T 60200 46300 5 10 1 1 0 0 1
netname=ru_on
}
C 59300 45700 1 180 1 current-1.sym
{
T 59900 44700 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 59100 45700 5 10 1 1 0 0 1
refdes=A_rd_on
T 59100 45200 5 10 1 1 0 0 1
value=nand
}
N 59300 45500 58200 45500 4
{
T 58200 45500 5 10 1 1 0 0 1
netname=[en ddly ~out]
}
N 60200 45500 61400 45500 4
{
T 60200 45500 5 10 1 1 0 0 1
netname=rd_on
}
C 59300 44900 1 180 1 current-1.sym
{
T 59900 43900 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 59100 44900 5 10 1 1 0 0 1
refdes=A_rtime
T 59100 44400 5 10 1 1 0 0 1
value=rtime
}
N 58200 44700 59300 44700 4
{
T 58200 44700 5 10 1 1 0 0 1
netname=[ru_on rd_on]
}
N 60200 44700 61400 44700 4
{
T 60100 44700 5 10 1 1 0 0 1
netname=[ru_time rd_time]
}
C 59300 44100 1 180 1 current-1.sym
{
T 59900 43100 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 59100 44100 5 10 1 1 0 0 1
refdes=A_dtime
T 59100 43600 5 10 1 1 0 0 1
value=ftime
}
N 58200 43900 59300 43900 4
{
T 58200 43900 5 10 1 1 0 0 1
netname=[~ru_on ~rd_on]
}
N 60200 43900 61400 43900 4
{
T 60100 43900 5 10 1 1 0 0 1
netname=[fu_time fd_time]
}
C 52600 46300 1 0 0 spice-directive-1.sym
{
T 52700 46600 5 10 0 1 0 0 1
device=directive
T 52600 46600 5 10 1 1 180 6 12
value=.model dac dac_bridge(t_rise=0 t_fall=0)
.model dly adc_bridge(in_low=0 in_high=1 rise_delay=1f)
.model and d_and(input_load=0 rise_delay=1f fall_delay=1f)
.model nand d_nand(input_load=0 rise_delay=1f fall_delay=1f)

.param rising_kpu_max10={rising_kpu_max / 10}
.model rtime dac_bridge(out_low=0 out_high={rising_kpu_max}
+	t_rise={rising_kpu_max} t_fall={rising_kpu_max10})

.param falling_kpd_max10={falling_kpd_max / 10}
.model ftime dac_bridge(out_low=0 out_high={falling_kpd_max}
+	t_rise={falling_kpd_max} t_fall={falling_kpd_max10})
T 52700 46700 5 10 1 1 0 0 1
refdes=_dac
}
C 59300 43300 1 180 1 current-1.sym
{
T 59900 42300 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 59100 43300 5 10 1 1 0 0 1
refdes=A_sel
T 59100 42800 5 10 1 1 0 0 1
value=dac
}
N 58200 43100 59300 43100 4
{
T 58200 43100 5 10 1 1 0 0 1
netname=[ru_on rd_on]
}
N 60200 43100 61400 43100 4
{
T 60100 43100 5 10 1 1 0 0 1
netname=[up down]
}
N 53500 42300 53300 42300 4
{
T 53300 42300 5 10 1 1 0 0 1
netname=0
}
C 55300 42500 1 180 1 current-1.sym
{
T 55900 41500 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 55200 42600 5 10 1 1 0 0 1
refdes=A_delay
T 55400 41900 5 10 1 1 0 0 1
value=dly
}
N 56200 42300 56600 42300 4
{
T 56200 42300 5 10 1 1 0 0 1
netname=[ddly]
}
N 54400 42300 54700 42300 4
{
T 54400 42300 5 10 1 1 0 0 1
netname=dly
}
C 54400 42500 1 180 0 voltage-3.sym
{
T 54200 41800 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 53400 42600 5 10 1 1 0 0 1
refdes=V_delay
T 52800 41900 5 10 1 1 0 0 1
value=DC=0V pulse(0 1 1f 0 0 1Meg)
}
T 53200 42900 9 10 1 0 0 0 6
This is a bit of a hack. ngspice's DC solution
for two IBIS buffers connected by a txl or cpl
transmission line causes noise in the transient
for about 150ns. This problem does not
occur if the buffers are off at t=0. The below
causes the buffer to start out tristated.
N 55000 42300 55300 42300 4
{
T 55000 42300 5 10 1 1 0 0 1
netname=[dly]
}

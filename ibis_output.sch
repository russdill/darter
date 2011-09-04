v 20110115 2
N 56300 38800 57800 38800 4
{
T 59800 38800 5 10 1 1 0 0 1
netname=pad
}
C 56500 39000 1 90 0 current-1.sym
{
T 55500 39600 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 56400 39700 5 10 1 1 0 0 1
refdes=B_pu
T 52700 39200 5 10 1 1 0 0 4
value=I=V(Kpu)*modv(
+	pwl(V(Vdd, pad) $pullup0_typ),
+	pwl(V(Vdd, pad) $pullup0_min),
+	pwl(V(Vdd, pad) $pullup0_max))
}
C 56100 38600 1 270 0 current-1.sym
{
T 57100 38000 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 56400 38400 5 10 1 1 0 0 1
refdes=B_pd
T 52700 37800 5 10 1 1 0 0 4
value=I=V(Kpd)*modv(
+	pwl(V(pad, Vss) $pulldown0_typ),
+	pwl(V(pad, Vss) $pulldown0_min),
+	pwl(V(pad, Vss) $pulldown0_max))
}
C 56500 37500 1 180 0 vss-1.sym
C 56100 40100 1 0 0 vdd-1.sym
N 56300 39000 56300 38600 4
N 56300 39900 56300 40100 4
N 56300 37500 56300 37700 4
B 52400 36600 8100 4300 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
T 52400 41000 9 10 1 0 0 0 1
IBIS Gate Model
T 52400 45900 8 10 1 0 0 0 1
use-license=GPL2+
T 52406 46100 8 10 1 0 0 0 1
dist-license=GPL2+
T 52406 46300 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 64400 42900 1 270 0 voltage-3.sym
{
T 65100 42700 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 64800 42600 5 10 1 1 0 0 1
refdes=B_Kpd
T 60800 41800 5 10 1 1 0 0 8
value=V=V(down) > 0 ? modv(
+	pwl(V(rd_time) $rising_kpd0_typ),
+	pwl(V(rd_time) $rising_kpd0_min),
+	pwl(V(rd_time) $rising_kpd0_max)) :
+modv(
+	pwl(V(fd_time) $falling_kpd0_typ),
+	pwl(V(fd_time) $falling_kpd0_min),
+	pwl(V(fd_time) $falling_kpd0_max))
}
C 64400 45000 1 270 0 voltage-3.sym
{
T 65100 44800 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 64800 44700 5 10 1 1 0 0 1
refdes=B_Kpu
T 60800 43800 5 10 1 1 0 0 8
value=V=V(up) > 0 ? modv(
+	pwl(V(ru_time) $rising_kpu0_typ),
+	pwl(V(ru_time) $rising_kpu0_min),
+	pwl(V(ru_time) $rising_kpu0_max)) :
+modv(
+	pwl(V(fu_time) $falling_kpu0_typ),
+	pwl(V(fu_time) $falling_kpu0_min),
+	pwl(V(fu_time) $falling_kpu0_max))
}
C 64500 43800 1 0 0 gnd-1.sym
C 64500 41700 1 0 0 gnd-1.sym
N 64600 42900 65000 42900 4
{
T 64600 42900 5 10 1 1 0 0 1
netname=Kpd
}
N 64600 45000 65000 45000 4
{
T 64600 45000 5 10 1 1 0 0 1
netname=Kpu
}
C 58100 45300 1 180 1 current-1.sym
{
T 58700 44300 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 57900 45300 5 10 1 1 0 0 1
refdes=A_ru_on
T 57900 44800 5 10 1 1 0 0 1
value=and
}
N 58100 45100 57000 45100 4
{
T 57000 45100 5 10 1 1 0 0 1
netname=[en ddly out]
}
N 59000 45100 60200 45100 4
{
T 59000 45100 5 10 1 1 0 0 1
netname=ru_on
}
C 58100 44500 1 180 1 current-1.sym
{
T 58700 43500 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 57900 44500 5 10 1 1 0 0 1
refdes=A_rd_on
T 57900 44000 5 10 1 1 0 0 1
value=nand
}
N 58100 44300 57000 44300 4
{
T 57000 44300 5 10 1 1 0 0 1
netname=[en ddly ~out]
}
N 59000 44300 60200 44300 4
{
T 59000 44300 5 10 1 1 0 0 1
netname=rd_on
}
C 58100 43700 1 180 1 current-1.sym
{
T 58700 42700 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 57900 43700 5 10 1 1 0 0 1
refdes=A_rtime
T 57900 43200 5 10 1 1 0 0 1
value=rtime
}
N 57000 43500 58100 43500 4
{
T 57000 43500 5 10 1 1 0 0 1
netname=[ru_on rd_on]
}
N 59000 43500 60200 43500 4
{
T 58900 43500 5 10 1 1 0 0 1
netname=[ru_time rd_time]
}
C 58100 42900 1 180 1 current-1.sym
{
T 58700 41900 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 57900 42900 5 10 1 1 0 0 1
refdes=A_dtime
T 57900 42400 5 10 1 1 0 0 1
value=ftime
}
N 57000 42700 58100 42700 4
{
T 57000 42700 5 10 1 1 0 0 1
netname=[~ru_on ~rd_on]
}
N 59000 42700 60200 42700 4
{
T 58900 42700 5 10 1 1 0 0 1
netname=[fu_time fd_time]
}
C 52600 44900 1 0 0 spice-directive-1.sym
{
T 52700 45200 5 10 0 1 0 0 1
device=directive
T 52600 45200 5 10 1 1 180 6 19
value=.model dac dac_bridge(t_rise=0 t_fall=0)
.model dly adc_bridge(in_low=0 in_high=1 rise_delay=1f)

.param rising_kpu_max10={rising_kpu_max / 10}
.model rtime dac_bridge(out_low=0
+	out_high={rising_kpu_max}
+	t_rise={rising_kpu_max}
+	t_fall={rising_kpu_max10})

.param falling_kpd_max10={falling_kpd_max / 10}
.model ftime dac_bridge(out_low=0
+	out_high={falling_kpd_max}
+	t_rise={falling_kpd_max}
+	t_fall={falling_kpd_max10})

.model and d_and(input_load=0
+	rise_delay=1f fall_delay=1f)
.model nand d_nand(input_load=0
+	rise_delay=1f fall_delay=1f)
T 52700 45300 5 10 1 1 0 0 1
refdes=_dac
}
C 58100 42100 1 180 1 current-1.sym
{
T 58700 41100 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 57900 42100 5 10 1 1 0 0 1
refdes=A_sel
T 57900 41600 5 10 1 1 0 0 1
value=dac
}
N 57000 41900 58100 41900 4
{
T 57000 41900 5 10 1 1 0 0 1
netname=[ru_on rd_on]
}
N 59000 41900 60200 41900 4
{
T 58900 41900 5 10 1 1 0 0 1
netname=[up down]
}
B 52400 41300 13400 4300 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
T 52400 45700 9 10 1 0 0 0 1
Control Logic
C 58000 37500 1 180 0 vss-1.sym
C 58000 39000 1 90 0 capacitor-1.sym
{
T 57300 39200 5 10 0 0 90 0 1
device=CAPACITOR
T 57900 39600 5 10 1 1 0 0 1
refdes=C_comp_pu
T 57100 39200 5 10 0 0 90 0 1
symversion=0.1
T 57900 39200 5 10 1 1 0 0 1
value={C_comp_pullup}
}
C 58000 37700 1 90 0 capacitor-1.sym
{
T 57300 37900 5 10 0 0 90 0 1
device=CAPACITOR
T 57900 38300 5 10 1 1 0 0 1
refdes=C_comp_pd
T 57100 37900 5 10 0 0 90 0 1
symversion=0.1
T 57900 37900 5 10 1 1 0 0 1
value={C_comp_pulldown}
}
C 57600 40100 1 0 0 vdd-1.sym
N 57800 39000 57800 38600 4
N 57800 40100 57800 39900 4
N 57800 37500 57800 37700 4
N 57800 38800 60200 38800 4
C 65100 43200 1 0 0 gnd-1.sym
N 65300 43500 65200 43500 4
{
T 65200 43500 5 10 1 1 0 0 1
netname=0
}
C 63900 39000 1 180 1 current-1.sym
{
T 64500 38000 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 63800 39100 5 10 1 1 0 0 1
refdes=A_delay
T 64000 38400 5 10 1 1 0 0 1
value=dly
}
N 64800 38800 65200 38800 4
{
T 64800 38800 5 10 1 1 0 0 1
netname=[ddly]
}
N 63000 38800 63300 38800 4
{
T 63000 38800 5 10 1 1 0 0 1
netname=dly
}
C 63000 39000 1 180 0 voltage-3.sym
{
T 62800 38300 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 62000 39100 5 10 1 1 0 0 1
refdes=V_delay
T 61400 38400 5 10 1 1 0 0 1
value=DC=0V pulse(0 1 1f 0 0 1Meg)
}
C 61800 38900 1 270 0 gnd-1.sym
T 61800 39400 9 10 1 0 0 0 6
This is a bit of a hack. ngspice's DC solution
for two IBIS buffers connected by a txl or cpl
transmission line causes noise in the transient
for about 150ns. This problem does not
occur if the buffers are off at t=0. The below
causes the buffer to start out tristated.
N 63600 38800 63900 38800 4
{
T 63600 38800 5 10 1 1 0 0 1
netname=[dly]
}

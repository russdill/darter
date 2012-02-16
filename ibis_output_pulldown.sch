v 20110115 2
N 56300 38700 56900 38700 4
{
T 56400 38700 5 10 1 1 0 0 1
netname=pad
}
C 56100 38600 1 270 0 current-1.sym
{
T 57100 38000 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 52900 38500 5 10 1 1 0 0 1
refdes=B_pd
T 52900 37600 5 10 1 1 0 0 4
value=I=V(Kpd)*modv(
+	pwl(V(pad, Vss) $Pulldown_typ),
+	pwl(V(pad, Vss) $Pulldown_min),
+	pwl(V(pad, Vss) $Pulldown_max))
}
N 56300 38700 56300 38600 4
N 56300 37500 56300 37700 4
T 52900 41800 8 10 1 0 0 0 1
use-license=GPL2+
T 52906 42000 8 10 1 0 0 0 1
dist-license=GPL2+
T 52906 42200 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 56500 40300 1 270 0 voltage-3.sym
{
T 57200 40100 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 56900 40000 5 10 1 1 0 0 1
refdes=B_Kpd
T 52900 39200 5 10 1 1 0 0 8
value=V=V(down) > 0 ? modv(
+	pwl(V(rd_time) $Rising_kpd_typ),
+	pwl(V(rd_time) $Rising_kpd_min),
+	pwl(V(rd_time) $Rising_kpd_max)) :
+modv(
+	pwl(V(fd_time) $Falling_kpd_typ),
+	pwl(V(fd_time) $Falling_kpd_min),
+	pwl(V(fd_time) $Falling_kpd_max))
}
C 56600 39100 1 0 0 gnd-1.sym
N 56700 40300 57800 40300 4
{
T 56700 40300 5 10 1 1 0 0 1
netname=Kpd_raw
}
C 56500 37500 1 180 0 vss-1.sym
C 57100 37700 1 90 0 capacitor-1.sym
{
T 56400 37900 5 10 0 0 90 0 1
device=CAPACITOR
T 57000 38300 5 10 1 1 0 0 1
refdes=C_comp_pd
T 56200 37900 5 10 0 0 90 0 1
symversion=0.1
T 57000 37900 5 10 1 1 0 0 1
value={C_comp_pulldown}
}
N 56900 38700 56900 38600 4
N 56900 37600 56900 37700 4
C 56900 39100 1 0 0 gnd-1.sym
N 57100 39400 57000 39400 4
{
T 57000 39400 5 10 1 1 0 0 1
netname=0
}
C 57800 40500 1 180 1 current-1.sym
{
T 58400 39500 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 57600 40500 5 10 1 1 0 0 1
refdes=A_kpd_slew
T 57600 40000 5 10 1 1 0 0 1
value=kpd_slew
}
N 58700 40300 59100 40300 4
{
T 58700 40300 5 10 1 1 0 0 1
netname=Kpd
}
N 56900 37600 56300 37600 4
C 52900 41100 1 0 0 spice-directive-1.sym
{
T 53000 41400 5 10 0 1 0 0 1
device=directive
T 52900 41400 5 10 1 1 180 6 2
value=.model kpd_slew slew(rise_slope={kpd_da_max}
+	fall_slope={kpd_da_min})
T 53000 41500 5 10 1 1 0 0 1
refdes=kpd
}
T 57700 38900 9 10 1 0 0 0 4
The slew block is so that in the event a switching
occurs faster than the waveform cycle time, an
abrubt transition is prevented. Instead, it slews
at whatever the maximum slew rate of kpd is.
C 59600 44100 1 180 1 current-1.sym
{
T 60200 43100 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 59400 44100 5 10 1 1 0 0 1
refdes=A_rd_on
T 59400 43600 5 10 1 1 0 0 1
value=nand
}
N 59600 43900 58500 43900 4
{
T 58500 43900 5 10 1 1 0 0 1
netname=[en ddly ~out]
}
N 60500 43900 61700 43900 4
{
T 60500 43900 5 10 1 1 0 0 1
netname=rd_on
}
C 59600 43300 1 180 1 current-1.sym
{
T 60200 42300 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 59400 43300 5 10 1 1 0 0 1
refdes=A_rdtime
T 59400 42800 5 10 1 1 0 0 1
value=rtime
}
N 58500 43100 59600 43100 4
{
T 58500 43100 5 10 1 1 0 0 1
netname=[rd_on]
}
N 60500 43100 61700 43100 4
{
T 60400 43100 5 10 1 1 0 0 1
netname=[rd_time]
}
C 59600 42500 1 180 1 current-1.sym
{
T 60200 41500 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 59400 42500 5 10 1 1 0 0 1
refdes=A_fdtime
T 59400 42000 5 10 1 1 0 0 1
value=ftime
}
N 58500 42300 59600 42300 4
{
T 58500 42300 5 10 1 1 0 0 1
netname=[~rd_on]
}
N 60500 42300 61700 42300 4
{
T 60400 42300 5 10 1 1 0 0 1
netname=[fd_time]
}
C 59600 41700 1 180 1 current-1.sym
{
T 60200 40700 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 59400 41700 5 10 1 1 0 0 1
refdes=A_down
T 59400 41200 5 10 1 1 0 0 1
value=dac
}
N 58500 41500 59600 41500 4
{
T 58500 41500 5 10 1 1 0 0 1
netname=[rd_on]
}
N 60500 41500 61700 41500 4
{
T 60400 41500 5 10 1 1 0 0 1
netname=[down]
}

v 20110115 2
N 53100 40600 53700 40600 4
{
T 53300 40600 5 10 1 1 0 0 1
netname=pad
}
C 53300 40800 1 90 0 current-1.sym
{
T 52300 41400 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 49900 41500 5 10 1 1 0 0 1
refdes=B_pu
T 49900 40600 5 10 1 1 0 0 4
value=I=V(Kpu)*modv(
+	pwl(V(Vdd, pad) $Pullup_typ),
+	pwl(V(Vdd, pad) $Pullup_min),
+	pwl(V(Vdd, pad) $Pullup_max))
}
C 52900 41900 1 0 0 vdd-1.sym
N 53100 40800 53100 40600 4
N 53100 41700 53100 41900 4
C 53900 40800 1 90 0 capacitor-1.sym
{
T 53200 41000 5 10 0 0 90 0 1
device=CAPACITOR
T 53800 41400 5 10 1 1 0 0 1
refdes=C_comp_pu
T 53000 41000 5 10 0 0 90 0 1
symversion=0.1
T 53800 41000 5 10 1 1 0 0 1
value={C_comp_pullup}
}
N 53700 40800 53700 40600 4
N 53700 41800 53700 41700 4
N 53100 41800 53700 41800 4
C 53500 43700 1 270 0 voltage-3.sym
{
T 54200 43500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 53900 43400 5 10 1 1 0 0 1
refdes=B_Kpu
T 49900 42500 5 10 1 1 0 0 8
value=V=V(up) > 0 ? modv(
+	pwl(V(ru_time) $Rising_kpu_typ),
+	pwl(V(ru_time) $Rising_kpu_min),
+	pwl(V(ru_time) $Rising_kpu_max)) :
+modv(
+	pwl(V(fu_time) $Falling_kpu_typ),
+	pwl(V(fu_time) $Falling_kpu_min),
+	pwl(V(fu_time) $Falling_kpu_max))
}
C 53600 42500 1 0 0 gnd-1.sym
N 53700 43700 54800 43700 4
{
T 53700 43700 5 10 1 1 0 0 1
netname=Kpu_raw
}
C 54800 43900 1 180 1 current-1.sym
{
T 55400 42900 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 54600 43900 5 10 1 1 0 0 1
refdes=A_kpu_slew
T 54600 43400 5 10 1 1 0 0 1
value=kpu_slew
}
N 55700 43700 56100 43700 4
{
T 55700 43700 5 10 1 1 0 0 1
netname=Kpu
}
C 53900 42500 1 0 0 gnd-1.sym
N 54100 42800 54000 42800 4
{
T 54000 42800 5 10 1 1 0 0 1
netname=0
}
T 49900 45100 8 10 1 0 0 0 1
use-license=GPL2+
T 49906 45300 8 10 1 0 0 0 1
dist-license=GPL2+
T 49906 45500 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 49900 44400 1 0 0 spice-directive-1.sym
{
T 50000 44700 5 10 0 1 0 0 1
device=directive
T 49900 44700 5 10 1 1 180 6 2
value=.model kpu_slew slew(rise_slope={kpu_da_max}
+	fall_slope={kpu_da_min})
T 50000 44800 5 10 1 1 0 0 1
refdes=kpu
}
C 58500 46400 1 180 1 current-1.sym
{
T 59100 45400 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 58300 46400 5 10 1 1 0 0 1
refdes=A_ru_on
T 58300 45900 5 10 1 1 0 0 1
value=and
}
N 58500 46200 57400 46200 4
{
T 57400 46200 5 10 1 1 0 0 1
netname=[en ddly out]
}
N 59400 46200 60600 46200 4
{
T 59400 46200 5 10 1 1 0 0 1
netname=ru_on
}
C 58500 45600 1 180 1 current-1.sym
{
T 59100 44600 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 58300 45600 5 10 1 1 0 0 1
refdes=A_rutime
T 58300 45100 5 10 1 1 0 0 1
value=rtime
}
N 57400 45400 58500 45400 4
{
T 57400 45400 5 10 1 1 0 0 1
netname=[ru_on]
}
N 59400 45400 60600 45400 4
{
T 59300 45400 5 10 1 1 0 0 1
netname=[ru_time]
}
C 58500 44800 1 180 1 current-1.sym
{
T 59100 43800 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 58300 44800 5 10 1 1 0 0 1
refdes=A_futime
T 58300 44300 5 10 1 1 0 0 1
value=ftime
}
N 57400 44600 58500 44600 4
{
T 57400 44600 5 10 1 1 0 0 1
netname=[~ru_on]
}
N 59400 44600 60600 44600 4
{
T 59300 44600 5 10 1 1 0 0 1
netname=[fu_time]
}
C 58500 44000 1 180 1 current-1.sym
{
T 59100 43000 5 10 0 0 180 6 1
device=CURRENT_SOURCE
T 58300 44000 5 10 1 1 0 0 1
refdes=A_up
T 58300 43500 5 10 1 1 0 0 1
value=dac
}
N 57400 43800 58500 43800 4
{
T 57400 43800 5 10 1 1 0 0 1
netname=[ru_on]
}
N 59400 43800 60600 43800 4
{
T 59300 43800 5 10 1 1 0 0 1
netname=[up]
}

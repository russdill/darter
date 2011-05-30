v 20110115 2
B 35200 33700 21900 6100 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
L 43300 39600 43300 33800 3 0 0 2 150 150
C 40800 40500 1 0 0 gnd-1.sym
N 40700 40800 40900 40800 4
{
T 40700 40800 5 10 1 1 0 0 1
netname=0
}
C 35200 42800 1 0 0 spice-directive-1.sym
{
T 35300 43100 5 10 0 1 0 0 1
device=directive
T 35300 43200 5 10 1 1 0 0 1
refdes=Atime
T 35200 42900 5 10 1 1 0 0 1
value=.MODEL time slew(rise_slope=1 fall_slope=10)
}
C 35200 42100 1 0 0 spice-directive-1.sym
{
T 35300 42400 5 10 0 1 0 0 1
device=directive
T 35300 42500 5 10 1 1 0 0 1
refdes=Apc
T 35200 41800 5 10 1 1 0 0 3
value=.PARAM c_comp_tot={C_comp +
+     C_comp_pullup + C_comp_pulldown +
+     C_comp_power_clamp + C_comp_gnd_clamp}
}
C 35200 41000 1 0 0 spice-directive-1.sym
{
T 35300 41300 5 10 0 1 0 0 1
device=directive
T 35300 41400 5 10 1 1 0 0 1
refdes=Amc0
T 35200 40800 5 10 1 1 0 0 2
value=.MODEL comp0 d_dt(gain={C_comp_tot+C_fixture0}
+    out_lower_limit=-1e12 out_upper_limit=1e12)
}
C 36500 37500 1 0 0 gnd-1.sym
C 36300 35000 1 0 0 vdc-1.sym
{
T 35800 35950 5 10 1 1 0 0 1
refdes=B_fu_on
T 37000 35850 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 37000 36050 5 10 0 0 0 0 1
footprint=none
T 35700 34500 5 10 1 1 0 0 1
value=V=V(out) > 0 ? 0 : {falling_waveform_max}
}
N 44600 37500 45300 37500 4
{
T 44600 37500 5 10 1 1 0 0 1
netname=fixture0
}
C 36500 34700 1 0 0 gnd-1.sym
C 36300 37800 1 0 0 vdc-1.sym
{
T 35800 38750 5 10 1 1 0 0 1
refdes=B_ru_on
T 37000 38650 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 37000 38850 5 10 0 0 0 0 1
footprint=none
T 35800 37250 5 10 1 1 0 0 1
value=V=V(out) > 0 ? {rising_waveform_max} : 0
}
N 52400 42300 53600 42300 4
{
T 53200 42400 5 10 1 1 0 0 1
netname=pad
}
C 52200 42100 1 270 0 current-1.sym
{
T 53200 41500 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 52500 41900 5 10 1 1 0 0 1
refdes=B_pd
T 52500 41300 5 10 1 1 0 0 1
value=I=V(Ipd)*V(Kpd)
}
C 52600 41000 1 180 0 vss-1.sym
N 52400 42300 52400 42100 4
N 52400 41000 52400 41200 4
C 46400 37400 1 0 0 resistor-1.sym
{
T 46700 37800 5 10 0 0 0 0 1
device=RESISTOR
T 46400 37700 5 10 1 1 0 0 1
refdes=R_fixture0
T 46300 37200 5 10 1 1 0 0 1
value={R_fixture0}
}
C 47300 37300 1 270 0 voltage-3.sym
{
T 48000 37100 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 47600 37100 5 10 1 1 0 0 1
refdes=V_fixture0
T 47600 36500 5 10 1 1 0 0 1
value=DC {V_fixture0}
}
N 47300 37500 47500 37500 4
{
T 47300 37500 5 10 1 1 0 0 1
netname=f0b
}
N 47500 37500 47500 37300 4
C 47400 36100 1 0 0 gnd-1.sym
C 44500 36100 1 0 0 gnd-1.sym
B 43300 40000 11100 4300 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
C 45500 41300 1 270 0 voltage-3.sym
{
T 46200 41100 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 45100 41100 5 10 1 1 0 0 1
refdes=B_Kpd
T 43700 41500 5 10 1 1 0 0 1
value=V=(I(Vfx0) - V(Icomp0) + V(Ipc0) + V(Igc0)) / V(I2)
}
C 45600 40100 1 0 0 gnd-1.sym
N 45700 41300 46100 41300 4
{
T 45700 41300 5 10 1 1 0 0 1
netname=Kpd
}
C 46200 37700 1 180 0 current-1.sym
{
T 45600 36700 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 45200 37700 5 10 1 1 0 0 1
refdes=Vfx0
T 45200 37200 5 10 1 1 0 0 1
value=DC 0
}
N 44600 37300 44600 37500 4
N 46200 37500 46400 37500 4
{
T 46200 37500 5 10 1 1 0 0 1
netname=f0a
}
C 38600 38700 1 90 0 vexp-1.sym
{
T 38300 39250 5 10 1 1 0 0 1
refdes=A_ru_time
T 37750 39400 5 10 0 0 90 0 1
device=vexp
T 37550 39400 5 10 0 0 90 0 1
footprint=none
T 38300 38750 5 10 1 1 0 0 1
value=time
}
N 38600 39000 40300 39000 4
{
T 39000 39000 5 10 1 1 0 0 1
netname=ru_time
}
C 38700 35900 1 90 0 vexp-1.sym
{
T 38400 36450 5 10 1 1 0 0 1
refdes=A_fu_time
T 37850 36600 5 10 0 0 90 0 1
device=vexp
T 37650 36600 5 10 0 0 90 0 1
footprint=none
T 38400 35850 5 10 1 1 0 0 1
value=time
}
N 40300 36200 38700 36200 4
{
T 39000 36200 5 10 1 1 0 0 1
netname=fu_time
}
N 36600 39000 37400 39000 4
{
T 36600 39000 5 10 1 1 0 0 1
netname=ru_on
}
N 36600 36200 37500 36200 4
{
T 36600 36200 5 10 1 1 0 0 1
netname=fu_on
}
C 48400 41300 1 270 0 voltage-3.sym
{
T 49100 41100 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 48900 40800 5 10 1 1 0 0 1
refdes=B_pulldown
T 48900 40600 5 10 1 1 0 0 1
value=V=pwl(V(pad, Vss) $pulldown0)
}
C 48500 40100 1 0 0 gnd-1.sym
N 48600 41300 49200 41300 4
{
T 48800 41300 5 10 1 1 0 0 1
netname=Ipd
}
N 51300 36500 50700 36500 4
{
T 50700 36500 5 10 1 1 0 0 1
netname=I2
}
N 51300 35700 50700 35700 4
{
T 50700 35700 5 10 1 1 0 0 1
netname=Igc0
}
C 44400 37300 1 270 0 voltage-3.sym
{
T 45100 37100 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 44700 37100 5 10 1 1 0 0 1
refdes=B0
T 44300 35500 5 10 1 1 0 0 3
value=V=V(ru_on) > 0 ? 
+    pwl(V(ru_time) $rising_waveform0) :
+    pwl(V(fu_time) $falling_waveform0)
}
C 51700 34400 1 90 0 vexp-1.sym
{
T 49900 35050 5 10 1 1 0 0 1
refdes=A_comp0
T 50850 35100 5 10 0 0 90 0 1
device=vexp
T 50650 35100 5 10 0 0 90 0 1
footprint=none
T 51500 35050 5 10 1 1 0 0 1
value=comp0
}
N 51700 34700 52400 34700 4
{
T 51700 34700 5 10 1 1 0 0 1
netname=Icomp0
}
C 50700 37100 1 0 1 voltage-3.sym
{
T 50500 37800 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 49700 37600 5 10 1 1 0 0 1
refdes=B_power_clamp0
T 51500 37600 5 10 1 1 0 0 1
value=V=pwl({power_clamp_reference} - V(fixture0) $power_clamp0)
}
C 49700 37000 1 0 0 gnd-1.sym
N 51300 37300 50700 37300 4
{
T 50700 37300 5 10 1 1 0 0 1
netname=Ipc0
}
C 50700 36300 1 0 1 voltage-3.sym
{
T 50500 37000 5 8 0 0 0 6 1
device=VOLTAGE_SOURCE
T 49700 36800 5 10 1 1 0 0 1
refdes=B_pulldown0
T 51500 36800 5 10 1 1 0 0 1
value=V=pwl(V(fixture0) - {pulldown_reference} $pulldown0)
}
C 49700 36200 1 0 0 gnd-1.sym
C 50700 35900 1 180 0 voltage-3.sym
{
T 50500 35200 5 8 0 0 180 0 1
device=VOLTAGE_SOURCE
T 49700 36000 5 10 1 1 0 0 1
refdes=B_gnd_clamp0
T 51500 36000 5 10 1 1 0 0 1
value=V=pwl(V(fixture0) - {gnd_clamp_reference} $gnd_clamp0)
}
C 49700 35400 1 0 0 gnd-1.sym
N 49800 34700 50500 34700 4
{
T 49600 34700 5 10 1 1 0 0 1
netname=fixture0
}
T 35200 39900 9 10 1 0 0 0 1
Models for fixture
T 35200 43800 8 10 1 0 0 0 1
dist-license=GPLv3
T 35206 44000 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
T 43400 39500 9 10 1 0 0 0 1
Fixture 0
T 43300 44400 9 10 1 0 0 0 1
IBIS Gate Model

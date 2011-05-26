v 20110115 2
C 40000 40000 1 90 0 vexp-1.sym
{
T 39700 40550 5 10 1 1 0 0 1
refdes=A_r_time
T 39150 40700 5 10 0 0 90 0 1
device=vexp
T 38950 40700 5 10 0 0 90 0 1
footprint=none
T 39700 40050 5 10 1 1 0 0 1
value=time
}
N 40000 40300 41700 40300 4
{
T 40500 40300 5 10 1 1 0 0 1
netname=r_time
}
C 36800 44600 1 0 0 spice-directive-1.sym
{
T 36900 44900 5 10 0 1 0 0 1
device=directive
T 36900 45000 5 10 1 1 0 0 1
refdes=Atime
T 36800 44700 5 10 1 1 0 0 1
value=.MODEL time slew(rise_slope=1 fall_slope=10)
}
C 37900 38800 1 0 0 gnd-1.sym
C 37700 36300 1 0 0 vdc-1.sym
{
T 37200 37250 5 10 1 1 0 0 1
refdes=B_f_on
T 38400 37150 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 38400 37350 5 10 0 0 0 0 1
footprint=none
T 37100 35800 5 10 1 1 0 0 1
value=V=V(out) > 0 ? 0 : {falling_waveform_max}
}
C 40100 37200 1 90 0 vexp-1.sym
{
T 39800 37750 5 10 1 1 0 0 1
refdes=A_f_time
T 39250 37900 5 10 0 0 90 0 1
device=vexp
T 39050 37900 5 10 0 0 90 0 1
footprint=none
T 39800 37150 5 10 1 1 0 0 1
value=time
}
N 41700 37500 40100 37500 4
{
T 40500 37500 5 10 1 1 0 0 1
netname=f_time
}
N 46000 38800 46700 38800 4
{
T 46000 38800 5 10 1 1 0 0 1
netname=fixture0
}
C 37900 36000 1 0 0 gnd-1.sym
C 37700 39100 1 0 0 vdc-1.sym
{
T 37200 40050 5 10 1 1 0 0 1
refdes=B_r_on
T 38400 39950 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 38400 40150 5 10 0 0 0 0 1
footprint=none
T 37200 38550 5 10 1 1 0 0 1
value=V=V(out) > 0 ? {rising_waveform_max} : 0
}
N 52800 43300 54000 43300 4
{
T 53600 43400 5 10 1 1 0 0 1
netname=pad
}
C 53000 43500 1 90 0 current-1.sym
{
T 52000 44100 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 52900 44200 5 10 1 1 0 0 1
refdes=B_pu
T 52900 43600 5 10 1 1 0 0 1
value=I=V(Ipu)*V(Kpu)
}
C 52600 43100 1 270 0 current-1.sym
{
T 53600 42500 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 52900 42900 5 10 1 1 0 0 1
refdes=B_pd
T 52900 42300 5 10 1 1 0 0 1
value=I=V(Ipd)*V(Kpd)
}
C 53000 42000 1 180 0 vss-1.sym
C 52600 44600 1 0 0 vdd-1.sym
N 52800 43500 52800 43100 4
N 52800 44400 52800 44600 4
N 52800 42000 52800 42200 4
N 41700 39000 41300 39000 4
N 41300 39000 41300 40300 4
N 41700 36200 41300 36200 4
N 41300 36200 41300 37500 4
C 47800 38700 1 0 0 resistor-1.sym
{
T 48100 39100 5 10 0 0 0 0 1
device=RESISTOR
T 47800 39000 5 10 1 1 0 0 1
refdes=R_fixture0
T 47700 38500 5 10 1 1 0 0 1
value={R_fixture0}
}
C 48700 38600 1 270 0 voltage-3.sym
{
T 49400 38400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 49000 38400 5 10 1 1 0 0 1
refdes=V_fixture0
T 49000 37800 5 10 1 1 0 0 1
value=DC {V_fixture0}
}
N 48700 38800 48900 38800 4
{
T 48700 38800 5 10 1 1 0 0 1
netname=f0b
}
N 48900 38800 48900 38600 4
C 48800 37400 1 0 0 gnd-1.sym
C 45900 37400 1 0 0 gnd-1.sym
N 42900 40300 43500 40300 4
{
T 43100 40300 5 10 1 1 0 0 1
netname=vr0
}
N 42900 37500 43500 37500 4
{
T 43100 37500 5 10 1 1 0 0 1
netname=vf0
}
N 42900 36200 43500 36200 4
{
T 43100 36200 5 10 1 1 0 0 1
netname=vf1
}
N 42900 39000 43500 39000 4
{
T 43100 39000 5 10 1 1 0 0 1
netname=vr1
}
N 53100 36700 52900 36700 4
{
T 52900 36700 5 10 1 1 0 0 1
netname=I2
}
B 36800 34700 36000 6200 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
B 49300 41300 5500 4000 3 0 0 2 200 200 0 -1 -1 -1 -1 -1
L 44900 40700 44900 34900 3 0 0 2 150 150
L 58900 40700 58900 34900 3 0 0 2 150 150
T 45100 40600 9 10 1 0 0 0 1
Fixture 0
T 59000 40600 9 10 1 0 0 0 1
Fixture 1
T 49300 45400 9 10 1 0 0 0 1
IBIS Gate Model
T 36800 45400 8 10 1 0 0 0 1
dist-license=GPLv3
T 36806 45600 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
N 38000 40300 38800 40300 4
{
T 38000 40300 5 10 1 1 0 0 1
netname=ru_on
}
N 38000 37500 38900 37500 4
{
T 38000 37500 5 10 1 1 0 0 1
netname=fu_on
}
C 42800 41500 1 0 0 gnd-1.sym
N 42700 41800 42900 41800 4
{
T 42700 41800 5 10 1 1 0 0 1
netname=0
}
C 45900 42300 1 270 0 voltage-3.sym
{
T 46600 42100 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 45500 42100 5 10 1 1 0 0 1
refdes=B_Kpd
T 44100 42500 5 10 1 1 0 0 3
value=V=((I(Vfx0) - V(Icomp0) + V(Ipc0) + V(Igc0)) * V(I4) +
+      (I(Vfx1) - V(Icomp1) + V(Ipc0) + V(Igc0)) * V(I3)) /
+   (V(I2) * V(I4) - V(I1) * V(I3))
}
C 45900 44400 1 270 0 voltage-3.sym
{
T 46600 44200 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 45500 44200 5 10 1 1 0 0 1
refdes=B_Kpu
T 44200 44600 5 10 1 1 0 0 3
value=V=((I(Vfx0) - V(Icomp0) + V(Ipc0) + V(Igc0)) * V(I1) + 
+      (I(Vfx1) - V(Icomp1) + V(Ipc1) + V(Igc1)) * V(I2)) /
+    (V(I2) * V(I4) - V(I1) * V(I3))
}
C 46000 43200 1 0 0 gnd-1.sym
C 46000 41100 1 0 0 gnd-1.sym
N 46100 42300 46500 42300 4
{
T 46100 42300 5 10 1 1 0 0 1
netname=Kpd
}
N 46100 44400 46500 44400 4
{
T 46100 44400 5 10 1 1 0 0 1
netname=Kpu
}
N 56900 36700 56300 36700 4
{
T 56300 36700 5 10 1 1 0 0 1
netname=Igc0
}
C 45800 38600 1 270 0 voltage-3.sym
{
T 46500 38400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 46100 38400 5 10 1 1 0 0 1
refdes=B0
T 46200 37800 5 10 1 1 0 0 1
value=V=V(r_on) > 0  ? V(vr0) : V(vf0)
}
C 47600 39000 1 180 0 current-1.sym
{
T 47000 38000 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 46600 39000 5 10 1 1 0 0 1
refdes=Vfx0
T 46600 38500 5 10 1 1 0 0 1
value=DC 0
}
N 46000 38600 46000 38800 4
C 36800 43900 1 0 0 spice-directive-1.sym
{
T 36900 44200 5 10 0 1 0 0 1
device=directive
T 36900 44300 5 10 1 1 0 0 1
refdes=Apc
T 36800 43600 5 10 1 1 0 0 3
value=.PARAM c_comp_tot={C_comp +
+     C_comp_pullup + C_comp_pulldown +
+     C_comp_power_clamp + C_comp_gnd_clamp}
}
C 48200 35800 1 90 0 vexp-1.sym
{
T 47800 36450 5 10 1 1 0 0 1
refdes=A_comp0
T 47350 36500 5 10 0 0 90 0 1
device=vexp
T 47150 36500 5 10 0 0 90 0 1
footprint=none
T 47900 35850 5 10 1 1 0 0 1
value=comp0
}
N 48200 36100 48900 36100 4
{
T 48200 36100 5 10 1 1 0 0 1
netname=Icomp0
}
C 36800 42800 1 0 0 spice-directive-1.sym
{
T 36900 43100 5 10 0 1 0 0 1
device=directive
T 36900 43200 5 10 1 1 0 0 1
refdes=Amc0
T 36800 42600 5 10 1 1 0 0 2
value=.MODEL comp0 d_dt(gain={C_comp_tot+C_fixture0}
+    out_lower_limit=-1e12 out_upper_limit=1e12)
}
C 36800 41900 1 0 0 spice-directive-1.sym
{
T 36900 42200 5 10 0 1 0 0 1
device=directive
T 36900 42300 5 10 1 1 0 0 1
refdes=Amc1
T 36800 41700 5 10 1 1 0 0 2
value=.MODEL comp1 d_dt(gain={C_comp_tot+C_fixture1}
+    out_lower_limit=-1e12 out_upper_limit=1e12)
}
N 47600 38800 47800 38800 4
{
T 47600 38800 5 10 1 1 0 0 1
netname=f0a
}
C 42900 40000 1 90 0 vexp-1.sym
{
T 42600 40550 5 10 1 1 0 0 1
refdes=A_r0
T 42050 40700 5 10 0 0 90 0 1
device=vexp
T 41850 40700 5 10 0 0 90 0 1
footprint=none
T 41700 39850 5 10 1 1 0 0 1
value=rising_waveform0
}
C 42900 38700 1 90 0 vexp-1.sym
{
T 42600 39250 5 10 1 1 0 0 1
refdes=A_r1
T 42050 39400 5 10 0 0 90 0 1
device=vexp
T 41850 39400 5 10 0 0 90 0 1
footprint=none
T 41700 38550 5 10 1 1 0 0 1
value=rising_waveform1
}
C 42900 37200 1 90 0 vexp-1.sym
{
T 42600 37750 5 10 1 1 0 0 1
refdes=A_f0
T 42050 37900 5 10 0 0 90 0 1
device=vexp
T 41850 37900 5 10 0 0 90 0 1
footprint=none
T 41700 37050 5 10 1 1 0 0 1
value=falling_waveform0
}
C 42900 35900 1 90 0 vexp-1.sym
{
T 42600 36450 5 10 1 1 0 0 1
refdes=A_f1
T 42050 36600 5 10 0 0 90 0 1
device=vexp
T 41850 36600 5 10 0 0 90 0 1
footprint=none
T 41700 35750 5 10 1 1 0 0 1
value=falling_waveform1
}
C 50900 39600 1 270 0 voltage-3.sym
{
T 51600 39400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 51400 39100 5 10 1 1 0 0 1
refdes=B_vpu0
T 51400 38900 5 10 1 1 0 0 1
value=V={pullup_reference} - V(fixture0)
}
C 51000 38400 1 0 0 gnd-1.sym
N 51100 39600 51700 39600 4
{
T 51100 39600 5 10 1 1 0 0 1
netname=vpu0
}
C 52900 39300 1 90 0 vexp-1.sym
{
T 52600 39850 5 10 1 1 0 0 1
refdes=A_pullup0
T 52050 40000 5 10 0 0 90 0 1
device=vexp
T 51850 40000 5 10 0 0 90 0 1
footprint=none
T 52600 39350 5 10 1 1 0 0 1
value=pullup0
}
N 52900 39600 53100 39600 4
{
T 52900 39600 5 10 1 1 0 0 1
netname=I3
}
C 54300 39600 1 270 0 voltage-3.sym
{
T 55000 39400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 54800 39100 5 10 1 1 0 0 1
refdes=B_vpc0
T 54800 38900 5 10 1 1 0 0 1
value=V={power_clamp_reference} - V(fixture0)
}
C 54400 38400 1 0 0 gnd-1.sym
C 56300 39300 1 90 0 vexp-1.sym
{
T 56000 39850 5 10 1 1 0 0 1
refdes=A_power_clamp0
T 55450 40000 5 10 0 0 90 0 1
device=vexp
T 55250 40000 5 10 0 0 90 0 1
footprint=none
T 56000 39350 5 10 1 1 0 0 1
value=power_clamp0
}
N 56900 39600 56300 39600 4
{
T 56300 39600 5 10 1 1 0 0 1
netname=Ipc0
}
C 50900 36700 1 270 0 voltage-3.sym
{
T 51600 36500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 51400 36200 5 10 1 1 0 0 1
refdes=B_vpd0
T 51400 36000 5 10 1 1 0 0 1
value=V=V(fixture0) - {pulldown_reference}
}
C 51000 35500 1 0 0 gnd-1.sym
C 52900 36400 1 90 0 vexp-1.sym
{
T 52600 36950 5 10 1 1 0 0 1
refdes=A_pulldown0
T 52050 37100 5 10 0 0 90 0 1
device=vexp
T 51850 37100 5 10 0 0 90 0 1
footprint=none
T 52600 36450 5 10 1 1 0 0 1
value=pulldown0
}
C 54300 36700 1 270 0 voltage-3.sym
{
T 55000 36500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 54800 36200 5 10 1 1 0 0 1
refdes=B_vgc0
T 54800 36000 5 10 1 1 0 0 1
value=V=V(fixture0) - {gnd_clamp_reference}
}
C 54400 35500 1 0 0 gnd-1.sym
C 56300 36400 1 90 0 vexp-1.sym
{
T 56000 36950 5 10 1 1 0 0 1
refdes=A_gnd_clamp0
T 55450 37100 5 10 0 0 90 0 1
device=vexp
T 55250 37100 5 10 0 0 90 0 1
footprint=none
T 56000 36450 5 10 1 1 0 0 1
value=gnd_clamp0
}
N 46300 36100 47000 36100 4
{
T 46300 36100 5 10 1 1 0 0 1
netname=fixture0
}
N 60000 38800 60700 38800 4
{
T 60000 38800 5 10 1 1 0 0 1
netname=fixture1
}
C 61800 38700 1 0 0 resistor-1.sym
{
T 62100 39100 5 10 0 0 0 0 1
device=RESISTOR
T 61800 39000 5 10 1 1 0 0 1
refdes=R_fixture1
T 61700 38500 5 10 1 1 0 0 1
value={R_fixture1}
}
C 62700 38600 1 270 0 voltage-3.sym
{
T 63400 38400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 63000 38400 5 10 1 1 0 0 1
refdes=V_fixture1
T 63000 37800 5 10 1 1 0 0 1
value=DC {V_fixture1}
}
N 62700 38800 62900 38800 4
{
T 62700 38800 5 10 1 1 0 0 1
netname=f1b
}
N 62900 38800 62900 38600 4
C 62800 37400 1 0 0 gnd-1.sym
C 59900 37400 1 0 0 gnd-1.sym
N 67100 36700 66900 36700 4
{
T 66900 36700 5 10 1 1 0 0 1
netname=I1
}
N 70900 36700 70300 36700 4
{
T 70300 36700 5 10 1 1 0 0 1
netname=Igc1
}
C 59800 38600 1 270 0 voltage-3.sym
{
T 60500 38400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 60100 38400 5 10 1 1 0 0 1
refdes=B1
T 60200 37800 5 10 1 1 0 0 1
value=V=V(r_on) > 0  ? V(vr1) : V(vf1)
}
C 61600 39000 1 180 0 current-1.sym
{
T 61000 38000 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 60600 39000 5 10 1 1 0 0 1
refdes=Vfx1
T 60600 38500 5 10 1 1 0 0 1
value=DC 0
}
N 60000 38600 60000 38800 4
C 62200 35800 1 90 0 vexp-1.sym
{
T 61800 36450 5 10 1 1 0 0 1
refdes=A_comp1
T 61350 36500 5 10 0 0 90 0 1
device=vexp
T 61150 36500 5 10 0 0 90 0 1
footprint=none
T 61900 35850 5 10 1 1 0 0 1
value=comp1
}
N 62200 36100 62900 36100 4
{
T 62200 36100 5 10 1 1 0 0 1
netname=Icomp1
}
N 61600 38800 61800 38800 4
{
T 61600 38800 5 10 1 1 0 0 1
netname=f1a
}
C 64900 39600 1 270 0 voltage-3.sym
{
T 65600 39400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 65400 39100 5 10 1 1 0 0 1
refdes=B_vpu1
T 65400 38900 5 10 1 1 0 0 1
value=V={pullup_reference} - V(fixture1)
}
C 65000 38400 1 0 0 gnd-1.sym
C 66900 39300 1 90 0 vexp-1.sym
{
T 66600 39850 5 10 1 1 0 0 1
refdes=A_pullup1
T 66050 40000 5 10 0 0 90 0 1
device=vexp
T 65850 40000 5 10 0 0 90 0 1
footprint=none
T 66600 39350 5 10 1 1 0 0 1
value=pullup0
}
N 66900 39600 67100 39600 4
{
T 66900 39600 5 10 1 1 0 0 1
netname=I4
}
C 68300 39600 1 270 0 voltage-3.sym
{
T 69000 39400 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 68800 39100 5 10 1 1 0 0 1
refdes=B_vpc1
T 68800 38900 5 10 1 1 0 0 1
value=V={power_clamp_reference} - V(fixture1)
}
C 68400 38400 1 0 0 gnd-1.sym
C 70300 39300 1 90 0 vexp-1.sym
{
T 70000 39850 5 10 1 1 0 0 1
refdes=A_power_clamp1
T 69450 40000 5 10 0 0 90 0 1
device=vexp
T 69250 40000 5 10 0 0 90 0 1
footprint=none
T 70000 39350 5 10 1 1 0 0 1
value=power_clamp0
}
N 70900 39600 70300 39600 4
{
T 70300 39600 5 10 1 1 0 0 1
netname=Ipc1
}
C 64900 36700 1 270 0 voltage-3.sym
{
T 65600 36500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 65400 36200 5 10 1 1 0 0 1
refdes=B_vpd1
T 65400 36000 5 10 1 1 0 0 1
value=V=V(fixture1) - {pulldown_reference}
}
C 65000 35500 1 0 0 gnd-1.sym
C 66900 36400 1 90 0 vexp-1.sym
{
T 66600 36950 5 10 1 1 0 0 1
refdes=A_pulldown1
T 66050 37100 5 10 0 0 90 0 1
device=vexp
T 65850 37100 5 10 0 0 90 0 1
footprint=none
T 66600 36450 5 10 1 1 0 0 1
value=pulldown0
}
C 68300 36700 1 270 0 voltage-3.sym
{
T 69000 36500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 68800 36200 5 10 1 1 0 0 1
refdes=B_vgc1
T 68800 36000 5 10 1 1 0 0 1
value=V=V(fixture1) - {gnd_clamp_reference}
}
C 68400 35500 1 0 0 gnd-1.sym
C 70300 36400 1 90 0 vexp-1.sym
{
T 70000 36950 5 10 1 1 0 0 1
refdes=A_gnd_clamp1
T 69450 37100 5 10 0 0 90 0 1
device=vexp
T 69250 37100 5 10 0 0 90 0 1
footprint=none
T 70000 36450 5 10 1 1 0 0 1
value=gnd_clamp0
}
N 60300 36100 61000 36100 4
{
T 60300 36100 5 10 1 1 0 0 1
netname=fixture1
}
C 49700 44500 1 270 0 voltage-3.sym
{
T 50400 44300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 50200 44000 5 10 1 1 0 0 1
refdes=B_vpu
T 50200 43800 5 10 1 1 0 0 1
value=V=V(Vdd) - V(pad)
}
C 49800 43300 1 0 0 gnd-1.sym
N 49900 44500 50500 44500 4
{
T 49900 44500 5 10 1 1 0 0 1
netname=vpu
}
C 51700 44200 1 90 0 vexp-1.sym
{
T 51400 44750 5 10 1 1 0 0 1
refdes=A_pullup
T 50850 44900 5 10 0 0 90 0 1
device=vexp
T 50650 44900 5 10 0 0 90 0 1
footprint=none
T 51400 44250 5 10 1 1 0 0 1
value=pullup0
}
N 51700 44500 52300 44500 4
{
T 51900 44500 5 10 1 1 0 0 1
netname=Ipu
}
C 49700 42700 1 270 0 voltage-3.sym
{
T 50400 42500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 50200 42200 5 10 1 1 0 0 1
refdes=B_vpd
T 50200 42000 5 10 1 1 0 0 1
value=V=V(pad) - V(Vss)
}
C 49800 41500 1 0 0 gnd-1.sym
N 49900 42700 50500 42700 4
{
T 49900 42700 5 10 1 1 0 0 1
netname=vpd
}
C 51700 42400 1 90 0 vexp-1.sym
{
T 51400 42950 5 10 1 1 0 0 1
refdes=A_pulldown
T 50850 43100 5 10 0 0 90 0 1
device=vexp
T 50650 43100 5 10 0 0 90 0 1
footprint=none
T 51400 42450 5 10 1 1 0 0 1
value=pulldown0
}
N 51700 42700 52300 42700 4
{
T 51900 42700 5 10 1 1 0 0 1
netname=Ipd
}
N 51100 36700 51700 36700 4
{
T 51100 36700 5 10 1 1 0 0 1
netname=vpd0
}
N 54500 39600 55100 39600 4
{
T 54500 39600 5 10 1 1 0 0 1
netname=vpc0
}
N 54500 36700 55100 36700 4
{
T 54500 36700 5 10 1 1 0 0 1
netname=vgc0
}
N 68500 39600 69100 39600 4
{
T 68500 39600 5 10 1 1 0 0 1
netname=vpc1
}
N 68500 36700 69100 36700 4
{
T 68500 36700 5 10 1 1 0 0 1
netname=vgc1
}
N 65100 36700 65700 36700 4
{
T 65100 36700 5 10 1 1 0 0 1
netname=vpd1
}
N 65100 39600 65700 39600 4
{
T 65100 39600 5 10 1 1 0 0 1
netname=vpu1
}

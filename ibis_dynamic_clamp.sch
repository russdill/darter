v 20110115 2
C 46400 39500 1 90 0 vexp-1.sym
{
T 44700 40150 5 10 1 1 0 0 1
refdes=A_trigger_r
T 45550 40200 5 10 0 0 90 0 1
device=vexp
T 45350 40200 5 10 0 0 90 0 1
footprint=none
T 46100 39550 5 10 1 1 0 0 1
value=time
}
N 46400 39800 47500 39800 4
C 44200 40900 1 0 0 spice-directive-1.sym
{
T 44300 41200 5 10 0 1 0 0 1
device=directive
T 44300 41300 5 10 1 1 0 0 1
refdes=A1
T 44200 41000 5 10 1 1 0 0 1
value=.MODEL time slew(rise_slope=1 fall_slope=10)
}
C 44300 38300 1 0 0 gnd-1.sym
C 44100 35300 1 0 0 vdc-1.sym
{
T 43400 36250 5 10 1 1 0 0 1
refdes=B_trigger_f
T 44800 36150 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 44800 36350 5 10 0 0 0 0 1
footprint=none
T 43600 34750 5 10 1 1 0 0 1
value=V=V(pad) < {V_trigger_f} ? {gnd_pulse_table_max} :0
}
C 46500 36200 1 90 0 vexp-1.sym
{
T 44700 36750 5 10 1 1 0 0 1
refdes=A_trigger_f
T 45650 36900 5 10 0 0 90 0 1
device=vexp
T 45450 36900 5 10 0 0 90 0 1
footprint=none
T 46200 36150 5 10 1 1 0 0 1
value=time
}
N 47500 36500 46500 36500 4
C 44300 35000 1 0 0 gnd-1.sym
C 44100 38600 1 0 0 vdc-1.sym
{
T 43300 39550 5 10 1 1 0 0 1
refdes=B_trigger_r
T 44800 39450 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 44800 39650 5 10 0 0 0 0 1
footprint=none
T 43600 38150 5 10 1 1 0 0 1
value=V=V(pad) > {V_trigger_r} ? {power_pulse_table_max} : 0
}
C 47500 35800 1 0 0 vcvs-1.sym
{
T 47700 36850 5 10 0 0 0 0 1
device=SPICE-vcvs
T 48000 35650 5 10 1 1 0 0 1
refdes=X_gpt
T 47700 37050 5 10 0 0 0 0 1
symversion=0.1
T 48200 36650 5 10 1 1 180 5 1
value=gnd_pulse_table0 spec={spec}
}
C 47400 38900 1 0 0 gnd-1.sym
C 47400 35600 1 0 0 gnd-1.sym
C 47500 39100 1 0 0 vcvs-1.sym
{
T 47700 40150 5 10 0 0 0 0 1
device=SPICE-vcvs
T 48000 38950 5 10 1 1 0 0 1
refdes=X_ppt
T 47700 40350 5 10 0 0 0 0 1
symversion=0.1
T 48300 39950 5 10 1 1 180 5 1
value=power_pulse_table0 spec={spec}
}
C 44300 37200 1 0 0 gnd-1.sym
N 44200 37500 44400 37500 4
{
T 44200 37500 5 10 1 1 0 0 1
netname=0
}
T 44200 41900 8 10 1 0 0 0 1
dist-license=GPLv3
T 44206 42100 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
N 44400 39800 45200 39800 4
N 44400 36500 45300 36500 4
C 49200 36500 1 180 0 vee-1.sym
C 48800 39200 1 0 0 vcc-1.sym
N 49000 35900 49900 35900 4
N 50100 39100 49900 39100 4
N 50100 37300 50100 38500 4
C 51700 36400 1 0 1 gnd-1.sym
C 50100 38400 1 0 0 vcvs-1.sym
{
T 50300 39450 5 10 0 0 0 0 1
device=SPICE-vcvs
T 50700 39250 5 10 1 1 0 0 1
refdes=X_pc
T 50300 39650 5 10 0 0 0 0 1
symversion=0.1
T 51200 39450 5 10 1 1 180 5 1
value=power_clamp0 spec={spec}
}
C 50100 36600 1 0 0 vcvs-1.sym
{
T 50300 37650 5 10 0 0 0 0 1
device=SPICE-vcvs
T 50600 36450 5 10 1 1 0 0 1
refdes=X_gc
T 50300 37850 5 10 0 0 0 0 1
symversion=0.1
T 51100 36250 5 10 1 1 180 5 1
value=gnd_clamp0 spec={spec}
}
C 51700 38200 1 0 1 gnd-1.sym
C 53400 38100 1 90 0 current-1.sym
{
T 52400 38700 5 10 0 0 90 0 1
device=CURRENT_SOURCE
T 53300 38800 5 10 1 1 0 0 1
refdes=B_pc
T 53300 38200 5 10 1 1 0 0 1
value=I=V(en) > 0 ? V(Ipc) : 0
}
C 53000 37700 1 270 0 current-1.sym
{
T 54000 37100 5 10 0 0 270 0 1
device=CURRENT_SOURCE
T 53300 37500 5 10 1 1 0 0 1
refdes=B_gc
T 53300 36900 5 10 1 1 0 0 1
value=I=V(en) > 0 ? V(Igc) : 0
}
N 53200 38100 53200 37700 4
N 53200 39000 53200 39200 4
N 53200 36600 53200 36800 4
C 53000 39200 1 0 0 vcc-1.sym
C 53400 36600 1 180 0 vee-1.sym
N 52200 39100 51600 39100 4
{
T 52000 39100 5 10 1 1 0 6 1
netname=Ipc
}
N 52200 37300 51600 37300 4
{
T 52000 37300 5 10 1 1 0 6 1
netname=Igc
}
N 49000 39800 49900 39800 4
N 49900 39800 49900 39100 4
N 50100 36700 49900 36700 4
N 49900 36700 49900 35900 4
N 53200 37900 50100 37900 4
N 50100 37900 54900 37900 4
{
T 54100 38000 5 10 1 1 0 0 1
netname=pad
}

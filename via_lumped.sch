v 20110115 2
C 44000 47500 1 0 0 inductor-1.sym
{
T 44200 48000 5 10 0 0 0 0 1
device=INDUCTOR
T 44200 47800 5 10 1 1 0 0 1
refdes=L
T 44200 48200 5 10 0 0 0 0 1
symversion=0.1
T 44500 47800 5 10 1 1 0 0 1
value={L} m={m}
}
C 45500 46700 1 90 0 capacitor-1.sym
{
T 44800 46900 5 10 0 0 90 0 1
device=CAPACITOR
T 45100 47200 5 10 1 1 0 6 1
refdes=C1
T 44600 46900 5 10 0 0 90 0 1
symversion=0.1
T 45100 46900 5 10 1 1 0 6 1
value={C/2} m={m}
}
N 44900 47600 45600 47600 4
N 44000 47600 43300 47600 4
T 42600 51000 8 10 1 0 0 0 1
use-license=GPL2+
T 42606 51200 8 10 1 0 0 0 1
dist-license=GPL2+
T 42600 51400 8 10 1 0 0 0 1
author=Russ Dill <Russ.Dill@asu.edu>
C 43800 46700 1 90 0 capacitor-1.sym
{
T 43100 46900 5 10 0 0 90 0 1
device=CAPACITOR
T 43400 47200 5 10 1 1 0 6 1
refdes=C0
T 42900 46900 5 10 0 0 90 0 1
symversion=0.1
T 43400 46900 5 10 1 1 0 6 1
value={C/2} m={m}
}
C 42600 49100 1 0 0 spice-directive-1.sym
{
T 42700 49400 5 10 0 1 0 0 1
device=directive
T 42700 49500 5 10 1 1 0 0 1
refdes=via
T 42500 49300 5 10 1 1 180 6 4
value=+Er=4.6 m=1 spacing=0 separation=0 d_barrel=0 d_pad=0 t=0 d_anti=0

.param L={separation*4.0e-7*ln(2*spacing/d_barrel)}
.param C={Er*5.55e-11*d_pad*t/(d_anti - d_pad)}
}
T 42600 49800 9 10 1 0 0 0 6
spacing:		Spacing to return via in meters
seperation:		Seperation between planes in meters
d_barrel:		Diameter of via barrel in meters
d_pad:			Diameter of via pad in meters
d_anti:			Diameter of via anti-pad in meters
Er:				Relative permittivity
C 42600 51500 1 0 0 spice-subcircuit-LL-1.sym
{
T 42700 51800 5 10 0 1 0 0 1
device=spice-subcircuit-LL
T 42700 51900 5 10 1 1 0 0 1
refdes=A0
T 42600 51600 5 10 1 1 0 0 1
model-name=via_lumped
}
C 43500 47300 1 0 1 spice-subcircuit-IO-1.sym
{
T 42600 47700 5 10 0 1 0 6 1
device=spice-IO
T 42650 47550 5 10 1 1 0 6 1
refdes=P1
}
C 43300 46900 1 270 0 spice-subcircuit-IO-1.sym
{
T 43700 46000 5 10 0 1 270 0 1
device=spice-IO
T 43750 46250 5 10 1 1 0 0 1
refdes=P2
}
C 45600 46900 1 90 1 spice-subcircuit-IO-1.sym
{
T 45200 46000 5 10 0 1 270 2 1
device=spice-IO
T 45150 46250 5 10 1 1 0 6 1
refdes=P4
}
C 45400 47300 1 0 0 spice-subcircuit-IO-1.sym
{
T 46300 47700 5 10 0 1 0 0 1
device=spice-IO
T 46250 47550 5 10 1 1 0 0 1
refdes=P3
}

v 20110115 2
C 44500 45300 1 270 0 voltage-3.sym
{
T 45200 45100 5 8 0 0 90 8 1
device=VOLTAGE_SOURCE
T 44400 45200 5 10 1 1 180 6 1
refdes=V0
T 43800 44100 5 10 1 1 180 6 1
value=DC 0 TRNOISE({NA*2} {NT} {NALPHA} {NAMP*2} {RTSAM*2} {RTSCAPT} {RTSEMT})
}
C 44900 45300 1 0 0 resistor-1.sym
{
T 45200 45700 5 10 0 0 0 0 1
device=RESISTOR
T 45300 45600 5 10 1 1 0 0 1
refdes=R0
T 45300 45100 5 10 1 1 0 0 1
value={Zo}
}
C 46000 44300 1 90 0 capacitor-1.sym
{
T 45300 44500 5 10 0 0 90 0 1
device=CAPACITOR
T 46300 44800 5 10 1 1 180 0 1
refdes=C1
T 45100 44500 5 10 0 0 90 0 1
symversion=0.1
T 45900 44400 5 10 1 1 0 0 1
value={C1*SC}
}
C 45800 45300 1 0 0 inductor-1.sym
{
T 46000 45800 5 10 0 0 0 0 1
device=INDUCTOR
T 46200 45600 5 10 1 1 0 0 1
refdes=L2
T 46000 46000 5 10 0 0 0 0 1
symversion=0.1
T 46000 45200 5 10 1 1 0 0 1
value={SL*L2}
}
N 44700 44200 51300 44200 4
{
T 44900 44200 5 10 1 1 0 0 1
netname=0
}
C 46700 45300 1 0 0 inductor-1.sym
{
T 46900 45800 5 10 0 0 0 0 1
device=INDUCTOR
T 47100 45600 5 10 1 1 0 0 1
refdes=L4
T 46900 46000 5 10 0 0 0 0 1
symversion=0.1
T 46900 45200 5 10 1 1 0 0 1
value={SL*L4}
}
C 46900 44300 1 90 0 capacitor-1.sym
{
T 47200 44800 5 10 1 1 180 0 1
refdes=C3
T 46800 44400 5 10 1 1 0 0 1
value={C3*SC}
T 46200 44500 5 10 0 0 90 0 1
device=CAPACITOR
T 46000 44500 5 10 0 0 90 0 1
symversion=0.1
}
C 47600 45300 1 0 0 inductor-1.sym
{
T 47800 45800 5 10 0 0 0 0 1
device=INDUCTOR
T 48000 45600 5 10 1 1 0 0 1
refdes=L6
T 47800 46000 5 10 0 0 0 0 1
symversion=0.1
T 47800 45200 5 10 1 1 0 0 1
value={SL*L6}
}
C 47800 44300 1 90 0 capacitor-1.sym
{
T 48100 44800 5 10 1 1 180 0 1
refdes=C5
T 47700 44400 5 10 1 1 0 0 1
value={C5*SC}
T 47100 44500 5 10 0 0 90 0 1
device=CAPACITOR
T 46900 44500 5 10 0 0 90 0 1
symversion=0.1
}
C 48500 45300 1 0 0 inductor-1.sym
{
T 48700 45800 5 10 0 0 0 0 1
device=INDUCTOR
T 48900 45600 5 10 1 1 0 0 1
refdes=L8
T 48700 46000 5 10 0 0 0 0 1
symversion=0.1
T 48700 45200 5 10 1 1 0 0 1
value={SL*L8}
}
C 48700 44300 1 90 0 capacitor-1.sym
{
T 49000 44800 5 10 1 1 180 0 1
refdes=C7
T 48600 44400 5 10 1 1 0 0 1
value={C7*SC}
T 48000 44500 5 10 0 0 90 0 1
device=CAPACITOR
T 47800 44500 5 10 0 0 90 0 1
symversion=0.1
}
C 49400 45300 1 0 0 inductor-1.sym
{
T 49600 45800 5 10 0 0 0 0 1
device=INDUCTOR
T 49800 45600 5 10 1 1 0 0 1
refdes=L10
T 49600 46000 5 10 0 0 0 0 1
symversion=0.1
T 49600 45200 5 10 1 1 0 0 1
value={SL*L10}
}
C 49600 44300 1 90 0 capacitor-1.sym
{
T 49900 44800 5 10 1 1 180 0 1
refdes=C9
T 49500 44400 5 10 1 1 0 0 1
value={C9*SC}
T 48900 44500 5 10 0 0 90 0 1
device=CAPACITOR
T 48700 44500 5 10 0 0 90 0 1
symversion=0.1
}
N 45800 44200 45800 44300 4
N 46700 44200 46700 44300 4
N 47600 44200 47600 44300 4
N 48500 44200 48500 44300 4
N 49400 44200 49400 44300 4
N 45800 45200 45800 45400 4
N 46700 45200 46700 45400 4
N 47600 45200 47600 45400 4
N 48500 45200 48500 45400 4
N 49400 45200 49400 45400 4
C 50400 44500 1 90 0 resistor-1.sym
{
T 50000 44800 5 10 0 0 90 0 1
device=RESISTOR
T 50700 44900 5 10 1 1 180 0 1
refdes=R11
T 50700 44700 5 10 1 1 180 0 1
value={Zo}
}
N 50300 44200 50300 44500 4
C 51300 44700 1 0 0 vcvs-1.sym
{
T 51500 45750 5 10 0 0 0 0 1
device=SPICE-vcvs
T 51900 45550 5 10 1 1 0 0 1
refdes=E0
T 51500 45950 5 10 0 0 0 0 1
symversion=0.1
T 52000 44650 5 10 1 0 0 5 1
value=1
}
N 51300 44200 51300 44800 4
N 51300 45400 50300 45400 4
C 44600 48100 1 0 0 spice-subcircuit-LL-1.sym
{
T 44700 48400 5 10 0 1 0 0 1
device=spice-subcircuit-LL
T 44700 48500 5 10 1 1 0 0 1
refdes=A0
T 44700 48200 5 10 1 0 0 0 1
model-name=noise
}
C 52600 45100 1 0 0 spice-subcircuit-IO-1.sym
{
T 53500 45500 5 10 0 1 0 0 1
device=spice-IO
T 53450 45350 5 10 1 1 0 0 1
refdes=P1
}
C 52600 44500 1 0 0 spice-subcircuit-IO-1.sym
{
T 53500 44900 5 10 0 1 0 0 1
device=spice-IO
T 53450 44750 5 10 1 1 0 0 1
refdes=P2
}
C 44600 47500 1 0 0 spice-directive-1.sym
{
T 44700 47800 5 10 0 1 0 0 1
device=directive
T 44700 47600 5 10 0 1 0 0 1
file=?
T 44600 46000 5 10 1 1 0 0 9
value=+F3dB=6GHz NT=0
+NA=0
+NALPHA=1.0 NAMP=0
+RTSAM=0 RTSCAPT=0 RTSEMT=0
.param TR=0.338/F3dB
.param TS=TR/2.12773
.param Zo=50 SL=TS*Zo SC=TS/Zo
.param C1=.0512 C3=.2509 C5=.4353 C7=.6244 C9=1.0147
.param L2=.1525 L4=.3451 L6=.52250 L8=.7597 L10=2.2594
T 44700 47900 5 10 1 1 0 0 1
refdes=A2
}
T 44644 51695 8 10 1 0 0 0 1
author=Russ Dill Russ.Dill@asu.edu
T 44644 51295 8 10 1 0 0 0 1
use-license=unlimited
T 44644 51495 8 10 1 0 0 0 1
dist-license=GPL2+
T 44600 50600 9 10 1 0 0 0 3
Idea from: http://sigcon.com/Pubs/edn/MakingEdges.htm
"Making Gaussian Edges", Dr. Howard Johnson, EDN Magazine Dec 2009
And: Anatol I Zverev, Handbook of Filter Synthesis, John Wiley & Sons, New York, 1967
T 44600 48900 9 10 1 0 0 0 8
F3dB (Hz):		-3 dB cutoff frequency of noise (default: 6GHz)
NT (s):			TRNOISE timestep (default: 0)
NA (V):			TRNOISE White noise RMS amplitude (Gaussian) (default: 0)
NALPHA:		TRNOISE 1/f noise exponent 0 < a < 2 (default: 1)
NAMP (V):		TRNOISE 1/f noise amplitude (default: 0)
RTSAM (V):		TRNOISE RTS noise amplitude (default: 0)
RTSCAPT (s):	TRNOISE RTS noise trap capture time (default: 0)
RTSEMPT (s):	TRNOISE RTS noise trap emission time (default: 0)
N 44700 44200 44700 44400 4
N 44700 45300 44700 45400 4
N 44700 45400 44900 45400 4

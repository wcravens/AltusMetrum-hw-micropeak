v 20110115 2
C 40000 40000 0 0 0 title-B.sym
C 42000 44500 1 0 0 attiny85.sym
{
T 41995 44475 5 10 0 1 0 0 1
footprint=MO-220
T 46900 48100 5 10 1 1 0 0 1
refdes=U1
T 42400 48100 5 10 1 1 0 0 1
device=IC
T 42400 48100 5 10 1 1 0 0 1
value=ATtiny85
T 41995 44475 5 10 0 1 0 0 1
vendor=digikey
T 41995 44475 5 10 0 1 0 0 1
vendor_part_number=ATTINY85-20MU-ND
T 41995 44475 5 10 0 1 0 0 1
loadstatus=smt
}
C 52300 45500 1 0 1 MS5611.sym
{
T 50905 47695 5 10 1 1 0 6 1
device=MS5611
T 52005 47695 5 10 1 1 0 6 1
refdes=U2
T 52305 42295 5 10 0 1 0 6 1
footprint=MS5611
T 52305 42295 5 10 0 1 0 6 1
vendor=measspec
T 52305 42295 5 10 0 1 0 6 1
vendor_part_number=MS5611
}
C 48400 43400 1 270 0 battery-1.sym
{
T 49300 43100 5 10 0 0 270 0 1
device=BATTERY
T 48900 42900 5 10 1 1 0 0 1
refdes=B1
T 49700 43100 5 10 0 0 270 0 1
symversion=0.1
T 48400 43400 5 10 0 0 270 0 1
footprint=bhx1-1025-sm
T 48400 43400 5 10 0 0 270 0 1
vendor=digikey
T 48400 43400 5 10 0 0 270 0 1
vendor_part_number=BHX1-1025-SM-ND
T 48400 43400 5 10 0 0 270 0 1
loadstatus=smt
}
C 48100 42300 1 0 0 gnd-1.sym
C 48000 43500 1 0 0 3.3V-plus-1.sym
C 52600 47300 1 0 0 3.3V-plus-1.sym
C 41300 47000 1 0 0 3.3V-plus-1.sym
C 41400 44700 1 0 0 gnd-1.sym
C 52700 45400 1 0 0 gnd-1.sym
N 41500 45000 41500 46100 4
C 41700 46100 1 90 0 capacitor-1.sym
{
T 41000 46300 5 10 0 0 90 0 1
device=CAPACITOR
T 41400 46800 5 10 1 1 180 0 1
refdes=C1
T 40800 46300 5 10 0 0 90 0 1
symversion=0.1
T 40800 46300 5 10 1 1 0 0 1
value=0.1uF
T 41700 46100 5 10 0 0 0 0 1
footprint=0402
T 41700 46100 5 10 0 0 0 0 1
vendor=digikey
T 41700 46100 5 10 0 0 0 0 1
vendor_part_number=399-3027-1-ND
T 41700 46100 5 10 0 0 0 0 1
loadstatus=smt
}
N 47500 46500 50000 46500 4
{
T 47500 46600 5 10 1 1 0 0 1
netname=clk
}
N 47500 47500 49300 47500 4
{
T 47500 47600 5 10 1 1 0 0 1
netname=mosi
}
N 49300 47500 49300 46100 4
N 49300 46100 50000 46100 4
N 47500 47000 48200 47000 4
{
T 47500 47100 5 10 1 1 0 0 1
netname=miso
}
N 48200 47000 48200 45700 4
N 48200 45700 50000 45700 4
N 47500 46000 48800 46000 4
{
T 47500 46100 5 10 1 1 0 0 1
netname=cs_baro
}
N 48800 46000 48800 46900 4
N 48800 46900 50000 46900 4
N 50000 46900 50000 47300 4
N 52800 45700 52300 45700 4
N 52800 47300 52300 47300 4
C 52600 47300 1 270 0 capacitor-1.sym
{
T 53300 47100 5 10 0 0 270 0 1
device=CAPACITOR
T 52900 47000 5 10 1 1 0 0 1
refdes=C2
T 53500 47100 5 10 0 0 270 0 1
symversion=0.1
T 52600 47300 5 10 0 1 0 0 1
footprint=0402
T 52900 46600 5 10 1 1 0 0 1
value=0.1uF
T 41700 46100 5 10 0 0 0 0 1
vendor=digikey
T 41700 46100 5 10 0 0 0 0 1
vendor_part_number=399-3027-1-ND
T 41700 46100 5 10 0 0 0 0 1
loadstatus=smt
}
N 52500 45700 52500 46500 4
N 52500 46500 52300 46500 4
N 52800 46400 52800 45700 4
N 41500 47000 42000 47000 4
N 41500 45000 42000 45000 4
N 42000 46000 42000 45000 4
C 47600 43500 1 270 0 capacitor-1.sym
{
T 48300 43300 5 10 0 0 270 0 1
device=CAPACITOR
T 47500 43200 5 10 1 1 0 0 1
refdes=C3
T 48500 43300 5 10 0 0 270 0 1
symversion=0.1
T 47300 42700 5 10 1 1 0 0 1
value=4.7uF
T 47600 43500 5 10 0 1 0 0 1
footprint=0402
T 54600 42000 5 10 0 0 0 0 1
vendor_part_number=445-5947-1-ND
T 54600 42000 5 10 0 0 0 0 1
vendor=digikey
T 54600 42000 5 10 0 1 0 0 1
loadstatus=smt
}
N 47800 43500 48600 43500 4
N 47800 42600 48600 42600 4
N 48600 42600 48600 42700 4
N 48600 43500 48600 43400 4
N 47500 45000 47800 45000 4
{
T 47500 45100 5 10 1 1 0 0 1
netname=\_reset\_
}
C 49700 45200 1 180 0 led-2.sym
{
T 49400 44900 5 10 1 1 0 0 1
refdes=D1
T 49600 44600 5 10 0 0 180 0 1
device=LED
T 48800 44900 5 10 1 1 0 0 1
value=blue
T 49700 45200 5 10 0 1 270 0 1
footprint=0603diode
T 49700 45200 5 10 0 1 270 0 1
vendor=digikey
T 49700 45200 5 10 0 1 270 0 1
vendor_part_number=754-1434-1-ND
T 49700 45200 5 10 0 1 270 0 1
loadstatus=smt
}
C 47500 45400 1 0 0 resistor-1.sym
{
T 47800 45800 5 10 0 0 0 0 1
device=RESISTOR
T 47600 45700 5 10 1 1 0 0 1
refdes=R1
T 47500 45400 5 10 0 0 0 0 1
footprint=0402
T 48000 45700 5 10 1 1 0 0 1
value=270
T 47500 45400 5 10 0 0 0 0 1
vendor=digikey
T 47500 45400 5 10 0 0 0 0 1
vendor_part_number=RC0603JR-07270RL
T 47500 45400 5 10 0 0 0 0 1
loadstatus=smt
}
T 50000 40700 9 24 1 0 0 0 1
MicroPeak
T 53900 40400 9 10 1 0 0 0 1
0.2
T 53900 40100 9 10 1 0 0 0 1
Keith Packard <keithp@keithp.com>
T 50400 40100 9 10 1 0 0 0 1
1
T 52000 40100 9 10 1 0 0 0 1
1
T 50000 40400 9 10 1 0 0 0 1
micropeak.sch
C 53700 44400 1 0 0 hole_plated.sym
{
T 53800 46100 5 10 0 0 0 0 1
device=HOLE_PLATED
T 53800 44900 5 10 1 1 0 0 1
refdes=H1
T 53700 44400 5 10 0 0 0 0 1
footprint=hole-M2.5
T 53700 44400 5 10 0 1 0 0 1
loadstatus=noload
}
C 53700 43600 1 0 0 hole_plated.sym
{
T 53800 45300 5 10 0 0 0 0 1
device=HOLE_PLATED
T 53800 44100 5 10 1 1 0 0 1
refdes=H2
T 53700 43600 5 10 0 0 0 0 1
footprint=hole-M2.5
T 53700 43600 5 10 0 1 0 0 1
loadstatus=noload
}
N 54300 42200 54300 44600 4
C 53700 42800 1 0 0 hole_plated.sym
{
T 53800 44500 5 10 0 0 0 0 1
device=HOLE_PLATED
T 53800 43300 5 10 1 1 0 0 1
refdes=H3
T 53700 42800 5 10 0 0 0 0 1
footprint=hole-M2.5
T 53700 42800 5 10 0 1 0 0 1
loadstatus=noload
}
C 53700 42000 1 0 0 hole_plated.sym
{
T 53800 43700 5 10 0 0 0 0 1
device=HOLE_PLATED
T 53800 42500 5 10 1 1 0 0 1
refdes=H4
T 53700 42000 5 10 0 0 0 0 1
footprint=hole-M2.5
T 53700 42000 5 10 0 1 0 0 1
loadstatus=noload
}
N 50500 44400 51100 44400 4
{
T 50500 44400 5 10 1 1 0 0 1
netname=miso
}
N 50500 43600 51100 43600 4
{
T 50500 43600 5 10 1 1 0 0 1
netname=clk
}
N 50500 43200 51100 43200 4
{
T 50500 43200 5 10 1 1 0 0 1
netname=mosi
}
N 50500 42800 51100 42800 4
{
T 50500 42800 5 10 1 1 0 0 1
netname=\_reset\_
}
N 50500 42400 51100 42400 4
C 50400 42100 1 0 0 gnd-1.sym
N 51100 44000 50500 44000 4
C 50300 44000 1 0 0 3.3V-plus-1.sym
C 51100 42300 1 0 0 pico-ezmate-6.sym
{
T 51455 44595 5 10 1 1 0 0 1
refdes=J1
T 51095 42275 5 10 0 1 0 0 1
footprint=pico-ezmate-6
T 51095 42275 5 10 0 1 0 0 1
device=CONNECTOR
T 51095 42275 5 10 0 1 0 0 1
value=6-pin
}
C 54100 44600 1 0 0 3.3V-plus-1.sym
C 49500 45100 1 0 0 3.3V-plus-1.sym
N 48400 45500 48800 45500 4
N 48800 45500 48800 45100 4

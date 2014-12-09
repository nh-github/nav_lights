EESchema Schematic File Version 2  date Tue 09 Dec 2014 01:12:04 AM HST
LIBS:local_parts
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:nav_light-cache
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 4 4
Title "LED Driver"
Date "9 dec 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 7000 4450 0    60   ~ 0
Drop 0.3V (@0.35A) over \nresistor => 0.85 Ohm, 0.105W
Connection ~ 6300 4050
Wire Wire Line
	6600 4050 6600 4150
Wire Wire Line
	5700 4050 6600 4050
Wire Wire Line
	6300 4600 6300 4800
Wire Wire Line
	5700 4250 5900 4250
Wire Wire Line
	5900 4250 5900 3750
Wire Wire Line
	5900 3750 6700 3750
Wire Wire Line
	4000 3600 3700 3600
Connection ~ 4200 3400
Wire Wire Line
	3700 3400 4700 3400
Connection ~ 5000 5300
Wire Wire Line
	6300 5200 6300 5300
Wire Wire Line
	5700 3750 5800 3750
Wire Wire Line
	5800 3750 5800 3400
Wire Wire Line
	5800 3400 5300 3400
Wire Wire Line
	4300 4050 4000 4050
Wire Wire Line
	4200 4250 4300 4250
Wire Wire Line
	4300 3750 4200 3750
Wire Wire Line
	4200 3400 4200 4250
Connection ~ 4200 3750
Wire Wire Line
	5700 3850 6900 3850
Wire Wire Line
	6900 3850 6900 4550
Wire Wire Line
	4000 5300 4000 5150
Wire Wire Line
	6900 5300 6900 4950
Wire Wire Line
	6900 5300 3800 5300
Connection ~ 6300 5300
Wire Wire Line
	3700 3500 3800 3500
Wire Wire Line
	3800 3500 3800 5300
Connection ~ 4000 5300
Wire Wire Line
	4000 4650 4000 3600
Connection ~ 4000 4050
Wire Wire Line
	6300 4050 6300 4200
Wire Wire Line
	5000 5300 5000 4650
Wire Wire Line
	6300 4700 6600 4700
Wire Wire Line
	6600 4700 6600 4650
Connection ~ 6300 4700
$Comp
L R Rp202
U 1 1 54813C92
P 6600 4400
F 0 "Rp202" V 6680 4400 50  0000 C CNN
F 1 "0.91" V 6600 4400 50  0000 C CNN
F 2 "SM0805" H 6600 4400 60  0001 C CNN
F 4 "CRM0805-FX-R910ELF" V 6600 4400 60  0001 C CNN "digikey"
	1    6600 4400
	1    0    0    -1  
$EndComp
Text Notes 5300 5450 0    60   ~ 0
LED output from 3490 must be >= 2.5V\nXP-E2 green and red have Vf of 2.2 & 3.2\nAdd LED to boost voltage
$Comp
L DIODE Dp202
U 1 1 548139A3
P 6300 4400
F 0 "Dp202" H 6300 4500 40  0000 C CNN
F 1 "DIODE" H 6300 4300 40  0000 C CNN
F 2 "DO-216AA" H 6300 4400 60  0000 C CNN
F 4 "MBRM120ET3GOSCT-ND" H 6300 4400 60  0001 C CNN "digikey"
	1    6300 4400
	0    1    1    0   
$EndComp
Text Notes 5500 6000 0    60   ~ 0
NOTE:\n* Choose one LED footprint to populate\n* $4 ASMT-AR00-ARS00 (red); 516-2565-ND / no green\n* $3.75 LXM2-PD01-0050 (red); LXML-PM01-0090 (green)\n* $2.75 XPEBRD-L1-0000-00801 (red); XPEBGR-L1-0000-00E01 (green)\n* $1.25 Cree ML-E (MLERED-A1-0000-000V01, MLEGRN-A1-0000-000X01) [dim]
Text HLabel 3700 3600 0    60   Input ~ 0
CTRL
Text HLabel 6700 3750 2    60   Output ~ 0
~LOBAT
Text HLabel 3700 3500 0    60   Input ~ 0
gnd
Text HLabel 3700 3400 0    60   Input ~ 0
Vbat
$Comp
L LED Dp201
U 1 1 53D0E361
P 6300 5000
F 0 "Dp201" H 6300 5100 50  0000 C CNN
F 1 "LED" H 6300 4900 50  0000 C CNN
F 2 "XP-E2" H 6300 5000 60  0001 C CNN
F 4 "XPEBRD-L1-0000-00801CT-ND" H 6300 5000 60  0001 C CNN "digikey"
	1    6300 5000
	0    1    1    0   
$EndComp
$Comp
L INDUCTOR Lp201
U 1 1 53D0E176
P 5000 3400
F 0 "Lp201" V 4950 3400 40  0000 C CNN
F 1 "3.3uH" V 5100 3400 40  0000 C CNN
F 2 "SLF7045" H 5000 3400 60  0001 C CNN
F 4 "445-2023-1-ND" V 5000 3400 60  0001 C CNN "digikey"
	1    5000 3400
	0    -1   -1   0   
$EndComp
$Comp
L C Cp201
U 1 1 53D0E16B
P 6900 4750
F 0 "Cp201" H 6950 4850 50  0000 L CNN
F 1 "4.7uF" H 6950 4650 50  0000 L CNN
F 2 "SM0805" H 6900 4750 60  0001 C CNN
F 4 "445-1421-1-ND" H 6900 4750 60  0001 C CNN "digikey"
	1    6900 4750
	1    0    0    -1  
$EndComp
$Comp
L R Rp201
U 1 1 53D0E165
P 4000 4900
F 0 "Rp201" V 4080 4900 50  0000 C CNN
F 1 "1M" V 4000 4900 50  0000 C CNN
F 2 "SM0805" H 4000 4900 60  0001 C CNN
F 4 "P1.00MCCT-ND" V 4000 4900 60  0001 C CNN "digikey"
	1    4000 4900
	1    0    0    -1  
$EndComp
$Comp
L LTC3490ES8 Up201
U 1 1 53D0DE6A
P 5000 4000
F 0 "Up201" H 5000 3900 50  0000 C CNN
F 1 "LTC3490ES8" H 5000 4100 50  0000 C CNN
F 2 "SOIC_8n" H 5000 4000 50  0001 C CNN
F 3 "DOCUMENTATION" H 5000 4000 50  0001 C CNN
F 4 "LTC3490ES8#PBF-ND" H 5000 4000 60  0001 C CNN "digikey"
	1    5000 4000
	1    0    0    -1  
$EndComp
$EndSCHEMATC

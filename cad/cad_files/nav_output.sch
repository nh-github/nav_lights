EESchema Schematic File Version 2  date Wed 31 Dec 2014 02:14:48 PM HST
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
Date "1 jan 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 7900 4700 0    60   ~ 0
p2_LED_mid
Text Label 6400 4050 0    60   ~ 0
p2_LED_out
Text Label 6300 4400 1    60   ~ 0
p2_cap
Text Label 5500 3400 0    60   ~ 0
p2_sw
Text Notes 7900 5000 0    60   ~ 0
<= use only one of these alternates
Wire Wire Line
	7900 4700 6900 4700
Connection ~ 6900 5300
Wire Wire Line
	7500 5200 7500 5300
Connection ~ 6900 4700
Wire Wire Line
	7500 4650 7500 4800
Wire Wire Line
	5000 5300 5000 4650
Wire Wire Line
	6900 4200 6900 4050
Connection ~ 4000 4050
Wire Wire Line
	4000 4650 4000 3600
Connection ~ 4000 5300
Wire Wire Line
	3800 3500 3800 5300
Wire Wire Line
	3800 3500 3700 3500
Connection ~ 6300 5300
Wire Wire Line
	6300 5300 6300 4950
Wire Wire Line
	4000 5300 4000 5150
Wire Wire Line
	6300 4550 6300 3850
Wire Wire Line
	6300 3850 5700 3850
Connection ~ 4200 3750
Wire Wire Line
	4200 3400 4200 4250
Wire Wire Line
	4300 3750 4200 3750
Wire Wire Line
	4200 4250 4300 4250
Wire Wire Line
	4300 4050 4000 4050
Wire Wire Line
	5300 3400 5800 3400
Wire Wire Line
	5800 3400 5800 3750
Wire Wire Line
	5800 3750 5700 3750
Wire Wire Line
	6900 5200 6900 5300
Connection ~ 5000 5300
Wire Wire Line
	3700 3400 4700 3400
Connection ~ 4200 3400
Wire Wire Line
	4000 3600 3700 3600
Wire Wire Line
	6700 3750 5900 3750
Wire Wire Line
	5900 3750 5900 4250
Wire Wire Line
	5900 4250 5700 4250
Wire Wire Line
	6900 4600 6900 4800
Wire Wire Line
	5700 4050 7500 4050
Wire Wire Line
	7500 4050 7500 4150
Connection ~ 6900 4050
Connection ~ 7500 4700
Wire Wire Line
	3800 5300 7500 5300
$Comp
L LED Dp203
U 1 1 54897986
P 7500 5000
F 0 "Dp203" H 7500 5100 50  0000 C CNN
F 1 "LED" H 7500 4900 50  0000 C CNN
F 2 "PIN_ARRAY_2X1" H 7500 5200 60  0000 C CNN
F 4 "XPEBRD-L1-0000-00801CT-ND" H 7500 4800 60  0000 C CNN "digikey"
	1    7500 5000
	0    1    1    0   
$EndComp
Text Notes 7800 4450 0    60   ~ 0
Drop 0.3V (@0.35A) over \nresistor => 0.85 Ohm, 0.105W
$Comp
L R Rp202
U 1 1 54813C92
P 7500 4400
F 0 "Rp202" V 7580 4400 50  0000 C CNN
F 1 "0.91" V 7500 4400 50  0000 C CNN
F 2 "SM1206" V 7700 4400 60  0000 C CNN
F 4 "CRM0805-FX-R910ELF" V 7400 4400 60  0000 C CNN "digikey"
	1    7500 4400
	1    0    0    -1  
$EndComp
Text Notes 5300 5450 0    60   ~ 0
LED output from 3490 must be >= 2.5V\nXP-E2 green and red have Vf of 2.2 & 3.2\nAdd LED to boost voltage
$Comp
L DIODE Dp202
U 1 1 548139A3
P 6900 4400
F 0 "Dp202" H 6900 4500 40  0000 C CNN
F 1 "DIODE" H 6900 4300 40  0000 C CNN
F 2 "DO-216AA" H 6900 4600 60  0000 C CNN
F 4 "MBRM120ET3GOSCT-ND" H 6900 4200 60  0000 C CNN "digikey"
	1    6900 4400
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
P 6900 5000
F 0 "Dp201" H 6900 5100 50  0000 C CNN
F 1 "LED" H 6900 4900 50  0000 C CNN
F 2 "XP-E2" H 6900 5200 60  0000 C CNN
F 4 "XPEBRD-L1-0000-00801CT-ND" H 6900 4700 60  0000 C CNN "digikey"
	1    6900 5000
	0    1    1    0   
$EndComp
$Comp
L INDUCTOR Lp201
U 1 1 53D0E176
P 5000 3400
F 0 "Lp201" V 4950 3400 40  0000 C CNN
F 1 "3.3uH" V 5100 3400 40  0000 C CNN
F 2 "SLF7045" V 4850 3400 60  0000 C CNN
F 4 "445-2023-1-ND" V 5200 3400 60  0000 C CNN "digikey"
	1    5000 3400
	0    -1   -1   0   
$EndComp
$Comp
L C Cp201
U 1 1 53D0E16B
P 6300 4750
F 0 "Cp201" H 6350 4850 50  0000 L CNN
F 1 "4.7uF" H 6350 4650 50  0000 L CNN
F 2 "SM1206" V 6100 4750 60  0000 C CNN
F 4 "445-1421-1-ND" V 6000 4750 60  0000 C CNN "digikey"
	1    6300 4750
	1    0    0    -1  
$EndComp
$Comp
L R Rp201
U 1 1 53D0E165
P 4000 4900
F 0 "Rp201" V 4080 4900 50  0000 C CNN
F 1 "1M" V 4000 4900 50  0000 C CNN
F 2 "SM1206" H 4300 4950 60  0000 C CNN
F 4 "P1.00MCCT-ND" V 4000 4900 60  0000 C CNN "digikey"
	1    4000 4900
	1    0    0    -1  
$EndComp
$Comp
L LTC3490ES8 Up201
U 1 1 53D0DE6A
P 5000 4000
F 0 "Up201" H 5000 4250 50  0000 C CNN
F 1 "LTC3490ES8" H 5000 4100 50  0000 C CNN
F 2 "SOIC_8n" H 5200 3550 50  0000 C CNN
F 3 "DOCUMENTATION" H 5000 4000 50  0001 C CNN
F 4 "LTC3490ES8#PBF-ND" H 5000 4000 60  0000 C CNN "digikey"
	1    5000 4000
	1    0    0    -1  
$EndComp
$EndSCHEMATC

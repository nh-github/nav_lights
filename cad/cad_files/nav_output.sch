EESchema Schematic File Version 2  date Thu 24 Jul 2014 03:25:37 PM HST
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
Sheet 4 5
Title ""
Date "25 jul 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Connection ~ 4200 3400
Wire Wire Line
	3700 3400 4700 3400
Connection ~ 5100 4800
Wire Wire Line
	5100 4800 5100 4900
Connection ~ 5000 4800
Wire Wire Line
	6000 4800 6000 4450
Wire Wire Line
	5700 4050 6000 4050
Wire Wire Line
	5700 3750 5800 3750
Wire Wire Line
	5800 3750 5800 3400
Wire Wire Line
	5800 3400 5300 3400
Wire Wire Line
	4300 4050 4000 4050
Wire Wire Line
	4300 4250 4200 4250
Wire Wire Line
	4300 3750 4200 3750
Wire Wire Line
	4200 4250 4200 3400
Connection ~ 4200 3750
Wire Wire Line
	5700 3850 6300 3850
Wire Wire Line
	6300 3850 6300 4050
Wire Wire Line
	5000 4650 5000 4800
Wire Wire Line
	4000 4800 4000 4550
Wire Wire Line
	6300 4450 6300 4800
Wire Wire Line
	6300 4800 3800 4800
Connection ~ 6000 4800
Wire Wire Line
	3700 3500 3800 3500
Wire Wire Line
	3800 3500 3800 4800
Connection ~ 4000 4800
Text HLabel 3700 3500 0    60   Input ~ 0
gnd
Text HLabel 3700 3400 0    60   Input ~ 0
Vbatt
$Comp
L GND #PWR?
U 1 1 53D0E3BB
P 5100 4900
F 0 "#PWR?" H 5100 4900 30  0001 C CNN
F 1 "GND" H 5100 4830 30  0001 C CNN
	1    5100 4900
	1    0    0    -1  
$EndComp
$Comp
L LED D?
U 1 1 53D0E361
P 6000 4250
F 0 "D?" H 6000 4350 50  0000 C CNN
F 1 "LED" H 6000 4150 50  0000 C CNN
	1    6000 4250
	0    1    1    0   
$EndComp
$Comp
L INDUCTOR Lp201
U 1 1 53D0E176
P 5000 3400
F 0 "Lp201" V 4950 3400 40  0000 C CNN
F 1 "3.3uH" V 5100 3400 40  0000 C CNN
	1    5000 3400
	0    -1   -1   0   
$EndComp
$Comp
L C Cp201
U 1 1 53D0E16B
P 6300 4250
F 0 "Cp201" H 6350 4350 50  0000 L CNN
F 1 "4.7uF" H 6350 4150 50  0000 L CNN
	1    6300 4250
	1    0    0    -1  
$EndComp
$Comp
L R Rp201
U 1 1 53D0E165
P 4000 4300
F 0 "Rp201" V 4080 4300 50  0000 C CNN
F 1 "1M" V 4000 4300 50  0000 C CNN
	1    4000 4300
	1    0    0    -1  
$EndComp
$Comp
L LTC3490ES8 Up201
U 1 1 53D0DE6A
P 5000 4000
F 0 "Up201" H 5000 3900 50  0000 C CNN
F 1 "LTC3490ES8" H 5000 4100 50  0000 C CNN
F 2 "MODULE" H 5000 4000 50  0001 C CNN
F 3 "DOCUMENTATION" H 5000 4000 50  0001 C CNN
	1    5000 4000
	1    0    0    -1  
$EndComp
$EndSCHEMATC

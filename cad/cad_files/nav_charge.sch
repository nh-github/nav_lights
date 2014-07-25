EESchema Schematic File Version 2  date Thu 24 Jul 2014 11:01:35 PM HST
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
Sheet 5 5
Title ""
Date "25 jul 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	2000 4200 4300 4200
Connection ~ 5400 5200
Wire Wire Line
	5400 5200 5400 4700
Wire Wire Line
	5400 4700 4100 4700
Connection ~ 5900 2900
Wire Wire Line
	8000 3000 7900 3000
Wire Wire Line
	7900 3000 7900 2800
Wire Wire Line
	7900 2800 5900 2800
Wire Wire Line
	5900 2800 5900 3600
Wire Wire Line
	2700 3900 1500 3900
Connection ~ 2300 2900
Wire Wire Line
	2000 2900 3000 2900
Connection ~ 6300 3000
Wire Wire Line
	6100 3000 7000 3000
Wire Wire Line
	5700 4100 6100 4100
Connection ~ 6600 3000
Wire Wire Line
	7000 3000 7000 3200
Connection ~ 6600 4900
Wire Wire Line
	7000 4800 7000 4900
Wire Wire Line
	7000 4900 6000 4900
Connection ~ 6000 4900
Wire Wire Line
	6300 4800 6300 4900
Connection ~ 7000 4000
Wire Wire Line
	5700 4000 7000 4000
Wire Wire Line
	7000 3700 7000 4300
Wire Wire Line
	5900 3600 5700 3600
Wire Wire Line
	3400 2900 5900 2900
Wire Wire Line
	5700 4300 6000 4300
Connection ~ 4000 5200
Wire Wire Line
	4000 4400 4300 4400
Wire Wire Line
	4300 3600 3900 3600
Wire Wire Line
	3400 3900 3100 3900
Wire Wire Line
	3400 3600 3000 3600
Wire Wire Line
	2500 3600 2300 3600
Wire Wire Line
	3200 3200 3200 3600
Connection ~ 3200 3600
Wire Wire Line
	3900 3900 4300 3900
Wire Wire Line
	4600 5200 2000 5200
Wire Wire Line
	4300 4300 4100 4300
Wire Wire Line
	4100 4300 4100 4700
Wire Wire Line
	5700 4200 6300 4200
Wire Wire Line
	6300 4200 6300 4300
Wire Wire Line
	6000 5000 6000 4800
Wire Wire Line
	6600 3700 6600 4300
Wire Wire Line
	5700 3900 6600 3900
Connection ~ 6600 3900
Wire Wire Line
	6300 3800 6300 3600
Wire Wire Line
	6600 4900 6600 4800
Connection ~ 6300 4900
Wire Wire Line
	6300 3000 6300 3200
Wire Wire Line
	6600 3200 6600 3000
Wire Wire Line
	5700 3700 6000 3700
Wire Wire Line
	6000 3700 6000 2900
Wire Wire Line
	6000 2900 7800 2900
Wire Wire Line
	7800 2900 7800 3200
Wire Wire Line
	7800 3200 8000 3200
Wire Wire Line
	6100 4100 6100 2700
Wire Wire Line
	6100 2700 1200 2700
Connection ~ 6100 3000
Wire Wire Line
	2300 3600 2300 2900
Wire Wire Line
	1500 3900 1500 2700
Connection ~ 1500 2900
Connection ~ 1500 2700
Wire Wire Line
	5100 5200 7800 5200
Wire Wire Line
	7800 5200 7800 3400
Wire Wire Line
	7800 3400 8000 3400
Wire Wire Line
	4300 4000 4000 4000
Wire Wire Line
	4000 4000 4000 5200
Connection ~ 4000 4400
Text HLabel 2000 4200 0    60   Output ~ 0
IFB
$Comp
L R Rp?
U 1 1 53D21B63
P 1750 2900
F 0 "Rp?" V 1830 2900 50  0000 C CNN
F 1 "0" V 1750 2900 50  0000 C CNN
	1    1750 2900
	0    -1   -1   0   
$EndComp
Text Notes 3300 5500 0    60   ~ 0
0.125 ohm -> approx. 1 Amp charge current
$Comp
L GND #PWR?
U 1 1 53D1ECEA
P 6300 3800
F 0 "#PWR?" H 6300 3800 30  0001 C CNN
F 1 "GND" H 6300 3730 30  0001 C CNN
	1    6300 3800
	1    0    0    -1  
$EndComp
$Comp
L C Cp101
U 1 1 53D1EAC9
P 6300 3400
F 0 "Cp101" H 6350 3500 50  0000 L CNN
F 1 "0.1" H 6350 3300 50  0000 L CNN
	1    6300 3400
	1    0    0    -1  
$EndComp
Text HLabel 8000 3400 2    60   BiDi ~ 0
battery_neg
Text HLabel 8000 3200 2    60   BiDi ~ 0
battery_mid
Text HLabel 8000 3000 2    60   BiDi ~ 0
battery_pos
$Comp
L GND #PWR?
U 1 1 53D0F9AE
P 6000 5000
F 0 "#PWR?" H 6000 5000 30  0001 C CNN
F 1 "GND" H 6000 4930 30  0001 C CNN
	1    6000 5000
	1    0    0    -1  
$EndComp
$Comp
L LED D?
U 1 1 53D0F806
P 2900 3900
F 0 "D?" H 2900 4000 50  0000 C CNN
F 1 "LED" H 2900 3800 50  0000 C CNN
	1    2900 3900
	1    0    0    -1  
$EndComp
$Comp
L R Rp102
U 1 1 53D0E883
P 3650 3600
F 0 "Rp102" V 3730 3600 50  0000 C CNN
F 1 "100" V 3650 3600 50  0000 C CNN
	1    3650 3600
	0    -1   -1   0   
$EndComp
$Comp
L R Rp103
U 1 1 53D0E880
P 3650 3900
F 0 "Rp103" V 3730 3900 50  0000 C CNN
F 1 "270" V 3650 3900 50  0000 C CNN
	1    3650 3900
	0    -1   -1   0   
$EndComp
$Comp
L R Rp104
U 1 1 53D0E877
P 4850 5200
F 0 "Rp104" V 4930 5200 50  0000 C CNN
F 1 "0.25" V 4850 5200 50  0000 C CNN
	1    4850 5200
	0    -1   -1   0   
$EndComp
$Comp
L R Rp108
U 1 1 53D0E86F
P 7000 3450
F 0 "Rp108" V 7080 3450 50  0000 C CNN
F 1 "10k" V 7000 3450 50  0000 C CNN
	1    7000 3450
	-1   0    0    1   
$EndComp
$Comp
L R Rp107
U 1 1 53D0E86D
P 6600 3450
F 0 "Rp107" V 6680 3450 50  0000 C CNN
F 1 "10k" V 6600 3450 50  0000 C CNN
	1    6600 3450
	-1   0    0    1   
$EndComp
$Comp
L R Rp106
U 1 1 53D0E85F
P 6300 4550
F 0 "Rp106" V 6380 4550 50  0000 C CNN
F 1 "100k" V 6300 4550 50  0000 C CNN
	1    6300 4550
	-1   0    0    1   
$EndComp
$Comp
L R Rp105
U 1 1 53D0E859
P 6000 4550
F 0 "Rp105" V 6080 4550 50  0000 C CNN
F 1 "75k" V 6000 4550 50  0000 C CNN
	1    6000 4550
	-1   0    0    1   
$EndComp
$Comp
L THERMISTOR THp102
U 1 1 53D0E843
P 7000 4550
F 0 "THp102" V 7100 4600 50  0000 C CNN
F 1 "103AT-2" V 6900 4550 50  0000 C CNN
	1    7000 4550
	1    0    0    -1  
$EndComp
$Comp
L THERMISTOR THp101
U 1 1 53D0E839
P 6600 4550
F 0 "THp101" V 6700 4600 50  0000 C CNN
F 1 "103AT-2" V 6500 4550 50  0000 C CNN
	1    6600 4550
	1    0    0    -1  
$EndComp
$Comp
L PNP Qp101
U 1 1 53D0E539
P 3200 3000
F 0 "Qp101" H 3200 2850 60  0000 R CNN
F 1 "FCX718" H 3200 3150 60  0000 R CNN
	1    3200 3000
	0    1    -1   0   
$EndComp
$Comp
L R Rp101
U 1 1 53D0E519
P 2750 3600
F 0 "Rp101" V 2830 3600 50  0000 C CNN
F 1 "10k" V 2750 3600 50  0000 C CNN
	1    2750 3600
	0    -1   -1   0   
$EndComp
Text HLabel 2000 5200 0    60   Input ~ 0
gnd
Text HLabel 1200 2700 0    60   Input ~ 0
+5V
$Comp
L DS2712 Up101
U 1 1 53D0DE44
P 5000 4000
F 0 "Up101" H 5000 3900 50  0000 C CNN
F 1 "DS2712" H 5000 4100 50  0000 C CNN
F 2 "MODULE" H 5000 4000 50  0001 C CNN
F 3 "DOCUMENTATION" H 5000 4000 50  0001 C CNN
	1    5000 4000
	1    0    0    -1  
$EndComp
$EndSCHEMATC

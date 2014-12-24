EESchema Schematic File Version 2  date Wed 24 Dec 2014 12:18:47 AM HST
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
Sheet 3 4
Title "Battery Charger"
Date "24 dec 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L LDO Up101
U 1 1 549A8F09
P 4500 2100
F 0 "Up101" H 4500 2250 60  0000 C CNN
F 1 "LDO" H 4700 1950 60  0000 C CNN
F 2 "TO220_LDO" H 4500 2350 60  0000 C CNN
	1    4500 2100
	1    0    0    -1  
$EndComp
Text Notes 7500 1500 0    60   ~ 0
Stack:\n0.3 -- 0.6 V regulator\n1.2 V regulator feedback\n1.2-1.5 V battery\n1.2-1.5 V battery\n4.8 V  <- sum \n\nless than 5V input
Text Notes 5300 2800 0    60   ~ 0
Idea is connect to \nbattery, not reg
Wire Wire Line
	6100 2700 5200 2700
Connection ~ 6100 2100
Wire Wire Line
	6100 2700 6100 2100
Wire Wire Line
	5750 2100 6500 2100
Wire Wire Line
	3500 3550 3500 3450
Connection ~ 3500 2100
Wire Wire Line
	3500 2300 3500 2100
Wire Wire Line
	5200 2700 5200 2950
Wire Wire Line
	5200 4550 5200 4750
Wire Wire Line
	5200 3450 5200 4050
Connection ~ 6500 2400
Wire Wire Line
	6700 2400 6500 2400
Wire Wire Line
	6500 4300 6500 4000
Connection ~ 6500 3300
Wire Wire Line
	6600 3300 6500 3300
Wire Wire Line
	6500 2100 6500 2500
Wire Wire Line
	6500 3100 6500 3400
Wire Wire Line
	6700 4100 6500 4100
Connection ~ 6500 4100
Wire Wire Line
	2500 2300 2700 2300
Wire Wire Line
	2700 2300 2700 2500
Wire Wire Line
	5200 3650 5300 3650
Connection ~ 5200 3650
Wire Wire Line
	4100 2100 2500 2100
Wire Wire Line
	3500 2700 3500 2950
Wire Wire Line
	4900 2100 5250 2100
Wire Wire Line
	5900 2100 5900 2500
Connection ~ 5900 2100
Wire Wire Line
	5900 2500 4500 2500
Wire Wire Line
	4500 2500 4500 2400
Text Label 3500 2800 0    60   ~ 0
V_p1
Text Label 5000 2100 0    60   ~ 0
V_fb
Text Label 5200 4750 3    60   ~ 0
V_bat_neg
Text Label 3500 3550 3    60   ~ 0
V_bat_neg
Text Label 6500 4200 2    60   ~ 0
V_bat_neg
Text Notes 5000 1500 0    60   ~ 0
Voltage across R -> 1.2 Volt\n1 ohm -> approx. 1.2 Amp (0.24 W dissipation)\n6 ohm -> approx. 0.2 Amp (0.12 W ..)\n(1.2 V / Rsense) -> charge current
Text Notes 7000 3000 0    60   ~ 0
Mount holders w/ \n#2 screws (0.098" dia holes)\n
Text HLabel 5300 3650 2    60   Output ~ 0
charge_status
Text Label 6600 3300 0    60   ~ 0
V_bat_mid
Text Label 5200 3550 2    60   ~ 0
thm1
$Comp
L GND #PWR08
U 1 1 53DB304B
P 6500 4300
F 0 "#PWR08" H 6500 4300 30  0001 C CNN
F 1 "GND" H 6500 4230 30  0001 C CNN
	1    6500 4300
	1    0    0    -1  
$EndComp
$Comp
L BATTERY BTp102
U 1 1 53DA259B
P 6500 3700
F 0 "BTp102" H 6500 3900 50  0000 C CNN
F 1 "BATTERY" H 6500 3510 50  0000 C CNN
F 2 "PIN_ARRAY_2X1" H 6500 4000 60  0000 C CNN
	1    6500 3700
	0    1    1    0   
$EndComp
$Comp
L BATTERY BTp101
U 1 1 53DA2480
P 6500 2800
F 0 "BTp101" H 6500 3000 50  0000 C CNN
F 1 "BATTERY" H 6500 2610 50  0000 C CNN
F 2 "PIN_ARRAY_2X1" H 6500 3100 60  0000 C CNN
	1    6500 2800
	0    1    1    0   
$EndComp
$Comp
L R Rp102
U 1 1 53DA2133
P 3500 3200
F 0 "Rp102" V 3580 3200 50  0000 C CNN
F 1 "270" V 3500 3200 50  0000 C CNN
F 2 "SM1206" V 3700 3200 60  0000 C CNN
	1    3500 3200
	1    0    0    -1  
$EndComp
$Comp
L LED Dp101
U 1 1 53DA211C
P 3500 2500
F 0 "Dp101" H 3500 2600 50  0000 C CNN
F 1 "LED" H 3500 2400 50  0000 C CNN
F 2 "SM1206" H 3500 2300 60  0000 C CNN
	1    3500 2500
	0    1    1    0   
$EndComp
$Comp
L GND #PWR09
U 1 1 53DA0DD7
P 2700 2500
F 0 "#PWR09" H 2700 2500 30  0001 C CNN
F 1 "GND" H 2700 2430 30  0001 C CNN
	1    2700 2500
	1    0    0    -1  
$EndComp
$Comp
L R Rp101
U 1 1 53DA0CB2
P 5500 2100
F 0 "Rp101" V 5580 2100 50  0000 C CNN
F 1 "330" V 5500 2100 50  0000 C CNN
F 2 "SM1206" V 5650 2100 60  0000 C CNN
	1    5500 2100
	0    -1   -1   0   
$EndComp
Text HLabel 6700 4100 2    60   Output ~ 0
battery_neg
Text HLabel 6700 2400 2    60   Output ~ 0
battery_pos
$Comp
L R Rp103
U 1 1 53D0E86D
P 5200 3200
F 0 "Rp103" V 5280 3200 50  0000 C CNN
F 1 "10k" V 5200 3200 50  0000 C CNN
F 2 "SM1206" V 5350 3200 60  0000 C CNN
	1    5200 3200
	-1   0    0    1   
$EndComp
$Comp
L THERMISTOR THp101
U 1 1 53D0E839
P 5200 4300
F 0 "THp101" V 5300 4350 50  0000 C CNN
F 1 "103AT-2" V 5100 4300 50  0000 C CNN
F 2 "PIN_ARRAY_2X1" V 5400 4300 60  0000 C CNN
	1    5200 4300
	1    0    0    -1  
$EndComp
Text HLabel 2500 2300 0    60   Input ~ 0
chgr_gnd
Text HLabel 2500 2100 0    60   Input ~ 0
+5V
$EndSCHEMATC

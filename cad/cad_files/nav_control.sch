EESchema Schematic File Version 2  date Wed 03 Dec 2014 05:34:03 PM HST
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
Sheet 2 4
Title ""
Date "4 dec 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	5500 2600 5600 2600
Wire Wire Line
	4500 2500 4500 2400
Wire Wire Line
	4500 2400 4600 2400
Wire Wire Line
	4600 2600 4300 2600
Wire Wire Line
	4300 2600 4300 1800
Connection ~ 6200 2200
Wire Wire Line
	6200 2200 6200 2000
Wire Wire Line
	3800 4800 4000 4800
Wire Wire Line
	3800 4500 4000 4500
Connection ~ 3100 6200
Wire Wire Line
	3100 6200 3200 6200
Wire Wire Line
	3200 6200 3200 6100
Wire Wire Line
	2700 3300 2700 3900
Wire Wire Line
	2900 3200 2900 3300
Wire Wire Line
	6500 2500 6200 2500
Wire Wire Line
	6200 2500 6200 2400
Connection ~ 2300 1000
Wire Wire Line
	2500 1000 5600 1000
Connection ~ 5600 2200
Wire Wire Line
	5600 2050 5600 2200
Wire Wire Line
	4100 2700 4100 2500
Wire Wire Line
	2500 1800 2300 1800
Wire Wire Line
	2300 1800 2300 1000
Connection ~ 4100 1800
Wire Wire Line
	4300 1800 4100 1800
Wire Wire Line
	3300 1200 3500 1200
Connection ~ 3300 1600
Wire Wire Line
	3500 1600 3300 1600
Wire Wire Line
	3300 2000 3300 1400
Wire Wire Line
	3100 1800 3300 1800
Connection ~ 3300 1800
Wire Wire Line
	3900 1600 4100 1600
Wire Wire Line
	3900 1200 4100 1200
Wire Wire Line
	4100 1200 4100 2000
Connection ~ 4100 1600
Wire Wire Line
	4500 1000 4500 2200
Wire Wire Line
	3300 2500 3300 2600
Wire Wire Line
	3300 2600 4100 2600
Connection ~ 4100 2600
Wire Wire Line
	5600 1000 5600 1550
Connection ~ 4500 1000
Wire Wire Line
	2000 1100 2200 1100
Wire Wire Line
	2200 1100 2200 1300
Wire Wire Line
	7100 2200 5500 2200
Wire Wire Line
	6500 2400 6400 2400
Wire Wire Line
	6500 2600 6400 2600
Wire Wire Line
	6400 2600 6400 2700
Wire Wire Line
	2900 3900 2900 3800
Wire Wire Line
	3100 6100 3100 6300
Wire Wire Line
	3800 4400 4000 4400
Wire Wire Line
	3800 4600 4000 4600
Wire Wire Line
	3800 4900 4000 4900
Wire Wire Line
	6400 2400 6400 2200
Connection ~ 6400 2200
Wire Wire Line
	4500 2200 4600 2200
Wire Wire Line
	3800 5000 4000 5000
Text Label 5600 2600 0    60   ~ 0
PWR_FAULT
Text Label 4000 5000 0    60   ~ 0
PWR_FAULT
$Comp
L GND #PWR?
U 1 1 547FD4F0
P 4500 2500
F 0 "#PWR?" H 4500 2500 30  0001 C CNN
F 1 "GND" H 4500 2430 30  0001 C CNN
	1    4500 2500
	1    0    0    -1  
$EndComp
$Comp
L FPF2100 Up301
U 1 1 547FD495
P 5050 2400
F 0 "Up301" H 5050 2300 60  0000 C CNN
F 1 "FPF2100" H 5050 2500 60  0000 C CNN
	1    5050 2400
	1    0    0    -1  
$EndComp
Text Notes 4900 4800 0    60   ~ 0
P6 to turn on LED (PWM: 3, 5, 6, 9, 10, 11)\nP7 to turn on  power (when running with a soft switch)
Text Label 4000 4900 0    50   ~ 0
uC_PWR_CTRL
Text Label 4000 4400 0    60   ~ 0
uC_PWR_SENSE
Text HLabel 4000 4500 2    60   Input ~ 0
charge_status
$Comp
L ARDUINO_PRO_MINI Uc101
U 1 1 547EB67E
P 3000 5000
F 0 "Uc101" H 3000 4900 50  0000 C CNN
F 1 "ARDUINO_PRO_MINI" V 3100 5350 50  0000 C CNN
F 2 "MODULE" H 3000 5000 50  0001 C CNN
F 3 "DOCUMENTATION" H 3000 5000 50  0001 C CNN
	1    3000 5000
	1    0    0    -1  
$EndComp
Text Label 2900 3200 1    60   ~ 0
Vppath
$Comp
L GND #PWR?
U 1 1 547E9671
P 3100 6300
F 0 "#PWR?" H 3100 6300 30  0001 C CNN
F 1 "GND" H 3100 6230 30  0001 C CNN
	1    3100 6300
	1    0    0    -1  
$EndComp
$Comp
L R Rc101
U 1 1 547E9539
P 2900 3550
F 0 "Rc101" V 2980 3550 50  0000 C CNN
F 1 "DNP" V 2900 3550 50  0000 C CNN
	1    2900 3550
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 547E94E8
P 2700 3300
F 0 "#PWR?" H 2700 3390 20  0001 C CNN
F 1 "+5V" H 2700 3390 30  0000 C CNN
	1    2700 3300
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 547E62DF
P 6200 2400
F 0 "#PWR?" H 6200 2490 20  0001 C CNN
F 1 "+5V" H 6200 2490 30  0000 C CNN
	1    6200 2400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 547E62B9
P 6400 2700
F 0 "#PWR?" H 6400 2700 30  0001 C CNN
F 1 "GND" H 6400 2630 30  0001 C CNN
	1    6400 2700
	1    0    0    -1  
$EndComp
Text Label 4000 1200 0    60   ~ 0
switch_control
$Comp
L GND #PWR?
U 1 1 547DAB88
P 2200 1300
F 0 "#PWR?" H 2200 1300 30  0001 C CNN
F 1 "GND" H 2200 1230 30  0001 C CNN
	1    2200 1300
	1    0    0    -1  
$EndComp
Text HLabel 7100 2200 2    60   Input ~ 0
powerpath_vdd
Text HLabel 4000 4600 2    60   Input ~ 0
led_status
Text HLabel 4000 4800 2    60   Output ~ 0
led_ctrl
Text HLabel 2000 1100 0    60   Input ~ 0
battery_neg
Text HLabel 2000 1000 0    60   Input ~ 0
battery_pos
Text Notes 7000 2450 0    60   ~ 0
Vbat\n+5V\nGND
Text Notes 5800 1700 0    60   ~ 0
for power switching \nbypass (always on)
$Comp
L R Rp303
U 1 1 547C6270
P 5600 1800
F 0 "Rp303" V 5680 1800 50  0000 C CNN
F 1 "DNP" V 5600 1800 50  0000 C CNN
	1    5600 1800
	1    0    0    -1  
$EndComp
Text Notes 6500 2800 0    60   ~ 0
header for power supply \n(boost  to 3.3 or 5 V)\ncheck rotation...
$Comp
L CONN_3 Kp301
U 1 1 546DDB52
P 6850 2500
F 0 "Kp301" V 6800 2500 50  0000 C CNN
F 1 "CONN_3" V 6900 2500 40  0000 C CNN
	1    6850 2500
	1    0    0    -1  
$EndComp
Text Notes 4050 4050 0    60   ~ 0
jumper towards DS2712::LED1 for charger activity monitoring
Text Notes 4900 4400 0    60   ~ 0
P2 (INT0) for power button sensing\nP3 (INT1) for charger status sensing\nP4 for led status sensing (polled)
$Comp
L GND #PWR?
U 1 1 53DB8078
P 4100 2700
F 0 "#PWR?" H 4100 2700 30  0001 C CNN
F 1 "GND" H 4100 2630 30  0001 C CNN
	1    4100 2700
	1    0    0    -1  
$EndComp
Text Label 3300 1400 2    60   ~ 0
uC_PWR_SENSE
Text Label 3300 1200 2    60   ~ 0
uC_PWR_CTRL
Text Label 6200 2000 0    60   ~ 0
Vppath
$Comp
L DIODE Dp301
U 1 1 53D1B1A5
P 3700 1200
F 0 "Dp301" H 3700 1300 40  0000 C CNN
F 1 "DIODE" H 3700 1100 40  0000 C CNN
	1    3700 1200
	1    0    0    -1  
$EndComp
$Comp
L DIODE Dp302
U 1 1 53D1B19F
P 3700 1600
F 0 "Dp302" H 3700 1700 40  0000 C CNN
F 1 "DIODE" H 3700 1500 40  0000 C CNN
	1    3700 1600
	1    0    0    -1  
$EndComp
$Comp
L R Rp302
U 1 1 53D1B197
P 4100 2250
F 0 "Rp302" V 4180 2250 50  0000 C CNN
F 1 "R" V 4100 2250 50  0000 C CNN
	1    4100 2250
	1    0    0    -1  
$EndComp
$Comp
L R Rp301
U 1 1 53D1B192
P 3300 2250
F 0 "Rp301" V 3380 2250 50  0000 C CNN
F 1 "R" V 3300 2250 50  0000 C CNN
	1    3300 2250
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SWp301
U 1 1 53D1B188
P 2800 1800
F 0 "SWp301" H 2950 1910 50  0000 C CNN
F 1 "SW_PUSH" H 2800 1720 50  0000 C CNN
	1    2800 1800
	1    0    0    -1  
$EndComp
$EndSCHEMATC

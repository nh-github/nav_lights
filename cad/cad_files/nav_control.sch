EESchema Schematic File Version 2  date Wed 03 Dec 2014 01:00:34 PM HST
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
Date "3 dec 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Connection ~ 5900 2200
Wire Wire Line
	5900 2200 5900 2400
Wire Wire Line
	3800 4900 4000 4900
Wire Wire Line
	3800 4600 4000 4600
Wire Wire Line
	3800 4400 4000 4400
Wire Wire Line
	3100 6100 3100 6300
Wire Wire Line
	2900 3900 2900 3800
Wire Wire Line
	5900 2700 5900 2600
Wire Wire Line
	5900 2600 6000 2600
Wire Wire Line
	5900 2400 6000 2400
Wire Wire Line
	6600 2200 4800 2200
Wire Wire Line
	2200 1300 2200 1100
Wire Wire Line
	2200 1100 2000 1100
Connection ~ 4800 1000
Wire Wire Line
	5100 1550 5100 1000
Connection ~ 4100 2600
Wire Wire Line
	4100 2600 3300 2600
Wire Wire Line
	3300 2600 3300 2500
Wire Wire Line
	4800 1600 4800 1000
Wire Wire Line
	4800 2200 4800 2000
Connection ~ 4100 1600
Wire Wire Line
	4100 2000 4100 1200
Wire Wire Line
	4100 1200 3900 1200
Wire Wire Line
	3900 1600 4100 1600
Connection ~ 3300 1800
Wire Wire Line
	3100 1800 3300 1800
Wire Wire Line
	3300 2000 3300 1400
Wire Wire Line
	3300 1600 3500 1600
Connection ~ 3300 1600
Wire Wire Line
	3300 1200 3500 1200
Wire Wire Line
	4100 1800 4500 1800
Connection ~ 4100 1800
Wire Wire Line
	2300 1000 2300 1800
Wire Wire Line
	2300 1800 2500 1800
Wire Wire Line
	4100 2700 4100 2500
Wire Wire Line
	5100 2050 5100 2200
Connection ~ 5100 2200
Wire Wire Line
	5100 1000 2000 1000
Connection ~ 2300 1000
Wire Wire Line
	5700 2400 5700 2500
Wire Wire Line
	5700 2500 6000 2500
Wire Wire Line
	2900 3200 2900 3300
Wire Wire Line
	2700 3300 2700 3900
Wire Wire Line
	3200 6100 3200 6200
Wire Wire Line
	3200 6200 3100 6200
Connection ~ 3100 6200
Wire Wire Line
	3800 4500 4000 4500
Wire Wire Line
	3800 4800 4000 4800
Wire Wire Line
	5700 2000 5700 2200
Connection ~ 5700 2200
Text Notes 4900 4800 0    60   ~ 0
P6 to turn on LED (PWM: 3, 5, 6, 9, 10, 11)\nP7 to turn on  power (when running with a soft switch)
Text Label 4000 4900 0    50   ~ 0
uC_PWR_CTRL
Text Label 4000 4400 0    60   ~ 0
uC_PWR_SENSE
Text HLabel 4000 4500 2    60   Input ~ 0
charge_status
$Comp
L ARDUINO_PRO_MINI U?
U 1 1 547EB67E
P 3000 5000
F 0 "U?" H 3000 4900 50  0000 C CNN
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
L R R?
U 1 1 547E9539
P 2900 3550
F 0 "R?" V 2980 3550 50  0000 C CNN
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
P 5700 2400
F 0 "#PWR?" H 5700 2490 20  0001 C CNN
F 1 "+5V" H 5700 2490 30  0000 C CNN
	1    5700 2400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 547E62B9
P 5900 2700
F 0 "#PWR?" H 5900 2700 30  0001 C CNN
F 1 "GND" H 5900 2630 30  0001 C CNN
	1    5900 2700
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
Text HLabel 6600 2200 2    60   Input ~ 0
powerpath_vdd
Text HLabel 4000 4600 2    60   Input ~ 0
led_status
Text HLabel 4000 4800 2    60   Output ~ 0
led_ctrl
Text HLabel 2000 1100 0    60   Input ~ 0
battery_neg
Text HLabel 2000 1000 0    60   Input ~ 0
battery_pos
Text Notes 6500 2450 0    60   ~ 0
Vbat\n+5V\nGND
Text Notes 5300 1700 0    60   ~ 0
for power switching \nbypass (always on)
$Comp
L R R?
U 1 1 547C6270
P 5100 1800
F 0 "R?" V 5180 1800 50  0000 C CNN
F 1 "DNP" V 5100 1800 50  0000 C CNN
	1    5100 1800
	1    0    0    -1  
$EndComp
Text Notes 6000 2800 0    60   ~ 0
header for power supply \n(boost  to 3.3 or 5 V)\ncheck rotation...
$Comp
L CONN_3 K?
U 1 1 546DDB52
P 6350 2500
F 0 "K?" V 6300 2500 50  0000 C CNN
F 1 "CONN_3" V 6400 2500 40  0000 C CNN
	1    6350 2500
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
Text Label 5700 2000 0    60   ~ 0
Vppath
$Comp
L MOSFET_P Q?
U 1 1 53D1B1AA
P 4700 1800
F 0 "Q?" H 4700 1990 60  0000 R CNN
F 1 "MOSFET_P" H 4700 1620 60  0000 R CNN
	1    4700 1800
	1    0    0    -1  
$EndComp
$Comp
L DIODE D?
U 1 1 53D1B1A5
P 3700 1200
F 0 "D?" H 3700 1300 40  0000 C CNN
F 1 "DIODE" H 3700 1100 40  0000 C CNN
	1    3700 1200
	1    0    0    -1  
$EndComp
$Comp
L DIODE D?
U 1 1 53D1B19F
P 3700 1600
F 0 "D?" H 3700 1700 40  0000 C CNN
F 1 "DIODE" H 3700 1500 40  0000 C CNN
	1    3700 1600
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 53D1B197
P 4100 2250
F 0 "R?" V 4180 2250 50  0000 C CNN
F 1 "R" V 4100 2250 50  0000 C CNN
	1    4100 2250
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 53D1B192
P 3300 2250
F 0 "R?" V 3380 2250 50  0000 C CNN
F 1 "R" V 3300 2250 50  0000 C CNN
	1    3300 2250
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW?
U 1 1 53D1B188
P 2800 1800
F 0 "SW?" H 2950 1910 50  0000 C CNN
F 1 "SW_PUSH" H 2800 1720 50  0000 C CNN
	1    2800 1800
	1    0    0    -1  
$EndComp
$EndSCHEMATC

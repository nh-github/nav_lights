EESchema Schematic File Version 2  date Tue 02 Dec 2014 02:12:38 AM HST
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
Date "2 dec 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 4000 1200 0    60   ~ 0
switch_control
Wire Wire Line
	9000 1000 8800 1000
Connection ~ 2300 1000
Wire Wire Line
	2000 1000 4900 1000
Connection ~ 4900 2200
Wire Wire Line
	4900 2050 4900 2200
Wire Wire Line
	4100 2700 4100 2500
Wire Wire Line
	2500 1800 2300 1800
Wire Wire Line
	2300 1800 2300 1000
Connection ~ 4100 1800
Wire Wire Line
	4100 1800 4300 1800
Wire Wire Line
	3300 1200 3500 1200
Connection ~ 3300 1600
Wire Wire Line
	3300 1600 3500 1600
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
	5100 2200 4600 2200
Wire Wire Line
	4600 2200 4600 2000
Wire Wire Line
	4600 1000 4600 1600
Wire Wire Line
	3300 2500 3300 2600
Wire Wire Line
	3300 2600 4100 2600
Connection ~ 4100 2600
Wire Wire Line
	4900 1000 4900 1550
Connection ~ 4600 1000
Wire Wire Line
	2000 1100 2200 1100
Wire Wire Line
	2200 1100 2200 1300
Text Label 8800 1000 2    60   ~ 0
Vppath
$Comp
L GND #PWR?
U 1 1 547DAB88
P 2200 1300
F 0 "#PWR?" H 2200 1300 30  0001 C CNN
F 1 "GND" H 2200 1230 30  0001 C CNN
	1    2200 1300
	1    0    0    -1  
$EndComp
Text HLabel 9000 1000 2    60   Input ~ 0
powerpath_vdd
Text HLabel 9000 1100 2    60   Input ~ 0
led_status
Text HLabel 9000 1200 2    60   Output ~ 0
led_ctrl
Text HLabel 2000 1100 0    60   Input ~ 0
battery_neg
Text HLabel 2000 1000 0    60   Input ~ 0
battery_pos
Text Notes 6150 4200 0    60   ~ 0
Arduino pro mini 3.3/5  (footprint? pinout?)
Text Notes 4950 2600 0    60   ~ 0
Vbat\n+5V\nGND\npinout order? \nrotation?
Text Notes 5100 1700 0    60   ~ 0
for power switching \nbypass (always on)
$Comp
L R R?
U 1 1 547C6270
P 4900 1800
F 0 "R?" V 4980 1800 50  0000 C CNN
F 1 "R" V 4900 1800 50  0000 C CNN
	1    4900 1800
	1    0    0    -1  
$EndComp
Text Notes 5600 2800 0    60   ~ 0
header for power supply \n(boost  to 3.3 or 5 V)
$Comp
L CONN_3 K?
U 1 1 546DDB52
P 6250 2550
F 0 "K?" V 6200 2550 50  0000 C CNN
F 1 "CONN_3" V 6300 2550 40  0000 C CNN
	1    6250 2550
	1    0    0    -1  
$EndComp
Text Notes 7600 5450 0    60   ~ 0
jumper towards DS2712::LED1 for charger activity monitoring
Text Notes 7600 5550 0    60   ~ 0
PC3 - jumper to LED driver for control
Text Notes 7600 5750 0    60   ~ 0
Use for temp sensing and other I2C
Text Notes 7600 6300 0    60   ~ 0
INT0/INT1 for detecting button push
Text Notes 7600 6100 0    60   ~ 0
RS232 - style serial port for debug
Text Notes 7600 4900 0    60   ~ 0
ICSP
Text Notes 7600 5100 0    60   ~ 0
8 MHz clock crystal setup a la ardu pro 3V3
$Comp
L CONN_6 P?
U 1 1 53DE4465
P 8350 4650
F 0 "P?" V 8300 4650 60  0000 C CNN
F 1 "CONN_6" V 8400 4650 60  0000 C CNN
	1    8350 4650
	1    0    0    -1  
$EndComp
$Comp
L ATMEGA328P-P IC?
U 1 1 53DE42CE
P 6500 5500
F 0 "IC?" H 5800 6750 50  0000 L BNN
F 1 "ATMEGA328P-P" H 6700 4100 50  0000 L BNN
F 2 "DIL28" H 5900 4150 50  0001 C CNN
	1    6500 5500
	1    0    0    -1  
$EndComp
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
Text Label 5100 2200 0    60   ~ 0
Vppath
$Comp
L MOSFET_P Q?
U 1 1 53D1B1AA
P 4500 1800
F 0 "Q?" H 4500 1990 60  0000 R CNN
F 1 "MOSFET_P" H 4500 1620 60  0000 R CNN
	1    4500 1800
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

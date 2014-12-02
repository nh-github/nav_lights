EESchema Schematic File Version 2  date Mon 01 Dec 2014 02:47:20 AM HST
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
Sheet 3 5
Title ""
Date "1 dec 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 4500 3000 0    60   ~ 0
Arduino pro mini 3.3/5  (footprint? pinout?)
Text Notes 5150 1650 0    60   ~ 0
Vbat\n+5V\nGND\npinout order? rotation?
Text Notes 9800 1900 0    60   ~ 0
for power switching \nbypass (always on)
Connection ~ 9300 1200
Wire Wire Line
	9600 1200 7000 1200
Wire Wire Line
	9600 1200 9600 1750
Connection ~ 8800 2800
Wire Wire Line
	8800 2800 8000 2800
Wire Wire Line
	8000 2800 8000 2700
Wire Wire Line
	9300 1200 9300 1800
Wire Wire Line
	9300 2200 9300 2400
Wire Wire Line
	9300 2400 9800 2400
Connection ~ 8800 1800
Wire Wire Line
	8800 2200 8800 1400
Wire Wire Line
	8800 1400 8600 1400
Wire Wire Line
	8600 1800 8800 1800
Connection ~ 8000 2000
Wire Wire Line
	7800 2000 8000 2000
Wire Wire Line
	8000 2200 8000 1600
Wire Wire Line
	8000 1800 8200 1800
Connection ~ 8000 1800
Wire Wire Line
	8000 1400 8200 1400
Wire Wire Line
	8800 2000 9000 2000
Connection ~ 8800 2000
Wire Wire Line
	7000 1200 7000 2000
Wire Wire Line
	7000 2000 7200 2000
Wire Wire Line
	8800 2900 8800 2700
Wire Wire Line
	9600 2250 9600 2400
Connection ~ 9600 2400
$Comp
L R R?
U 1 1 547C6270
P 9600 2000
F 0 "R?" V 9680 2000 50  0000 C CNN
F 1 "R" V 9600 2000 50  0000 C CNN
	1    9600 2000
	1    0    0    -1  
$EndComp
Text Notes 5100 2400 0    60   ~ 0
header for power supply \n(boost  to 3.3 or 5 V)
$Comp
L CONN_3 K?
U 1 1 546DDB52
P 5750 2150
F 0 "K?" V 5700 2150 50  0000 C CNN
F 1 "CONN_3" V 5800 2150 40  0000 C CNN
	1    5750 2150
	1    0    0    -1  
$EndComp
Text Notes 6100 4450 0    60   ~ 0
jumper towards DS2712::LED1 for charger activity monitoring
Text Notes 6100 4550 0    60   ~ 0
PC3 - jumper to LED driver for control
Text Notes 6100 4750 0    60   ~ 0
Use for temp sensing and other I2C
Text Notes 6100 5300 0    60   ~ 0
INT0/INT1 for detecting button push
Text Notes 6100 5100 0    60   ~ 0
RS232 - style serial port for debug
Text Notes 6100 3900 0    60   ~ 0
ICSP
Text Notes 6100 4100 0    60   ~ 0
8 MHz clock crystal setup a la ardu pro 3V3
$Comp
L CONN_6 P?
U 1 1 53DE4465
P 6850 3650
F 0 "P?" V 6800 3650 60  0000 C CNN
F 1 "CONN_6" V 6900 3650 60  0000 C CNN
	1    6850 3650
	1    0    0    -1  
$EndComp
$Comp
L ATMEGA328P-P IC?
U 1 1 53DE42CE
P 5000 4500
F 0 "IC?" H 4300 5750 50  0000 L BNN
F 1 "ATMEGA328P-P" H 5200 3100 50  0000 L BNN
F 2 "DIL28" H 4400 3150 50  0001 C CNN
	1    5000 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 53DB8078
P 8800 2900
F 0 "#PWR?" H 8800 2900 30  0001 C CNN
F 1 "GND" H 8800 2830 30  0001 C CNN
	1    8800 2900
	1    0    0    -1  
$EndComp
Text Label 7000 1200 2    60   ~ 0
raw_batt
Text Label 8000 1600 2    60   ~ 0
uC_PWR_SENSE
Text Label 8000 1400 2    60   ~ 0
uC_PWR_CTRL
Text Label 9800 2400 0    60   ~ 0
Vbat
$Comp
L MOSFET_P Q?
U 1 1 53D1B1AA
P 9200 2000
F 0 "Q?" H 9200 2190 60  0000 R CNN
F 1 "MOSFET_P" H 9200 1820 60  0000 R CNN
	1    9200 2000
	1    0    0    -1  
$EndComp
$Comp
L DIODE D?
U 1 1 53D1B1A5
P 8400 1400
F 0 "D?" H 8400 1500 40  0000 C CNN
F 1 "DIODE" H 8400 1300 40  0000 C CNN
	1    8400 1400
	1    0    0    -1  
$EndComp
$Comp
L DIODE D?
U 1 1 53D1B19F
P 8400 1800
F 0 "D?" H 8400 1900 40  0000 C CNN
F 1 "DIODE" H 8400 1700 40  0000 C CNN
	1    8400 1800
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 53D1B197
P 8800 2450
F 0 "R?" V 8880 2450 50  0000 C CNN
F 1 "R" V 8800 2450 50  0000 C CNN
	1    8800 2450
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 53D1B192
P 8000 2450
F 0 "R?" V 8080 2450 50  0000 C CNN
F 1 "R" V 8000 2450 50  0000 C CNN
	1    8000 2450
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW?
U 1 1 53D1B188
P 7500 2000
F 0 "SW?" H 7650 2110 50  0000 C CNN
F 1 "SW_PUSH" H 7500 1920 50  0000 C CNN
	1    7500 2000
	1    0    0    -1  
$EndComp
$EndSCHEMATC

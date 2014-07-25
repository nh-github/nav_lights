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
Sheet 3 5
Title ""
Date "25 jul 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 6650 1950 2    60   ~ 0
raw_batt
Text Label 7750 1450 2    60   ~ 0
uC_PWR_SENSE
Text Label 7750 1200 2    60   ~ 0
uC_PWR_CTRL
Text Label 8900 700  0    60   ~ 0
raw_batt
Text Label 9300 1500 0    60   ~ 0
Vbat
$Comp
L MOSFET_P Q?
U 1 1 53D1B1AA
P 9100 1200
F 0 "Q?" H 9100 1390 60  0000 R CNN
F 1 "MOSFET_P" H 9100 1020 60  0000 R CNN
	1    9100 1200
	1    0    0    -1  
$EndComp
$Comp
L DIODE D?
U 1 1 53D1B1A5
P 8300 1250
F 0 "D?" H 8300 1350 40  0000 C CNN
F 1 "DIODE" H 8300 1150 40  0000 C CNN
	1    8300 1250
	1    0    0    -1  
$EndComp
$Comp
L DIODE D?
U 1 1 53D1B19F
P 8300 1650
F 0 "D?" H 8300 1750 40  0000 C CNN
F 1 "DIODE" H 8300 1550 40  0000 C CNN
	1    8300 1650
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 53D1B197
P 8550 2250
F 0 "R?" V 8630 2250 50  0000 C CNN
F 1 "R" V 8550 2250 50  0000 C CNN
	1    8550 2250
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 53D1B192
P 8000 2250
F 0 "R?" V 8080 2250 50  0000 C CNN
F 1 "R" V 8000 2250 50  0000 C CNN
	1    8000 2250
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW?
U 1 1 53D1B188
P 7250 1750
F 0 "SW?" H 7400 1860 50  0000 C CNN
F 1 "SW_PUSH" H 7250 1670 50  0000 C CNN
	1    7250 1750
	1    0    0    -1  
$EndComp
$EndSCHEMATC

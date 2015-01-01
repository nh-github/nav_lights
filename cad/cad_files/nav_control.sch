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
Sheet 2 4
Title ""
Date "1 jan 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	4000 5100 3800 5100
Connection ~ 1000 5800
Wire Wire Line
	1400 5700 1400 5800
Wire Wire Line
	1400 5800 1000 5800
Connection ~ 1000 4300
Wire Wire Line
	1000 4300 1400 4300
Wire Wire Line
	1400 4300 1400 4400
Connection ~ 1400 5100
Wire Wire Line
	2200 5100 1400 5100
Connection ~ 1000 5000
Wire Wire Line
	1000 5200 1000 4900
Wire Wire Line
	6900 2600 6400 2600
Wire Wire Line
	6400 2600 6400 2500
Wire Wire Line
	3800 5000 4000 5000
Wire Wire Line
	4800 2200 4700 2200
Connection ~ 6800 2200
Wire Wire Line
	6800 2200 6800 2500
Wire Wire Line
	3800 4900 4000 4900
Wire Wire Line
	3800 4600 4000 4600
Wire Wire Line
	3800 4400 4000 4400
Wire Wire Line
	3100 6100 3100 6300
Wire Wire Line
	2900 3900 2900 3700
Wire Wire Line
	6800 2800 6800 2700
Wire Wire Line
	6800 2700 6900 2700
Wire Wire Line
	6800 2500 6900 2500
Wire Wire Line
	7300 2200 5700 2200
Wire Wire Line
	2000 1100 2200 1100
Connection ~ 4700 1000
Wire Wire Line
	5800 1550 5800 1000
Connection ~ 4100 2600
Wire Wire Line
	4100 2600 3300 2600
Wire Wire Line
	3300 2600 3300 2500
Wire Wire Line
	4700 2200 4700 1000
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
	5800 2200 5800 2050
Connection ~ 5800 2200
Wire Wire Line
	5800 1000 2000 1000
Connection ~ 2300 1000
Wire Wire Line
	2900 3100 2900 3200
Wire Wire Line
	2700 3100 2700 3900
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
	6600 2200 6600 2000
Connection ~ 6600 2200
Wire Wire Line
	4500 1800 4500 2600
Wire Wire Line
	4500 2600 4800 2600
Wire Wire Line
	4800 2400 4700 2400
Wire Wire Line
	4700 2400 4700 2500
Wire Wire Line
	5700 2600 5800 2600
Wire Wire Line
	2500 1000 2500 800 
Connection ~ 2500 1000
Wire Wire Line
	2900 3800 3200 3800
Wire Wire Line
	3200 3800 3200 3700
Connection ~ 2900 3800
Wire Wire Line
	2200 5000 1000 5000
Wire Wire Line
	1400 4900 1400 5200
Wire Wire Line
	1000 4200 1000 4400
Wire Wire Line
	1000 5900 1000 5700
Wire Wire Line
	2200 1100 2200 800 
Text HLabel 4000 5100 2    60   Output ~ 0
misc_status
Text Label 1000 4200 1    60   ~ 0
Vboosted
Text Label 2700 3100 1    60   ~ 0
Vboosted
Text Label 6800 2600 2    60   ~ 0
Vboosted
Text Label 3100 6300 3    60   ~ 0
battery_neg
Text Label 1000 5900 3    60   ~ 0
battery_neg
Text Label 3200 3800 0    60   ~ 0
ctrl_uc_vraw
Text Label 2100 5000 2    60   ~ 0
ctrl_temp_sm
Text Label 2100 5100 2    60   ~ 0
ctrl_temp_th
Text Label 2200 1100 3    60   ~ 0
battery_neg
Text Notes 4900 5400 0    60   ~ 0
Extra LEDs (w/ limiting resistors) \non the unused pins?
$Comp
L THERMISTOR THc101
U 1 1 54868248
P 1000 5450
F 0 "THc101" V 1100 5500 50  0000 C CNN
F 1 "10k" V 900 5450 50  0000 C CNN
F 2 "SM1206" V 1200 5450 60  0000 C CNN
F 4 "541-1150-1-ND" V 800 5450 60  0000 C CNN "digikey"
	1    1000 5450
	1    0    0    -1  
$EndComp
$Comp
L R Rc102
U 1 1 54868245
P 1000 4650
F 0 "Rc102" V 1080 4650 50  0000 C CNN
F 1 "10k" V 1000 4650 50  0000 C CNN
F 2 "SM1206" V 1200 4650 60  0000 C CNN
F 4 "1276-5742-1-ND" V 900 4650 60  0000 C CNN "digikey"
	1    1000 4650
	1    0    0    -1  
$EndComp
$Comp
L THERMISTOR THc102
U 1 1 548681F5
P 1400 5450
F 0 "THc102" V 1500 5500 50  0000 C CNN
F 1 "10k" V 1300 5450 50  0000 C CNN
F 2 "PIN_ARRAY_2X1" V 1600 5400 60  0000 C CNN
F 4 "615-1054-ND" V 1700 5450 60  0000 C CNN "digikey"
	1    1400 5450
	1    0    0    -1  
$EndComp
$Comp
L R Rc103
U 1 1 548681C7
P 1400 4650
F 0 "Rc103" V 1480 4650 50  0000 C CNN
F 1 "10k" V 1400 4650 50  0000 C CNN
F 2 "R3-LARGE_PADS" V 1600 4800 60  0000 C CNN
F 4 "A105970CT-ND" V 1700 4800 60  0000 C CNN "digikey"
	1    1400 4650
	1    0    0    -1  
$EndComp
Text Notes 4900 5100 0    60   ~ 0
A0 / A1 thermistor or similar for monitoring \nLED temperature (maybe battery too)
$Comp
L PWR_FLAG #FLG01
U 1 1 547FD8F3
P 2200 800
F 0 "#FLG01" H 2200 895 30  0001 C CNN
F 1 "PWR_FLAG" H 2200 980 30  0000 C CNN
	1    2200 800 
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG02
U 1 1 547FD8C6
P 3200 3700
F 0 "#FLG02" H 3200 3795 30  0001 C CNN
F 1 "PWR_FLAG" H 3200 3880 30  0000 C CNN
	1    3200 3700
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG03
U 1 1 547FD79D
P 2500 800
F 0 "#FLG03" H 2500 895 30  0001 C CNN
F 1 "PWR_FLAG" H 2500 980 30  0000 C CNN
	1    2500 800 
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG04
U 1 1 547FD75C
P 6400 2500
F 0 "#FLG04" H 6400 2595 30  0001 C CNN
F 1 "PWR_FLAG" H 6400 2680 30  0000 C CNN
	1    6400 2500
	1    0    0    -1  
$EndComp
NoConn ~ 3800 5500
NoConn ~ 3800 5400
NoConn ~ 3800 5300
NoConn ~ 3800 5200
NoConn ~ 3800 4700
NoConn ~ 2200 5700
NoConn ~ 2200 5600
NoConn ~ 2200 5500
NoConn ~ 2200 5400
NoConn ~ 2200 5300
NoConn ~ 2200 5200
NoConn ~ 2200 4800
NoConn ~ 2200 4700
NoConn ~ 2200 4600
NoConn ~ 2200 4500
Text Label 5800 2600 0    60   ~ 0
PWR_FAULT
Text Label 4000 5000 0    60   ~ 0
PWR_FAULT
$Comp
L GND #PWR05
U 1 1 547FD4F0
P 4700 2500
F 0 "#PWR05" H 4700 2500 30  0001 C CNN
F 1 "GND" H 4700 2430 30  0001 C CNN
	1    4700 2500
	1    0    0    -1  
$EndComp
$Comp
L FPF2100 Up301
U 1 1 547FD495
P 5250 2400
F 0 "Up301" H 5250 2300 60  0000 C CNN
F 1 "FPF2100" H 5250 2500 60  0000 C CNN
F 2 "SOT23-5" H 5250 2000 60  0000 C CNN
F 4 "FPF2103CT-ND" H 5250 2400 60  0000 C CNN "digikey"
	1    5250 2400
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
F 2 "DIP-24__600_ELL" V 3200 5300 50  0000 C CNN
F 3 "DOCUMENTATION" H 3000 5000 50  0001 C CNN
	1    3000 5000
	1    0    0    -1  
$EndComp
Text Label 2900 3100 1    60   ~ 0
Vppath
$Comp
L R Rc101
U 1 1 547E9539
P 2900 3450
F 0 "Rc101" V 2980 3450 50  0000 C CNN
F 1 "DNP" V 2900 3450 50  0000 C CNN
F 2 "R4-LARGE_PADS" V 3050 3450 60  0000 C CNN
F 4 "JW50ZT0R00CT-ND" V 2800 3450 60  0000 C CNN "digikey"
	1    2900 3450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 547E62B9
P 6800 2800
F 0 "#PWR06" H 6800 2800 30  0001 C CNN
F 1 "GND" H 6800 2730 30  0001 C CNN
	1    6800 2800
	1    0    0    -1  
$EndComp
Text Label 4100 1200 0    60   ~ 0
switch_control
Text HLabel 7300 2200 2    60   Input ~ 0
powerpath_vdd
Text HLabel 4000 4600 2    60   Input ~ 0
led_status
Text HLabel 4000 4800 2    60   Output ~ 0
led_ctrl
Text HLabel 2000 1100 0    60   Input ~ 0
battery_neg
Text HLabel 2000 1000 0    60   Input ~ 0
battery_pos
Text Notes 7700 2550 0    60   ~ 0
GND      top of\nvout  ...board...\nVbat  
Text Notes 6100 1700 0    60   ~ 0
for power switching \nbypass (always on)
$Comp
L R Rp303
U 1 1 547C6270
P 5800 1800
F 0 "Rp303" V 5880 1800 50  0000 C CNN
F 1 "DNP" V 5800 1800 50  0000 C CNN
F 2 "SM1206" V 6000 1800 60  0000 C CNN
	1    5800 1800
	1    0    0    -1  
$EndComp
Text Notes 6900 3000 0    60   ~ 0
header for power supply \n(boost  to 3.3 or 5 V)\ncheck rotation...\nNCP1402 based \nPRT-10967
$Comp
L CONN_3 Kp301
U 1 1 546DDB52
P 7250 2600
F 0 "Kp301" V 7200 2600 50  0000 C CNN
F 1 "CONN_3" V 7300 2600 40  0000 C CNN
F 2 "PIN_ARRAY_3X1" H 7250 2400 60  0000 C CNN
	1    7250 2600
	1    0    0    -1  
$EndComp
Text Notes 4050 4050 0    60   ~ 0
jumper towards DS2712::LED1 for charger activity monitoring
Text Notes 4900 4400 0    60   ~ 0
P2 (INT0) for power button sensing\nP3 (INT1) for charger status sensing\nP4 for led status sensing (polled)
$Comp
L GND #PWR07
U 1 1 53DB8078
P 4100 2700
F 0 "#PWR07" H 4100 2700 30  0001 C CNN
F 1 "GND" H 4100 2630 30  0001 C CNN
	1    4100 2700
	1    0    0    -1  
$EndComp
Text Label 3300 1400 2    60   ~ 0
uC_PWR_SENSE
Text Label 3300 1200 2    60   ~ 0
uC_PWR_CTRL
Text Label 6600 2000 0    60   ~ 0
Vppath
$Comp
L DIODE Dp301
U 1 1 53D1B1A5
P 3700 1200
F 0 "Dp301" H 3700 1300 40  0000 C CNN
F 1 "DIODE" H 3700 1100 40  0000 C CNN
F 2 "DO-214AA" H 3700 1000 60  0000 C CNN
F 4 "B340LB-FDICT-ND" H 3700 1350 60  0000 C CNN "digikey"
	1    3700 1200
	1    0    0    -1  
$EndComp
$Comp
L DIODE Dp302
U 1 1 53D1B19F
P 3700 1600
F 0 "Dp302" H 3700 1700 40  0000 C CNN
F 1 "DIODE" H 3700 1500 40  0000 C CNN
F 2 "DO-214AA" H 3700 1400 60  0000 C CNN
F 4 "B340LB-FDICT-ND" H 3700 1300 60  0000 C CNN "digikey"
	1    3700 1600
	1    0    0    -1  
$EndComp
$Comp
L R Rp302
U 1 1 53D1B197
P 4100 2250
F 0 "Rp302" V 4180 2250 50  0000 C CNN
F 1 "10k" V 4100 2250 50  0000 C CNN
F 2 "SM1206" V 4300 2250 60  0000 C CNN
F 4 "1276-5742-1-ND" V 3950 2050 60  0000 C CNN "digikey"
	1    4100 2250
	1    0    0    -1  
$EndComp
$Comp
L R Rp301
U 1 1 53D1B192
P 3300 2250
F 0 "Rp301" V 3380 2250 50  0000 C CNN
F 1 "10k" V 3300 2250 50  0000 C CNN
F 2 "SM1206" V 3500 2250 60  0000 C CNN
F 4 "1276-5742-1-ND" V 3600 2050 60  0000 C CNN "digikey"
	1    3300 2250
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SWp301
U 1 1 53D1B188
P 2800 1800
F 0 "SWp301" H 2950 1910 50  0000 C CNN
F 1 "SW_PUSH" H 2800 1720 50  0000 C CNN
F 2 "PIN_ARRAY_2X1" H 2800 1600 60  0000 C CNN
	1    2800 1800
	1    0    0    -1  
$EndComp
$EndSCHEMATC

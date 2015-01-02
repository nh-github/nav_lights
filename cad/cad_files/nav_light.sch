EESchema Schematic File Version 2  date Thu 01 Jan 2015 10:15:34 PM HST
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
Sheet 1 4
Title ""
Date "2 jan 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 4400 2600 0    60   ~ 0
bat_pos
Connection ~ 4300 2600
Wire Wire Line
	2500 3000 2300 3000
Wire Wire Line
	2300 3000 2300 5700
Wire Wire Line
	2300 5700 5700 5700
Connection ~ 8900 3150
Wire Wire Line
	8900 2550 8900 3450
Wire Wire Line
	8900 3450 8750 3450
Connection ~ 8900 2550
Wire Wire Line
	8900 2850 8750 2850
Wire Wire Line
	2300 2800 2500 2800
Wire Wire Line
	5500 5100 5700 5100
Wire Wire Line
	5700 5100 5700 5700
Wire Wire Line
	4100 3300 4100 5200
Wire Wire Line
	4100 3300 3500 3300
Wire Wire Line
	7500 2600 7700 2600
Wire Wire Line
	7700 2600 7700 5000
Wire Wire Line
	7700 5000 5500 5000
Wire Wire Line
	6500 2600 3500 2600
Wire Wire Line
	4500 4600 4300 4600
Wire Wire Line
	4300 4600 4300 2600
Wire Wire Line
	3500 2700 4200 2700
Wire Wire Line
	4200 2700 4200 4700
Wire Wire Line
	4200 4700 4500 4700
Wire Wire Line
	5500 4900 5800 4900
Wire Wire Line
	5800 4900 5800 2700
Wire Wire Line
	5800 2700 6500 2700
Wire Wire Line
	6500 2800 4200 2800
Connection ~ 4200 2800
Wire Wire Line
	2300 2600 2500 2600
Wire Wire Line
	9000 2550 8750 2550
Wire Wire Line
	8750 3150 8900 3150
Connection ~ 8900 2850
Wire Wire Line
	4100 5200 4500 5200
NoConn ~ 8750 5250
$Comp
L MECH MECH8
U 1 1 54A145DD
P 8450 5250
F 0 "MECH8" H 8450 5200 60  0000 C CNN
F 1 "MECH" H 8450 5300 60  0000 C CNN
F 2 "logo-OSHW_3mm" H 8450 5100 60  0000 C CNN
	1    8450 5250
	1    0    0    -1  
$EndComp
NoConn ~ 8750 4650
$Comp
L MECH MECH7
U 1 1 54A140B1
P 8450 4650
F 0 "MECH7" H 8450 4600 60  0000 C CNN
F 1 "MECH" H 8450 4700 60  0000 C CNN
F 2 "fiducial" H 8450 4500 60  0000 C CNN
	1    8450 4650
	1    0    0    -1  
$EndComp
$Comp
L MECH MECH6
U 1 1 54A140A7
P 8450 4350
F 0 "MECH6" H 8450 4300 60  0000 C CNN
F 1 "MECH" H 8450 4400 60  0000 C CNN
F 2 "fiducial" H 8450 4200 60  0000 C CNN
	1    8450 4350
	1    0    0    -1  
$EndComp
NoConn ~ 8750 4350
NoConn ~ 8750 4050
$Comp
L MECH MECH5
U 1 1 54A14065
P 8450 4050
F 0 "MECH5" H 8450 4000 60  0000 C CNN
F 1 "MECH" H 8450 4100 60  0000 C CNN
F 2 "fiducial" H 8450 3900 60  0000 C CNN
	1    8450 4050
	1    0    0    -1  
$EndComp
Text Label 9000 2550 0    60   ~ 0
bat_neg
Text Label 4400 2800 0    60   ~ 0
bat_neg
$Comp
L MECH MECH104
U 1 1 54942F24
P 8450 3450
F 0 "MECH104" H 8450 3400 60  0000 C CNN
F 1 "MECH" H 8450 3500 60  0000 C CNN
F 2 "mech_hole__2" H 8450 3300 60  0000 C CNN
	1    8450 3450
	1    0    0    -1  
$EndComp
$Comp
L MECH MECH103
U 1 1 54942F1E
P 8450 3150
F 0 "MECH103" H 8450 3100 60  0000 C CNN
F 1 "MECH" H 8450 3200 60  0000 C CNN
F 2 "mech_hole__2" H 8450 3000 60  0000 C CNN
	1    8450 3150
	1    0    0    -1  
$EndComp
$Comp
L MECH MECH102
U 1 1 54942F19
P 8450 2850
F 0 "MECH102" H 8450 2800 60  0000 C CNN
F 1 "MECH" H 8450 2900 60  0000 C CNN
F 2 "mech_hole__2" H 8450 2700 60  0000 C CNN
	1    8450 2850
	1    0    0    -1  
$EndComp
$Comp
L MECH MECH101
U 1 1 54942F11
P 8450 2550
F 0 "MECH101" H 8450 2500 60  0000 C CNN
F 1 "MECH" H 8450 2600 60  0000 C CNN
F 2 "mech_hole__2" H 8450 2400 60  0000 C CNN
	1    8450 2550
	1    0    0    -1  
$EndComp
$Comp
L CONN_2 Pp101
U 1 1 547FD67C
P 1950 2700
F 0 "Pp101" V 1900 2700 40  0000 C CNN
F 1 "CONN_2" V 2000 2700 40  0000 C CNN
F 2 "PIN_ARRAY_2X1" H 1950 2900 60  0000 C CNN
	1    1950 2700
	-1   0    0    1   
$EndComp
$Sheet
S 4500 4500 1000 1000
U 53D0DCA3
F0 "Control Logic" 60
F1 "nav_control.sch" 60
F2 "led_status" I R 5500 5000 60 
F3 "led_ctrl" O R 5500 4900 60 
F4 "battery_neg" I L 4500 4700 60 
F5 "battery_pos" I L 4500 4600 60 
F6 "powerpath_vdd" I R 5500 4800 60 
F7 "charge_status" I L 4500 5200 60 
F8 "misc_status" O R 5500 5100 60 
$EndSheet
$Sheet
S 2500 2500 1000 1000
U 53D0DAFF
F0 "charger" 60
F1 "nav_charge.sch" 60
F2 "battery_neg" O R 3500 2700 60 
F3 "battery_pos" O R 3500 2600 60 
F4 "chgr_gnd" I L 2500 2800 60 
F5 "+5V" I L 2500 2600 60 
F6 "charge_status" O R 3500 3300 60 
F7 "status_led" I L 2500 3000 60 
$EndSheet
$Sheet
S 6500 2500 1000 1000
U 53D0DB3A
F0 "Light" 60
F1 "nav_output.sch" 60
F2 "CTRL" I L 6500 2700 60 
F3 "~LOBAT" O R 7500 2600 60 
F4 "gnd" I L 6500 2800 60 
F5 "Vbat" I L 6500 2600 60 
$EndSheet
$EndSCHEMATC

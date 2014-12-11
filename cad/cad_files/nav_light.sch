EESchema Schematic File Version 2  date Thu 11 Dec 2014 02:09:55 AM HST
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
Date "11 dec 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	2300 2800 2500 2800
Wire Wire Line
	5500 5100 5700 5100
Wire Wire Line
	5700 5100 5700 5700
Wire Wire Line
	5700 5700 4100 5700
Wire Wire Line
	4100 5700 4100 3300
Wire Wire Line
	4100 3300 3500 3300
Wire Wire Line
	7500 2600 7700 2600
Wire Wire Line
	7700 2600 7700 5000
Wire Wire Line
	7700 5000 5500 5000
Wire Wire Line
	6500 2600 5700 2600
Wire Wire Line
	5700 2600 5700 4800
Wire Wire Line
	5700 4800 5500 4800
Wire Wire Line
	4500 4600 4300 4600
Wire Wire Line
	4300 4600 4300 2600
Wire Wire Line
	4300 2600 3500 2600
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
	4200 2800 6500 2800
Connection ~ 4200 2800
Wire Wire Line
	2300 2600 2500 2600
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
F7 "charge_status" I R 5500 5100 60 
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

EESchema Schematic File Version 2  date Tue 02 Dec 2014 01:39:40 AM HST
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
Date "2 dec 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 2500 2500 1000 1000
U 53D0DAFF
F0 "charger" 60
F1 "nav_charge.sch" 60
F2 "battery_neg" O R 3500 2700 60 
F3 "battery_pos" O R 3500 2600 60 
F4 "chgr_gnd" I L 2500 2800 60 
F5 "+5V" I L 2500 2600 60 
$EndSheet
$Sheet
S 2500 4500 1000 1000
U 53D0DCA3
F0 "Control Logic" 60
F1 "nav_control.sch" 60
$EndSheet
$Sheet
S 4500 2500 1000 1000
U 53D0DB3A
F0 "Light" 60
F1 "nav_output.sch" 60
F2 "CTRL" I L 4500 2700 60 
F3 "~LOBAT" O R 5500 2600 60 
F4 "gnd" I L 4500 2800 60 
F5 "Vbat" I L 4500 2600 60 
$EndSheet
$Comp
L CONN_4 P?
U 1 1 53D0DAAF
P 1750 2750
F 0 "P?" V 1700 2750 50  0000 C CNN
F 1 "CONN_4" V 1800 2750 50  0000 C CNN
	1    1750 2750
	-1   0    0    1   
$EndComp
$EndSCHEMATC

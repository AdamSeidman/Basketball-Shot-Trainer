EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x06_Male J1
U 1 1 614AF895
P 4300 3500
AR Path="/614ADF24/614AF895" Ref="J1"  Part="1" 
AR Path="/614AE184/614AF895" Ref="J2"  Part="1" 
F 0 "J2" H 4408 3881 50  0000 C CNN
F 1 "Conn_01x06_Male" H 4408 3790 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 4300 3500 50  0001 C CNN
F 3 "~" H 4300 3500 50  0001 C CNN
	1    4300 3500
	1    0    0    -1  
$EndComp
Text HLabel 4500 3300 2    50   Input ~ 0
Vin
Text HLabel 4500 3400 2    50   Output ~ 0
3v
Text HLabel 4500 3500 2    50   Input ~ 0
GND
Text HLabel 4500 3600 2    50   BiDi ~ 0
SCL
Text HLabel 4500 3700 2    50   BiDi ~ 0
SDA
Text HLabel 4500 3800 2    50   Input ~ 0
RST
$EndSCHEMATC

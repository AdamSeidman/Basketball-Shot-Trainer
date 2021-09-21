EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
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
L Connector:Conn_01x16_Female J?
U 1 1 614B7700
P 3800 3350
AR Path="/614B7700" Ref="J?"  Part="1" 
AR Path="/614B5FF9/614B7700" Ref="J3"  Part="1" 
F 0 "J3" H 3828 3326 50  0000 L CNN
F 1 "Conn_01x16_Female" H 3828 3235 50  0000 L CNN
F 2 "" H 3800 3350 50  0001 C CNN
F 3 "~" H 3800 3350 50  0001 C CNN
	1    3800 3350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x12_Female J?
U 1 1 614B7706
P 6700 3300
AR Path="/614B7706" Ref="J?"  Part="1" 
AR Path="/614B5FF9/614B7706" Ref="J5"  Part="1" 
F 0 "J5" H 6728 3276 50  0000 L CNN
F 1 "Conn_01x12_Female" H 6728 3185 50  0000 L CNN
F 2 "" H 6700 3300 50  0001 C CNN
F 3 "~" H 6700 3300 50  0001 C CNN
	1    6700 3300
	1    0    0    -1  
$EndComp
Text HLabel 6500 3900 0    50   BiDi ~ 0
SDA
Text HLabel 6500 3800 0    50   BiDi ~ 0
SCL
$Comp
L Connector_Generic:Conn_02x01 J4
U 1 1 614BCCF6
P 5500 1550
F 0 "J4" H 5550 1767 50  0000 C CNN
F 1 "Conn_02x01" H 5550 1676 50  0000 C CNN
F 2 "" H 5500 1550 50  0001 C CNN
F 3 "~" H 5500 1550 50  0001 C CNN
	1    5500 1550
	1    0    0    -1  
$EndComp
Text HLabel 5300 1550 0    50   Input ~ 0
5V_In
Text HLabel 5800 1550 2    50   Input ~ 0
GND
Text HLabel 3600 2950 0    50   Input ~ 0
GND
Text HLabel 6500 3200 0    50   Output ~ 0
RST
Wire Wire Line
	5550 4900 5550 5050
Wire Wire Line
	5400 4900 5550 4900
Text HLabel 5400 4900 0    50   Output ~ 0
RST
$Comp
L Device:R_US R?
U 1 1 614ADABC
P 5550 5200
AR Path="/614ADABC" Ref="R?"  Part="1" 
AR Path="/614B5FF9/614ADABC" Ref="R7"  Part="1" 
F 0 "R7" H 5618 5246 50  0000 L CNN
F 1 "10k" H 5618 5155 50  0000 L CNN
F 2 "" V 5590 5190 50  0001 C CNN
F 3 "~" H 5550 5200 50  0001 C CNN
	1    5550 5200
	1    0    0    -1  
$EndComp
Text HLabel 5750 5550 2    50   Input ~ 0
GND
Wire Wire Line
	5550 5350 5550 5550
Wire Wire Line
	5550 5550 5750 5550
Text HLabel 6500 3400 0    50   Output ~ 0
RED
Text HLabel 6500 3500 0    50   Output ~ 0
GREEN
Text HLabel 6500 3600 0    50   Output ~ 0
BLUE
NoConn ~ 6500 3700
NoConn ~ 6500 3300
NoConn ~ 6500 3100
NoConn ~ 6500 3000
NoConn ~ 6500 2900
NoConn ~ 6500 2800
NoConn ~ 3600 4150
NoConn ~ 3600 4050
NoConn ~ 3600 3950
NoConn ~ 3600 3850
NoConn ~ 3600 3750
NoConn ~ 3600 3650
NoConn ~ 3600 3550
NoConn ~ 3600 3450
NoConn ~ 3600 3350
NoConn ~ 3600 3250
NoConn ~ 3600 3150
NoConn ~ 3600 3050
NoConn ~ 3600 2850
NoConn ~ 3600 2750
NoConn ~ 3600 2650
$EndSCHEMATC

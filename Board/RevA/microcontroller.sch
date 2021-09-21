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
AR Path="/614B5FF9/614B7700" Ref="J?"  Part="1" 
F 0 "J?" H 3828 3326 50  0000 L CNN
F 1 "Conn_01x16_Female" H 3828 3235 50  0000 L CNN
F 2 "" H 3800 3350 50  0001 C CNN
F 3 "~" H 3800 3350 50  0001 C CNN
	1    3800 3350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x12_Female J?
U 1 1 614B7706
P 6350 3300
AR Path="/614B7706" Ref="J?"  Part="1" 
AR Path="/614B5FF9/614B7706" Ref="J?"  Part="1" 
F 0 "J?" H 6378 3276 50  0000 L CNN
F 1 "Conn_01x12_Female" H 6378 3185 50  0000 L CNN
F 2 "" H 6350 3300 50  0001 C CNN
F 3 "~" H 6350 3300 50  0001 C CNN
	1    6350 3300
	1    0    0    -1  
$EndComp
Text HLabel 4950 5150 0    50   BiDi ~ 0
SDA
Text HLabel 4900 5450 0    50   BiDi ~ 0
SCL
$Comp
L Connector_Generic:Conn_02x01 J?
U 1 1 614BCCF6
P 5500 1550
F 0 "J?" H 5550 1767 50  0000 C CNN
F 1 "Conn_02x01" H 5550 1676 50  0000 C CNN
F 2 "" H 5500 1550 50  0001 C CNN
F 3 "~" H 5500 1550 50  0001 C CNN
	1    5500 1550
	1    0    0    -1  
$EndComp
Text HLabel 6850 5000 0    50   Input ~ 0
5V_In
Text HLabel 6750 5200 0    50   Input ~ 0
GND
Text HLabel 6700 5400 0    50   Output ~ 0
RST
$EndSCHEMATC

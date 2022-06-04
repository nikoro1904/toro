EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Stepper Motor PCB"
Date "2022-06-04"
Rev "2"
Comp "Robotic Tutorials"
Comment1 "Added Diodes and Capacitors to PWR and GND"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 60E9D74E
P 9150 4150
F 0 "A1" H 9150 3061 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 9150 2970 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 9150 4150 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 9150 4150 50  0001 C CNN
	1    9150 4150
	1    0    0    -1  
$EndComp
$Comp
L Driver_Motor:L293 U1
U 1 1 60EA028E
P 6300 3350
F 0 "U1" H 6300 4531 50  0000 C CNN
F 1 "L293" H 6300 4440 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 6550 2600 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/l293.pdf" H 6000 4050 50  0001 C CNN
	1    6300 3350
	-1   0    0    -1  
$EndComp
$Comp
L Driver_Motor:L293 U2
U 1 1 60EA0A8A
P 6300 5500
F 0 "U2" H 6300 6681 50  0000 C CNN
F 1 "L293" H 6300 6590 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 6550 4750 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/l293.pdf" H 6000 6200 50  0001 C CNN
	1    6300 5500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6800 2950 8000 2950
Wire Wire Line
	8000 2950 8000 3850
Wire Wire Line
	8000 3850 8650 3850
Wire Wire Line
	8650 3950 7900 3950
Wire Wire Line
	7900 3950 7900 3350
Wire Wire Line
	7900 3350 6800 3350
Wire Wire Line
	6800 3550 7800 3550
Wire Wire Line
	7800 3550 7800 4050
Wire Wire Line
	7800 4050 8650 4050
Wire Wire Line
	8650 4150 7700 4150
Wire Wire Line
	7700 4150 7700 3750
Wire Wire Line
	7700 3150 6800 3150
Wire Wire Line
	6800 3750 7700 3750
Connection ~ 7700 3750
Wire Wire Line
	7700 3750 7700 3150
Wire Wire Line
	8650 4250 7700 4250
Wire Wire Line
	7700 4250 7700 4900
Wire Wire Line
	7700 4900 6800 4900
Wire Wire Line
	6800 5100 7800 5100
Wire Wire Line
	7800 5100 7800 4350
Wire Wire Line
	7800 4350 8650 4350
Wire Wire Line
	8650 4450 7900 4450
Wire Wire Line
	7900 4450 7900 5500
Wire Wire Line
	7900 5500 6800 5500
Wire Wire Line
	6800 5700 8000 5700
Wire Wire Line
	8000 5700 8000 4550
Wire Wire Line
	8000 4550 8650 4550
Wire Wire Line
	6800 5900 8100 5900
Wire Wire Line
	8100 5900 8100 5300
Wire Wire Line
	8100 4650 8650 4650
Wire Wire Line
	6800 5300 8100 5300
Connection ~ 8100 5300
Wire Wire Line
	8100 5300 8100 4650
$Comp
L power:GND #PWR03
U 1 1 60EBA1ED
P 5500 4300
F 0 "#PWR03" H 5500 4050 50  0001 C CNN
F 1 "GND" H 5505 4127 50  0000 C CNN
F 2 "" H 5500 4300 50  0001 C CNN
F 3 "" H 5500 4300 50  0001 C CNN
	1    5500 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 60EBC3F2
P 5500 6450
F 0 "#PWR04" H 5500 6200 50  0001 C CNN
F 1 "GND" H 5505 6277 50  0000 C CNN
F 2 "" H 5500 6450 50  0001 C CNN
F 3 "" H 5500 6450 50  0001 C CNN
	1    5500 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 60EBD422
P 9850 5350
F 0 "#PWR05" H 9850 5100 50  0001 C CNN
F 1 "GND" H 9855 5177 50  0000 C CNN
F 2 "" H 9850 5350 50  0001 C CNN
F 3 "" H 9850 5350 50  0001 C CNN
	1    9850 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 5200 9850 5200
Wire Wire Line
	9850 5200 9850 5350
Wire Wire Line
	9250 5150 9250 5200
Wire Wire Line
	5500 6450 6100 6450
Wire Wire Line
	6100 6450 6100 6300
Wire Wire Line
	5500 4300 6100 4300
Wire Wire Line
	6100 4300 6100 4150
Wire Wire Line
	6400 2350 7350 2350
Wire Wire Line
	9350 2350 9350 3150
Wire Wire Line
	6400 4500 7350 4500
Wire Wire Line
	7350 4500 7350 2350
Connection ~ 7350 2350
Wire Wire Line
	7350 2350 9350 2350
$Comp
L power:+10V #PWR01
U 1 1 60ED92E4
P 5150 4550
F 0 "#PWR01" H 5150 4400 50  0001 C CNN
F 1 "+10V" H 5165 4723 50  0000 C CNN
F 2 "" H 5150 4550 50  0001 C CNN
F 3 "" H 5150 4550 50  0001 C CNN
	1    5150 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+10V #PWR02
U 1 1 60EDAE62
P 5200 1700
F 0 "#PWR02" H 5200 1550 50  0001 C CNN
F 1 "+10V" H 5215 1873 50  0000 C CNN
F 2 "" H 5200 1700 50  0001 C CNN
F 3 "" H 5200 1700 50  0001 C CNN
	1    5200 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2350 6200 2350
Wire Wire Line
	5200 1700 5200 1800
Wire Wire Line
	6200 4500 5750 4500
Wire Wire Line
	5750 4500 5750 4650
Wire Wire Line
	5750 4650 5150 4650
Wire Wire Line
	5150 4650 5150 4550
$Comp
L Connector:Screw_Terminal_01x03 J1
U 1 1 6134CE6A
P 1500 3750
F 0 "J1" H 1580 3792 50  0000 L CNN
F 1 "Screw_Terminal_01x03" H 1580 3701 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-3_P5.00mm" H 1500 3750 50  0001 C CNN
F 3 "~" H 1500 3750 50  0001 C CNN
	1    1500 3750
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 6134E460
P 1500 4300
F 0 "J2" H 1418 3975 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 1418 4066 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-2_P5.00mm" H 1500 4300 50  0001 C CNN
F 3 "~" H 1500 4300 50  0001 C CNN
	1    1500 4300
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J3
U 1 1 6134EA41
P 1500 4700
F 0 "J3" H 1580 4742 50  0000 L CNN
F 1 "Screw_Terminal_01x03" H 1580 4651 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-3_P5.00mm" H 1500 4700 50  0001 C CNN
F 3 "~" H 1500 4700 50  0001 C CNN
	1    1500 4700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5800 5500 4700 5500
Wire Wire Line
	4700 5500 4700 4700
Wire Wire Line
	4700 4700 3500 4700
Wire Wire Line
	5800 4900 5000 4900
Wire Wire Line
	5000 4900 5000 4300
Wire Wire Line
	5000 4300 2150 4300
Wire Wire Line
	5800 3550 5000 3550
Wire Wire Line
	5800 3350 4850 3350
Wire Wire Line
	4850 3350 4850 3850
Wire Wire Line
	5800 2950 4700 2950
Wire Wire Line
	4700 2950 4700 3750
Wire Wire Line
	4800 5100 4800 4600
Wire Wire Line
	4800 5100 5800 5100
Wire Wire Line
	4800 4600 2800 4600
Wire Wire Line
	5800 5700 4600 5700
Wire Wire Line
	4600 5700 4600 4800
Wire Wire Line
	4600 4800 4100 4800
Wire Wire Line
	5000 4200 4050 4200
Wire Wire Line
	6100 6450 6200 6450
Wire Wire Line
	6200 6450 6200 6300
Connection ~ 6100 6450
Wire Wire Line
	6200 6450 6400 6450
Wire Wire Line
	6400 6450 6400 6300
Connection ~ 6200 6450
Wire Wire Line
	6400 6450 6500 6450
Wire Wire Line
	6500 6450 6500 6300
Connection ~ 6400 6450
Wire Wire Line
	6100 4300 6200 4300
Wire Wire Line
	6200 4300 6200 4150
Connection ~ 6100 4300
Wire Wire Line
	6200 4300 6400 4300
Wire Wire Line
	6400 4300 6400 4150
Connection ~ 6200 4300
Wire Wire Line
	6400 4300 6500 4300
Wire Wire Line
	6500 4300 6500 4150
Connection ~ 6400 4300
Wire Wire Line
	9150 5150 9150 5200
Wire Wire Line
	9150 5200 9250 5200
Connection ~ 9250 5200
NoConn ~ 9650 3550
NoConn ~ 9650 3650
NoConn ~ 9650 3950
NoConn ~ 9650 4150
NoConn ~ 9650 4250
NoConn ~ 9650 4350
NoConn ~ 9650 4450
NoConn ~ 9650 4550
NoConn ~ 9650 4650
NoConn ~ 9650 4750
NoConn ~ 9650 4850
NoConn ~ 8650 4850
NoConn ~ 8650 3650
NoConn ~ 8650 3550
NoConn ~ 9050 3150
NoConn ~ 9250 3150
Wire Wire Line
	8650 4750 8200 4750
Wire Wire Line
	8200 4750 8200 2750
Wire Wire Line
	8200 2750 6800 2750
Wire Wire Line
	10100 1050 9700 1050
Wire Wire Line
	10100 850  10100 1050
Wire Wire Line
	10200 850  10200 1250
$Comp
L power:GND #PWR07
U 1 1 6138DB78
P 10200 1250
F 0 "#PWR07" H 10200 1000 50  0001 C CNN
F 1 "GND" H 10205 1077 50  0000 C CNN
F 2 "" H 10200 1250 50  0001 C CNN
F 3 "" H 10200 1250 50  0001 C CNN
	1    10200 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+10V #PWR06
U 1 1 6138B4E0
P 9700 1050
F 0 "#PWR06" H 9700 900 50  0001 C CNN
F 1 "+10V" V 9715 1178 50  0000 L CNN
F 2 "" H 9700 1050 50  0001 C CNN
F 3 "" H 9700 1050 50  0001 C CNN
	1    9700 1050
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J4
U 1 1 61384FD7
P 10100 650
F 0 "J4" V 10064 462 50  0000 R CNN
F 1 "Screw_Terminal _01x02" V 9973 462 50  0000 R CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-2_P5.00mm" H 10100 650 50  0001 C CNN
F 3 "~" H 10100 650 50  0001 C CNN
	1    10100 650 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4550 2750 4550 3650
Wire Wire Line
	5800 2750 4550 2750
Wire Wire Line
	5000 3550 5000 4200
$Comp
L Device:D D5A1
U 1 1 62A445FC
P 1750 3100
F 0 "D5A1" V 1704 3179 50  0000 L CNN
F 1 "D" V 1795 3179 50  0000 L CNN
F 2 "" H 1750 3100 50  0001 C CNN
F 3 "~" H 1750 3100 50  0001 C CNN
	1    1750 3100
	0    1    1    0   
$EndComp
$Comp
L Device:D D1A1
U 1 1 62A45AA5
P 2050 3100
F 0 "D1A1" V 2096 3021 50  0000 R CNN
F 1 "D" V 2005 3021 50  0000 R CNN
F 2 "" H 2050 3100 50  0001 C CNN
F 3 "~" H 2050 3100 50  0001 C CNN
	1    2050 3100
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D6A1
U 1 1 62A4639A
P 2350 3100
F 0 "D6A1" V 2304 3179 50  0000 L CNN
F 1 "D" V 2395 3179 50  0000 L CNN
F 2 "" H 2350 3100 50  0001 C CNN
F 3 "~" H 2350 3100 50  0001 C CNN
	1    2350 3100
	0    1    1    0   
$EndComp
$Comp
L Device:D D2A1
U 1 1 62A4677C
P 2700 3100
F 0 "D2A1" V 2746 3021 50  0000 R CNN
F 1 "D" V 2655 3021 50  0000 R CNN
F 2 "" H 2700 3100 50  0001 C CNN
F 3 "~" H 2700 3100 50  0001 C CNN
	1    2700 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1750 3250 1750 3650
Wire Wire Line
	2050 3250 2050 3650
Wire Wire Line
	2350 3250 2350 3750
$Comp
L power:+10V #PWR0101
U 1 1 62A70988
P 1750 2950
F 0 "#PWR0101" H 1750 2800 50  0001 C CNN
F 1 "+10V" H 1765 3123 50  0000 C CNN
F 2 "" H 1750 2950 50  0001 C CNN
F 3 "" H 1750 2950 50  0001 C CNN
	1    1750 2950
	1    0    0    -1  
$EndComp
$Comp
L power:+10V #PWR0102
U 1 1 62A71AFF
P 2350 2950
F 0 "#PWR0102" H 2350 2800 50  0001 C CNN
F 1 "+10V" H 2365 3123 50  0000 C CNN
F 2 "" H 2350 2950 50  0001 C CNN
F 3 "" H 2350 2950 50  0001 C CNN
	1    2350 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 62A76604
P 2050 2950
F 0 "#PWR0103" H 2050 2700 50  0001 C CNN
F 1 "GND" H 2055 2777 50  0000 C CNN
F 2 "" H 2050 2950 50  0001 C CNN
F 3 "" H 2050 2950 50  0001 C CNN
	1    2050 2950
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 62A78154
P 2700 2950
F 0 "#PWR0104" H 2700 2700 50  0001 C CNN
F 1 "GND" H 2705 2777 50  0000 C CNN
F 2 "" H 2700 2950 50  0001 C CNN
F 3 "" H 2700 2950 50  0001 C CNN
	1    2700 2950
	-1   0    0    1   
$EndComp
$Comp
L Device:D D7A1
U 1 1 62A794C3
P 3050 3100
F 0 "D7A1" V 3004 3179 50  0000 L CNN
F 1 "D" V 3095 3179 50  0000 L CNN
F 2 "" H 3050 3100 50  0001 C CNN
F 3 "~" H 3050 3100 50  0001 C CNN
	1    3050 3100
	0    1    1    0   
$EndComp
$Comp
L Device:D D3A1
U 1 1 62A79B18
P 3350 3100
F 0 "D3A1" V 3396 3021 50  0000 R CNN
F 1 "D" V 3305 3021 50  0000 R CNN
F 2 "" H 3350 3100 50  0001 C CNN
F 3 "~" H 3350 3100 50  0001 C CNN
	1    3350 3100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 62A884C7
P 3350 2950
F 0 "#PWR0105" H 3350 2700 50  0001 C CNN
F 1 "GND" H 3355 2777 50  0000 C CNN
F 2 "" H 3350 2950 50  0001 C CNN
F 3 "" H 3350 2950 50  0001 C CNN
	1    3350 2950
	-1   0    0    1   
$EndComp
$Comp
L power:+10V #PWR0106
U 1 1 62A8A7AA
P 3050 2950
F 0 "#PWR0106" H 3050 2800 50  0001 C CNN
F 1 "+10V" H 3065 3123 50  0000 C CNN
F 2 "" H 3050 2950 50  0001 C CNN
F 3 "" H 3050 2950 50  0001 C CNN
	1    3050 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 3250 3050 3850
Connection ~ 1750 3650
Wire Wire Line
	1750 3650 1700 3650
Connection ~ 2050 3650
Wire Wire Line
	2050 3650 1750 3650
Connection ~ 2350 3750
Wire Wire Line
	2350 3750 1700 3750
Connection ~ 2700 3750
Wire Wire Line
	2700 3750 2350 3750
Connection ~ 3050 3850
Wire Wire Line
	3050 3850 1700 3850
Connection ~ 3350 3850
Wire Wire Line
	3350 3850 3050 3850
Wire Wire Line
	3350 3850 4850 3850
Wire Wire Line
	2050 3650 4550 3650
Wire Wire Line
	2700 3250 2700 3750
Wire Wire Line
	2700 3750 4700 3750
Wire Wire Line
	3350 3250 3350 3850
$Comp
L Device:D D8A1
U 1 1 62AEB276
P 3700 3100
F 0 "D8A1" V 3654 3179 50  0000 L CNN
F 1 "D" V 3745 3179 50  0000 L CNN
F 2 "" H 3700 3100 50  0001 C CNN
F 3 "~" H 3700 3100 50  0001 C CNN
	1    3700 3100
	0    1    1    0   
$EndComp
$Comp
L Device:D D4A1
U 1 1 62AEB87D
P 4050 3100
F 0 "D4A1" V 4096 3021 50  0000 R CNN
F 1 "D" V 4005 3021 50  0000 R CNN
F 2 "" H 4050 3100 50  0001 C CNN
F 3 "~" H 4050 3100 50  0001 C CNN
	1    4050 3100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 62AEBC9B
P 4050 2950
F 0 "#PWR0107" H 4050 2700 50  0001 C CNN
F 1 "GND" H 4055 2777 50  0000 C CNN
F 2 "" H 4050 2950 50  0001 C CNN
F 3 "" H 4050 2950 50  0001 C CNN
	1    4050 2950
	-1   0    0    1   
$EndComp
$Comp
L power:+10V #PWR0108
U 1 1 62AEC14D
P 3700 2950
F 0 "#PWR0108" H 3700 2800 50  0001 C CNN
F 1 "+10V" H 3715 3123 50  0000 C CNN
F 2 "" H 3700 2950 50  0001 C CNN
F 3 "" H 3700 2950 50  0001 C CNN
	1    3700 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 3250 3700 4200
Connection ~ 3700 4200
Wire Wire Line
	3700 4200 1700 4200
Wire Wire Line
	4050 3250 4050 4200
Connection ~ 4050 4200
Wire Wire Line
	4050 4200 3700 4200
$Comp
L Device:D D8B1
U 1 1 62B08073
P 4100 5350
F 0 "D8B1" V 4146 5271 50  0000 R CNN
F 1 "D" V 4055 5271 50  0000 R CNN
F 2 "" H 4100 5350 50  0001 C CNN
F 3 "~" H 4100 5350 50  0001 C CNN
	1    4100 5350
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D4B1
U 1 1 62B0807D
P 3800 5350
F 0 "D4B1" V 3754 5429 50  0000 L CNN
F 1 "D" V 3845 5429 50  0000 L CNN
F 2 "" H 3800 5350 50  0001 C CNN
F 3 "~" H 3800 5350 50  0001 C CNN
	1    3800 5350
	0    1    1    0   
$EndComp
$Comp
L Device:D D7B1
U 1 1 62B08087
P 3500 5350
F 0 "D7B1" V 3546 5271 50  0000 R CNN
F 1 "D" V 3455 5271 50  0000 R CNN
F 2 "" H 3500 5350 50  0001 C CNN
F 3 "~" H 3500 5350 50  0001 C CNN
	1    3500 5350
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D3B1
U 1 1 62B08091
P 3150 5350
F 0 "D3B1" V 3104 5429 50  0000 L CNN
F 1 "D" V 3195 5429 50  0000 L CNN
F 2 "" H 3150 5350 50  0001 C CNN
F 3 "~" H 3150 5350 50  0001 C CNN
	1    3150 5350
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 5200 4100 4800
Wire Wire Line
	3800 5200 3800 4800
Wire Wire Line
	3500 5200 3500 4700
$Comp
L power:+10V #PWR0109
U 1 1 62B0809E
P 4100 5500
F 0 "#PWR0109" H 4100 5350 50  0001 C CNN
F 1 "+10V" H 4115 5673 50  0000 C CNN
F 2 "" H 4100 5500 50  0001 C CNN
F 3 "" H 4100 5500 50  0001 C CNN
	1    4100 5500
	-1   0    0    1   
$EndComp
$Comp
L power:+10V #PWR0110
U 1 1 62B080A8
P 3500 5500
F 0 "#PWR0110" H 3500 5350 50  0001 C CNN
F 1 "+10V" H 3515 5673 50  0000 C CNN
F 2 "" H 3500 5500 50  0001 C CNN
F 3 "" H 3500 5500 50  0001 C CNN
	1    3500 5500
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 62B080B2
P 3800 5500
F 0 "#PWR0111" H 3800 5250 50  0001 C CNN
F 1 "GND" H 3805 5327 50  0000 C CNN
F 2 "" H 3800 5500 50  0001 C CNN
F 3 "" H 3800 5500 50  0001 C CNN
	1    3800 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 62B080BC
P 3150 5500
F 0 "#PWR0112" H 3150 5250 50  0001 C CNN
F 1 "GND" H 3155 5327 50  0000 C CNN
F 2 "" H 3150 5500 50  0001 C CNN
F 3 "" H 3150 5500 50  0001 C CNN
	1    3150 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:D D6B1
U 1 1 62B080C6
P 2800 5350
F 0 "D6B1" V 2846 5271 50  0000 R CNN
F 1 "D" V 2755 5271 50  0000 R CNN
F 2 "" H 2800 5350 50  0001 C CNN
F 3 "~" H 2800 5350 50  0001 C CNN
	1    2800 5350
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D2B1
U 1 1 62B080D0
P 2500 5350
F 0 "D2B1" V 2454 5429 50  0000 L CNN
F 1 "D" V 2545 5429 50  0000 L CNN
F 2 "" H 2500 5350 50  0001 C CNN
F 3 "~" H 2500 5350 50  0001 C CNN
	1    2500 5350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 62B080DA
P 2500 5500
F 0 "#PWR0113" H 2500 5250 50  0001 C CNN
F 1 "GND" H 2505 5327 50  0000 C CNN
F 2 "" H 2500 5500 50  0001 C CNN
F 3 "" H 2500 5500 50  0001 C CNN
	1    2500 5500
	1    0    0    -1  
$EndComp
$Comp
L power:+10V #PWR0114
U 1 1 62B080E4
P 2800 5500
F 0 "#PWR0114" H 2800 5350 50  0001 C CNN
F 1 "+10V" H 2815 5673 50  0000 C CNN
F 2 "" H 2800 5500 50  0001 C CNN
F 3 "" H 2800 5500 50  0001 C CNN
	1    2800 5500
	-1   0    0    1   
$EndComp
Wire Wire Line
	2800 5200 2800 4600
Wire Wire Line
	3150 5200 3150 4700
Wire Wire Line
	2500 5200 2500 4600
$Comp
L Device:D D5B1
U 1 1 62B080F1
P 2150 5350
F 0 "D5B1" V 2196 5271 50  0000 R CNN
F 1 "D" V 2105 5271 50  0000 R CNN
F 2 "" H 2150 5350 50  0001 C CNN
F 3 "~" H 2150 5350 50  0001 C CNN
	1    2150 5350
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D1B1
U 1 1 62B080FB
P 1800 5350
F 0 "D1B1" V 1754 5429 50  0000 L CNN
F 1 "D" V 1845 5429 50  0000 L CNN
F 2 "" H 1800 5350 50  0001 C CNN
F 3 "~" H 1800 5350 50  0001 C CNN
	1    1800 5350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 62B08105
P 1800 5500
F 0 "#PWR0115" H 1800 5250 50  0001 C CNN
F 1 "GND" H 1805 5327 50  0000 C CNN
F 2 "" H 1800 5500 50  0001 C CNN
F 3 "" H 1800 5500 50  0001 C CNN
	1    1800 5500
	1    0    0    -1  
$EndComp
$Comp
L power:+10V #PWR0116
U 1 1 62B0810F
P 2150 5500
F 0 "#PWR0116" H 2150 5350 50  0001 C CNN
F 1 "+10V" H 2165 5673 50  0000 C CNN
F 2 "" H 2150 5500 50  0001 C CNN
F 3 "" H 2150 5500 50  0001 C CNN
	1    2150 5500
	-1   0    0    1   
$EndComp
Wire Wire Line
	2150 5200 2150 4300
Wire Wire Line
	1800 5200 1800 4300
Connection ~ 2500 4600
Wire Wire Line
	2500 4600 1700 4600
Connection ~ 2800 4600
Wire Wire Line
	2800 4600 2500 4600
Connection ~ 3150 4700
Wire Wire Line
	3150 4700 1700 4700
Connection ~ 3500 4700
Wire Wire Line
	3500 4700 3150 4700
Connection ~ 3800 4800
Wire Wire Line
	3800 4800 1700 4800
Connection ~ 4100 4800
Wire Wire Line
	4100 4800 3800 4800
Connection ~ 1800 4300
Wire Wire Line
	1800 4300 1700 4300
Connection ~ 2150 4300
Wire Wire Line
	2150 4300 1800 4300
$Comp
L Device:C C1
U 1 1 62B5FA56
P 4800 2050
F 0 "C1" H 4915 2096 50  0000 L CNN
F 1 "220nF" H 4915 2005 50  0000 L CNN
F 2 "" H 4838 1900 50  0001 C CNN
F 3 "~" H 4800 2050 50  0001 C CNN
	1    4800 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 1900 4800 1800
Wire Wire Line
	4800 1800 5200 1800
Connection ~ 5200 1800
Wire Wire Line
	5200 1800 5200 2350
$Comp
L power:GND #PWR0117
U 1 1 62B67AFE
P 4800 2250
F 0 "#PWR0117" H 4800 2000 50  0001 C CNN
F 1 "GND" H 4805 2077 50  0000 C CNN
F 2 "" H 4800 2250 50  0001 C CNN
F 3 "" H 4800 2250 50  0001 C CNN
	1    4800 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 2250 4800 2200
$Comp
L Connector:Conn_01x01_Male J5
U 1 1 62B9FD52
P 8150 2600
F 0 "J5" H 8258 2781 50  0000 C CNN
F 1 "Conn_01x01_Male" H 8258 2690 50  0000 C CNN
F 2 "" H 8150 2600 50  0001 C CNN
F 3 "~" H 8150 2600 50  0001 C CNN
	1    8150 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 2600 8400 2600
Wire Wire Line
	8400 3750 8650 3750
Wire Wire Line
	8400 2600 8400 3750
$EndSCHEMATC
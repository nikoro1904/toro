EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L MCU_Module:Arduino_Nano_v3.x A?
U 1 1 60E9D74E
P 8450 3400
F 0 "A?" H 8450 2311 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 8450 2220 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 8450 3400 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 8450 3400 50  0001 C CNN
	1    8450 3400
	1    0    0    -1  
$EndComp
$Comp
L Driver_Motor:L293 U?
U 1 1 60EA028E
P 5600 2600
F 0 "U?" H 5600 3781 50  0000 C CNN
F 1 "L293" H 5600 3690 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 5850 1850 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/l293.pdf" H 5300 3300 50  0001 C CNN
	1    5600 2600
	-1   0    0    -1  
$EndComp
$Comp
L Driver_Motor:L293 U?
U 1 1 60EA0A8A
P 5600 4750
F 0 "U?" H 5600 5931 50  0000 C CNN
F 1 "L293" H 5600 5840 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 5850 4000 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/l293.pdf" H 5300 5450 50  0001 C CNN
	1    5600 4750
	-1   0    0    -1  
$EndComp
$Comp
L Motor:Stepper_Motor_bipolar M?
U 1 1 60EA173C
P 2200 2700
F 0 "M?" H 2388 2824 50  0000 L CNN
F 1 "Stepper_Motor_bipolar" H 2388 2733 50  0000 L CNN
F 2 "" H 2210 2690 50  0001 C CNN
F 3 "http://www.infineon.com/dgdl/Application-Note-TLE8110EE_driving_UniPolarStepperMotor_V1.1.pdf?fileId=db3a30431be39b97011be5d0aa0a00b0" H 2210 2690 50  0001 C CNN
	1    2200 2700
	-1   0    0    -1  
$EndComp
$Comp
L Motor:Stepper_Motor_bipolar M?
U 1 1 60EA25F0
P 2150 4850
F 0 "M?" H 2338 4974 50  0000 L CNN
F 1 "Stepper_Motor_bipolar" H 2338 4883 50  0000 L CNN
F 2 "" H 2160 4840 50  0001 C CNN
F 3 "http://www.infineon.com/dgdl/Application-Note-TLE8110EE_driving_UniPolarStepperMotor_V1.1.pdf?fileId=db3a30431be39b97011be5d0aa0a00b0" H 2160 4840 50  0001 C CNN
	1    2150 4850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7950 3000 7400 3000
Wire Wire Line
	7400 3000 7400 2000
Wire Wire Line
	7400 2000 6100 2000
Wire Wire Line
	6100 2200 7300 2200
Wire Wire Line
	7300 2200 7300 3100
Wire Wire Line
	7300 3100 7950 3100
Wire Wire Line
	7950 3200 7200 3200
Wire Wire Line
	7200 3200 7200 2600
Wire Wire Line
	7200 2600 6100 2600
Wire Wire Line
	6100 2800 7100 2800
Wire Wire Line
	7100 2800 7100 3300
Wire Wire Line
	7100 3300 7950 3300
Wire Wire Line
	7950 3400 7000 3400
Wire Wire Line
	7000 3400 7000 3000
Wire Wire Line
	7000 2400 6100 2400
Wire Wire Line
	6100 3000 7000 3000
Connection ~ 7000 3000
Wire Wire Line
	7000 3000 7000 2400
Wire Wire Line
	7950 3500 7000 3500
Wire Wire Line
	7000 3500 7000 4150
Wire Wire Line
	7000 4150 6100 4150
Wire Wire Line
	6100 4350 7100 4350
Wire Wire Line
	7100 4350 7100 3600
Wire Wire Line
	7100 3600 7950 3600
Wire Wire Line
	7950 3700 7200 3700
Wire Wire Line
	7200 3700 7200 4750
Wire Wire Line
	7200 4750 6100 4750
Wire Wire Line
	6100 4950 7300 4950
Wire Wire Line
	7300 4950 7300 3800
Wire Wire Line
	7300 3800 7950 3800
Wire Wire Line
	6100 5150 7400 5150
Wire Wire Line
	7400 5150 7400 4550
Wire Wire Line
	7400 3900 7950 3900
Wire Wire Line
	6100 4550 7400 4550
Connection ~ 7400 4550
Wire Wire Line
	7400 4550 7400 3900
$Comp
L power:GND #PWR?
U 1 1 60EBA1ED
P 4800 3550
F 0 "#PWR?" H 4800 3300 50  0001 C CNN
F 1 "GND" H 4805 3377 50  0000 C CNN
F 2 "" H 4800 3550 50  0001 C CNN
F 3 "" H 4800 3550 50  0001 C CNN
	1    4800 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60EBC3F2
P 4800 5700
F 0 "#PWR?" H 4800 5450 50  0001 C CNN
F 1 "GND" H 4805 5527 50  0000 C CNN
F 2 "" H 4800 5700 50  0001 C CNN
F 3 "" H 4800 5700 50  0001 C CNN
	1    4800 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60EBD422
P 9150 4600
F 0 "#PWR?" H 9150 4350 50  0001 C CNN
F 1 "GND" H 9155 4427 50  0000 C CNN
F 2 "" H 9150 4600 50  0001 C CNN
F 3 "" H 9150 4600 50  0001 C CNN
	1    9150 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 4450 9150 4450
Wire Wire Line
	9150 4450 9150 4600
Wire Wire Line
	8550 4400 8550 4450
Wire Wire Line
	4800 5700 5400 5700
Wire Wire Line
	5400 5700 5400 5550
Wire Wire Line
	4800 3550 5400 3550
Wire Wire Line
	5400 3550 5400 3400
Wire Wire Line
	2300 2400 2300 2200
Wire Wire Line
	2300 2200 5100 2200
Wire Wire Line
	5100 2000 2100 2000
Wire Wire Line
	2100 2000 2100 2400
Wire Wire Line
	5100 4950 2450 4950
Wire Wire Line
	2450 4750 5100 4750
Wire Wire Line
	5100 4350 2250 4350
Wire Wire Line
	2250 4350 2250 4550
Wire Wire Line
	2050 4150 5100 4150
Wire Wire Line
	2050 4150 2050 4550
Wire Wire Line
	2500 2600 5100 2600
Wire Wire Line
	2500 2800 5100 2800
Wire Wire Line
	5700 1600 6650 1600
Wire Wire Line
	8650 1600 8650 2400
Wire Wire Line
	5700 3750 6650 3750
Wire Wire Line
	6650 3750 6650 1600
Connection ~ 6650 1600
Wire Wire Line
	6650 1600 8650 1600
$Comp
L power:+10V #PWR?
U 1 1 60ED92E4
P 4450 3800
F 0 "#PWR?" H 4450 3650 50  0001 C CNN
F 1 "+10V" H 4465 3973 50  0000 C CNN
F 2 "" H 4450 3800 50  0001 C CNN
F 3 "" H 4450 3800 50  0001 C CNN
	1    4450 3800
	1    0    0    -1  
$EndComp
$Comp
L power:+10V #PWR?
U 1 1 60EDAE62
P 4500 1450
F 0 "#PWR?" H 4500 1300 50  0001 C CNN
F 1 "+10V" H 4515 1623 50  0000 C CNN
F 2 "" H 4500 1450 50  0001 C CNN
F 3 "" H 4500 1450 50  0001 C CNN
	1    4500 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 1600 5500 1600
Wire Wire Line
	4500 1450 4500 1600
Wire Wire Line
	5500 3750 5050 3750
Wire Wire Line
	5050 3750 5050 3900
Wire Wire Line
	5050 3900 4450 3900
Wire Wire Line
	4450 3900 4450 3800
$EndSCHEMATC

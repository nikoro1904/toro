
#! /usr/bin/python3

"""
The init_all function initialises all hardware modules connected to toro and returns them in a dict
"""

from serial import Serial, SerialTimeoutException
from serial.tools.list_ports import comports
from time import sleep, time

MODULE_TIMEOUT = 2

def init_single_serial(device, baudrate, question, expected_response, timeout=1, write_timeout=1, module_timeout=2, verbose=False):
    """
    tries to connect to a serial device/port specified by its port name 'device' and handshake information 'question' and 'expected response'
    returns 1 if successful and 0 if not
    """
    if (verbose): print("Connecting to " + device)
    temp_connection = Serial(device, baudrate=baudrate, timeout=timeout, write_timeout=write_timeout)
    sleep(0.1) # little delay to wait for establishing connection
    
    try:
        temp_connection.write(question)
    except SerialTimeoutException as e:
        if (verbose): print("Timeout while writing to "+ device)
        return 0
    
    sleep(0.1) # little delay to wait for response
    start_time = time()
    while(temp_connection.in_waiting > 0):
        incoming = temp_connection.read()
        if (incoming == expected_response):
            if (verbose): print("Connection found!")
            temp_connection.close()
            return 1
        
        if (time() - start_time > module_timeout):
            if (verbose): print("timeout while reading from "+port.device)
            temp_connection.close()
            return 0

def init_motor_driver(verbose=False):
    motor_driver = dict()

    if (verbose):
        print("------------------------------------------")
        print("Module: motor driver")
        print("Connected via: USB cable to Arduino")
        print("Communication protocol: Serial, 115200 Baud/s")

    for port in comports(include_links=False):
        success = init_single_serial(port.device,baudrate=115200, question=b'\xfd', expected_response=b'\x41')
        if success:
            if(verbose): print("Motor driver found at " + port.device)
            motor_driver = Serial(port.device, baudrate=115200, timeout=1, write_timeout=1)
            sleep(0.1)
            break
    if (success != 1):                                                                                              
        if(verbose): print("E: Could not connect to motor driver module")
    
    if (verbose):
        print("------------------------------------------")

    return motor_driver

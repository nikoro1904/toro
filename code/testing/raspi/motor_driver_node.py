#! /usr/bin/python3
"""
subscribes to topic motor_commands_topic and translates to serial command for motor driver board
"""

from init_modules import init_motor_driver
from time import sleep

motor_driver = init_motor_driver()

while True:
    # read ROS motor_command_topic message
    # check ROS topic message if valid
    # if valid: send command to serial device

    # read serial responses from serial device
    # send them to ROS motor_response_topic
    
    motor_driver.write(b'\x00')
    sleep(4)
    motor_driver.write(b'\x03')
    sleep(4)
    motor_driver.write(b'\xff')
    sleep(4)


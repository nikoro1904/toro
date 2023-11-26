
from smbus import SMBus
import cv2 as cv
import time

def main():
    """
    Main program function
    """
    i2cbus = SMBus(1)
    i2caddress = 0x04

    while True:
        keyboard_input = input("Enter command: ")
        i2cbus.write_byte(i2caddress, int(keyboard_input, 16))

if __name__ == "__main__":
    main()
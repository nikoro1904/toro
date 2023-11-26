import init_modules
from time import sleep

motor_driver = init_modules.init_motor_driver()["object"]

motor_driver.write(b'\x00')
sleep(4)
motor_driver.write(b'\xff')
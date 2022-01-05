

# author: Niko Rosberg
# date: 9.11.2021
# description: This code is meant to simulate the current
# going through the stepper motor windings when powered with
# different voltages in order to estimate the torque for
# different voltages and different time intervals between steps


import numpy as np
import matplotlib.pyplot as plt
plt.close("all")

# constants 
NOM_CURRENT = 0.33 # Ampere
NOM_VOLTAGE = 10.4 # Volt
WINDING_RESISTANCE = 31.5 # Ohm +- 3.1 Ohm
WINDING_INDUCTANCE = 0.071 # Henry
MAX_POWER = 6.9 # Watt

# time vector
t = np.linspace(0,20,1000) # milli seconds
# interval vector
intervals = [2, 5, 7, 10, 15, 20, 30]


def calc_current_on(timevector, voltage):
    """
    Ideal coil: i = L*integral{0}{t}{u*dt}
    Ideal Resistor: i = u/R
    """
    tau = WINDING_INDUCTANCE / WINDING_RESISTANCE # shape=(1,)
    prescaler = voltage/WINDING_RESISTANCE # shape=shape(voltage)
    current = np.outer(prescaler,(1-np.exp(-(timevector/1000)/tau)))
    return current
    
# %%
plt.close("all")

voltages = np.array([8, 10, NOM_VOLTAGE, 12, 14, 16, 20])
i = calc_current_on(t, voltages)

plt.figure()
for idx, v in enumerate(voltages):
    plt.plot(t,i[idx,:], label=str(v)+" V")
# plt.vlines(intervals, 0, np.max(i[idx,:]))
plt.xlabel("time in ms")
plt.ylabel("current in A")
plt.grid()
plt.legend()
plt.show()

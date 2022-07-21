// 

#include <Wire.h>       // library for I2C
#include "BluetoothSerial.h" // library for bluetooth

#define I2C_FREQ 100000 // 100kHz I2C speed
#define SDA_0 21        // SDA pin
#define SCL_0 22        // SCL pin
#define NANO 0x04      // slave I2C adress

TwoWire I2C_0 = TwoWire(0); // instantiate I2C bus
BluetoothSerial SerialBT;


byte bt_message = 0;    // byte for receiving
byte i2c_message = 0;   // byte for sending
#define LED 2           // internal LED pin

void setup() {
  // put your setup code here, to run once:
  I2C_0.begin(SDA_0, SCL_0, I2C_FREQ); // begin I2C bus
  SerialBT.begin("ESP32test");
  
  pinMode(LED, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:

  // recieve bluetooth message
  if(SerialBT.available()) {
    digitalWrite(LED, HIGH);
    bt_message = SerialBT.read();

    i2c_message = bt_message;

    // send i2c_message to the slave
    I2C_0.beginTransmission(NANO);
    I2C_0.write(i2c_message);
    I2C_0.endTransmission();
  }
  delay(10);
  digitalWrite(LED, LOW);
}

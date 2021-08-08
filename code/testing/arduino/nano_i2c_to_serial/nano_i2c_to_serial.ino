
#include <Wire.h>
#define I2C_ADDRESS 0x04

void receiveEvent(int howMany) {
  while(Wire.available()) {
    byte b = Wire.read();
    Serial.write((int)b);
  }
}

void setup() {
  // put your setup code here, to run once:
  Wire.begin(I2C_ADDRESS);
  Wire.onReceive(receiveEvent);

  Serial.begin(115200);
  Serial.println("End of Setup");
}

void loop() {
  // put your main code here, to run repeatedly:
  delay(100);

}

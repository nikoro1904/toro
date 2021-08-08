
#include <Wire.h>
#define I2C_ADDRESS 0x04

#define LED LED_BUILTIN

void blink_once(int wait_ms) {
  digitalWrite(LED, HIGH);
  delay(wait_ms);
  digitalWrite(LED, LOW);
  delay(wait_ms);
}

void blink_twice(int wait_ms) {
  digitalWrite(LED, HIGH);
  delay(wait_ms);
  digitalWrite(LED, LOW);
  delay(wait_ms);
  digitalWrite(LED, HIGH);
  delay(wait_ms);
  digitalWrite(LED, LOW);
  delay(wait_ms);
}

void receiveEvent(int howMany) {
  while(Wire.available()) {
    int b = static_cast<int>(Wire.read());
    //char b = Wire.read();
    if (b == 1) {
      blink_once(500);
      Serial.println("Eins");
    } else if(b == 2) {
      Serial.println("Zwei");
      blink_twice(500);
      blink_twice(500);
    }
  }
}

void setup() {
  // put your setup code here, to run once:
  Wire.begin(I2C_ADDRESS);
  Wire.onReceive(receiveEvent);

  Serial.begin(115200);
}

void loop() {
  // put your main code here, to run repeatedly:
  delay(100);

}

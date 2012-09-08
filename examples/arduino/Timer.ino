//
// The Tank Project
// http://tank.stevenocchipinti.com
//
// A simple sketch that triggers a relay on regular intervals
// using the Freetronics LeoStick
//

int led = 13;                 // The LED on the LeoStick
int snd = 11;                 // The Piezo on the LeoStick
int gun = 1;                  // Where the relay for controlling the gun is
int on = 0;                   // Always on for testing

// the setup routine runs once when you press reset:
void setup() {
  pinMode(led, OUTPUT);
  pinMode(gun, OUTPUT);
  pinMode(on, OUTPUT);

  digitalWrite(on, HIGH);
  delay(2000);                // 2 seconds
}

// the loop routine runs over and over again forever:
void loop() {
  digitalWrite(on, HIGH);
  digitalWrite(led, HIGH);
  digitalWrite(gun, HIGH);
  delay(305);                 // The cycle time for 1 shot of the Nerf Stampede
  digitalWrite(led, LOW);
  digitalWrite(gun, LOW);
  delay(10000);               // Wait for 10 seconds and go again
}

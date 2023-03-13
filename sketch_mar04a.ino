
#include "FastLED.h"
# define LED_PIN 3
# define NUM_LEDS 60
CRGB leds[NUM_LEDS];

bool button1 = false;
const int buttonPin1 = 2;
const int buttonPin2 = 4;
const int buttonPin3 = 5;
const int buttonPin4 = 6;

void setup() {

  pinMode(buttonPin1, INPUT);
  pinMode(buttonPin2, INPUT);
  pinMode(buttonPin3, INPUT);
  pinMode(buttonPin4, INPUT);
  Serial.begin(9600);
  FastLED.addLeds<WS2812, LED_PIN, GRB>(leds, NUM_LEDS);
}

void loop() {
  if (digitalRead(buttonPin1) == HIGH) {
    if (!button1) {
      Serial.println("ON");
      for (int i = 0; i<NUM_LEDS; i++) {
        leds[i] = CRGB (0,255,0);
        FastLED.show();
      }
    } else {
      Serial.println("OFF");
      for (int i = 0; i<NUM_LEDS; i++) {
        leds[i] = CRGB (0,0,0);
        FastLED.show();
      }
    }
    button1 = !button1;
    delay(100);
  } 
  if (digitalRead(buttonPin2) == HIGH) {
    Serial.println("1");
    delay(100);
  } 
  if (digitalRead(buttonPin3) == HIGH) {
    Serial.println("2");
    delay(100);
  } 
  if (digitalRead(buttonPin4) == HIGH) {
     Serial.println("3");
    delay(100);
  } 
}

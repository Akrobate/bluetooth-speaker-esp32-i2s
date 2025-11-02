#include <Arduino.h>


#define PIN_BUTTON_PLAY_PAUSE 1
#define PIN_BUTTON_NEXT 2
#define PIN_BUTTON_PREVIOUX 3
#define PIN_VOLUME_UP 4
#define PIN_VOLUME_DOWN 5


void setup() {
    pinMode(PIN_BUTTON_PLAY_PAUSE, INPUT);
    pinMode(PIN_BUTTON_NEXT, INPUT);
    pinMode(PIN_BUTTON_PREVIOUX, INPUT);
    pinMode(PIN_VOLUME_UP, INPUT);
    pinMode(PIN_VOLUME_DOWN, INPUT);
}

void loop() {


}

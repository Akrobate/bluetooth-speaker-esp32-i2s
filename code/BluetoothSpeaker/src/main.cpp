#include <Arduino.h>
#include <Toggle.h>
#include <AudioTools.h>
#include <BluetoothA2DPSink.h>
#include <configuration.h>

Toggle * button_play_pause;
Toggle * button_next;
Toggle * button_previous;
Toggle * button_volume_up;
Toggle * button_volume_down;

I2SStream i2s;
BluetoothA2DPSink a2dp_sink(i2s);


void updateButtons();

void setup() {
    pinMode(PIN_BUTTON_PLAY_PAUSE, INPUT_PULLUP);
    pinMode(PIN_BUTTON_NEXT, INPUT_PULLUP);
    pinMode(PIN_BUTTON_PREVIOUX, INPUT_PULLUP);
    pinMode(PIN_VOLUME_UP, INPUT_PULLUP);
    pinMode(PIN_VOLUME_DOWN, INPUT_PULLUP);

    button_play_pause = new Toggle(PIN_BUTTON_PLAY_PAUSE);
    button_next = new Toggle(PIN_BUTTON_NEXT);
    button_previous = new Toggle(PIN_BUTTON_PREVIOUX);
    button_volume_up = new Toggle(PIN_VOLUME_UP);
    button_volume_down = new Toggle(PIN_VOLUME_DOWN);

    a2dp_sink.start("MyMusic");
}

void loop() {
    updateButtons();
}


void updateButtons() {
    button_play_pause->poll();
    button_next->poll();
    button_previous->poll();
    button_volume_up->poll();
    button_volume_down->poll();
}


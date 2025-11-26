#include <Arduino.h>
#include <Toggle.h>
#include <AudioTools.h>
#include <BluetoothA2DPSink.h>
#include <configuration.h>

#define VOLUME_MAX 255

Toggle * button_play_pause;
Toggle * button_next;
Toggle * button_previous;
Toggle * button_volume_up;
Toggle * button_volume_down;

I2SStream i2s;
BluetoothA2DPSink * a2dp_sink = nullptr;

int volume = 0;



void updateButtons();

void setup() {

    auto config = i2s.defaultConfig(TX_MODE);
    config.pin_bck = PIN_I2S_BCK;
    config.pin_ws = PIN_I2S_WS;
    config.pin_data = PIN_I2S_DATA;

    i2s.begin(config);

    a2dp_sink = new BluetoothA2DPSink(i2s);

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

    a2dp_sink->start(BLUETOOTH_NAME);

}

void loop() {
    updateButtons();

	if (button_volume_up->onPress()) {
		volume = a2dp_sink->get_volume();
        if (volume < VOLUME_MAX) {
            volume += 1;
            a2dp_sink->set_volume(volume);
        }
	}


	if (button_volume_down->onPress()) {
		volume = a2dp_sink->get_volume();
        if (volume > 0) {
            volume -= 1;
            a2dp_sink->set_volume(volume);
        }
	}

}


void updateButtons() {
    button_play_pause->poll();
    button_next->poll();
    button_previous->poll();
    button_volume_up->poll();
    button_volume_down->poll();    
}


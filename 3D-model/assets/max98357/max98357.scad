include <./configuration.scad>

use <../he14/he14.scad>

// https://cdn-learn.adafruit.com/downloads/pdf/adafruit-max98357-i2s-class-d-mono-amp.pdf


module max98357(display_pins = true) {

    difference() {
        color("Purple")
            cube(max98357_board_size);

        for (max98357_fixing_throws_offset = max98357_fixing_throws_offset_list) {
            translate(max98357_fixing_throws_offset)
                cylinder(d = max98357_fixing_throws_diameter, h = max98357_board_size.z * 4, center = true, $fn = 100);
        }
    }

    translate([2.54 / 2, 0.1 * 25.4]) {
        if (display_pins)
            he14malen(7, 1);
        translate([0, 0, max98357_board_size.z])
            he14padn(7, 1);
    }

    for (max98357_speaker_pads_coords = max98357_speaker_pads_coords_list) {
            translate([max98357_speaker_pads_coords.x, max98357_speaker_pads_coords.y, max98357_board_size.z])
                he14padn(1, 1);
    }
}


module max98357CenterOnFixationThrow() {
    translate(-max98357_fixing_throws_offset_list[0])
        children();
}


module max98357CenterModule() {
    translate([-max98357_board_size.x / 2, -max98357_board_size.y / 2])
        children();
}


max98357CenterModule()
    max98357(false);
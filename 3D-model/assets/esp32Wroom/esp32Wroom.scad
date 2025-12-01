include <./configuration.scad>
use <../he14/he14.scad>


module esp32Wroom(display_pins = true) {

    difference() {
        color("DarkSlateGray")
            cube(esp32_wroom_board_size);

        for (esp32_wroom_fixation_throws = esp32_wroom_fixation_throws_list) {
            translate(esp32_wroom_fixation_throws)
                cylinder(d = esp32_wroom_throws_diameter, h = esp32_wroom_board_size.z * 4, center = true, $fn = 100);
        }
    }
// esp32_wroom_pin_coords_list

    for (esp32_wroom_pin_coords = esp32_wroom_pin_coords_list) 
        translate(esp32_wroom_pin_coords) {
            if (display_pins)
                he14malen(19, 1);
            translate([0, 0, esp32_wroom_board_size.z])
                he14padn(19, 1);
        }

    // for (max98357_speaker_pads_coords = max98357_speaker_pads_coords_list) {
    //         translate([max98357_speaker_pads_coords.x, max98357_speaker_pads_coords.y, max98357_board_size.z])
    //             he14padn(1, 1);
    // }

}


esp32Wroom(true);
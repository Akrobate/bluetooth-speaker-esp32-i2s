include <configurations/global.scad>

include <assets/battery/configurations.scad>
use <assets/speaker40mm/speaker40mm.scad>
use <assets/usb-connector/usbConnector.scad>
use <assets/on-off-button/onOffButton.scad>
use <assets/max98357/max98357.scad>
use <assets/esp32Wroom/esp32Wroom.scad>

use <components/housingComponent.scad>
use <components/motherBoardComponent.scad>

use <pieces/housingBorderPiece.scad>
use <pieces/facadeFrontPiece.scad>


module main() {

    rotate([90,0,0])
        for(speaker_x_y_coords = speakers_x_y_coords)
            translate([speaker_x_y_coords.x, speaker_x_y_coords.y, case_external_z_size - case_external_panes_thickness])
                speaker40mm();

    rotate([90,0,0])
        housingComponent();

    rotate([90,0,0])
        translate(chargerConnector_position_coords)
            rotate([0, -90, 0])
                usbConnector();

    rotate([90,0,0])
        translate(onOffButton_position_coords)
            rotate([-90,0,0])
                onOffButton();

    // Button
    rotate([90,0,0])
        for(control_buttons_position_coords = control_buttons_position_coords_list)
            translate(control_buttons_position_coords)
                rotate([-90,0,0])
                    onOffButton();

    // Electronic parts
    translate([0,0,-30])
        max98357();

    translate([0,0,-60])
        charger();

    translate([0,0,-90])
        dc2dc();

    translate([0,0, 25])
        rotate([90,0,0])
            esp32Wroom();

}

main();

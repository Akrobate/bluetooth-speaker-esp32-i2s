include <configurations/global.scad>

include <assets/battery/configurations.scad>
use <assets/battery/battery.scad>
use <assets/speaker40mm/speaker40mm.scad>
use <assets/usb-connector/usbConnector.scad>
use <assets/on-off-button/onOffButton.scad>

use <components/housingComponent.scad>
use <components/motherBoardComponent.scad>

use <pieces/housingBorderPiece.scad>
use <pieces/facadeFrontPiece.scad>



module main() {

    for(speaker_x_y_coords = speakers_x_y_coords)
        translate([speaker_x_y_coords.x, speaker_x_y_coords.y, case_external_z_size - case_external_panes_thickness])
            speaker40mm();

    translate([
        case_external_x_size / 2,
        housingBorderPiece_border_thickness,
        case_external_panes_thickness
    ])
        translate([- Battery_x_size / 2, 0, 0])
            battery(center = false);

    housingComponent();

    translate(chargerConnector_position_coords)
        rotate([0, -90, 0])
            usbConnector();

    translate(onOffButton_position_coords)
        rotate([-90,0,0])
            onOffButton();

    // Button
    for(control_buttons_position_coords = control_buttons_position_coords_list)
        translate(control_buttons_position_coords)
            rotate([-90,0,0])
                onOffButton();


    // Electronic parts

    translate([0,0,-30])
        dacModule();

    translate([0,0,-60])
        charger();

    translate([0,0,-90])
        dc2dc();
}

rotate([90,0,0])
    main();

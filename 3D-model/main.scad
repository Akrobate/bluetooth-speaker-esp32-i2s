include <configurations/global.scad>

use <openscad_modules/speaker/speaker40mm/speaker40mm.scad>
use <openscad_modules/button/onOffButton/onOffButton.scad>
use <assets/usb-connector/usbConnector.scad>
use <assets/max98357/max98357.scad>
use <assets/esp32Wroom/esp32Wroom.scad>

use <components/housingComponent.scad>
use <components/motherBoardComponent.scad>
use <components/backFacadeComponent.scad>

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
        backFacadeComponent();

    // Button
    rotate([90,0,0])
        for(control_buttons_position_coords = control_buttons_position_coords_list)
            translate(control_buttons_position_coords)
                rotate([-90,0,0])
                    onOffButton();

    // Electronic parts
    translate([housingBorderPiece_border_thickness, -case_external_panes_thickness, 0])
        rotate([90, 0, -90])
            translate([max98357_center_coords.x, max98357_center_coords.y])
                rotate([180, 0, 180])
                    max98357CenterModule()   
                        max98357();

    translate([case_external_x_size - housingBorderPiece_border_thickness, -case_external_panes_thickness, 0])
        rotate([90, 0, -90])
            translate([max98357_center_coords.x, max98357_center_coords.y])
                rotate([180, 180, 180])
                    max98357CenterModule()   
                        max98357();

    translate([0,0,-60])
        charger();

    translate([0,0,-90])
        dc2dc();

    translate([30, -56, 6])
        esp32Wroom();

}

main();

include <configurations/global.scad>

include <assets/battery/configurations.scad>
use <assets/battery/battery.scad>
use <assets/speaker40mm/speaker40mm.scad>
use <assets/usb-connector/usbConnector.scad>
use <assets/on-off-button/onOffButton.scad>

use <components/housingComponent.scad>

use <pieces/housingBorderPiece.scad>
use <pieces/facadeFrontPiece.scad>


translate([0, 0, case_external_z_size - case_external_panes_thickness]) {
    translate(speaker_1_x_y_coords)
        speaker40mm();

    translate(speaker_2_x_y_coords)
        speaker40mm();
}



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


translate(photoButton_position_coords)
    rotate([-90,0,0])
        onOffButton();

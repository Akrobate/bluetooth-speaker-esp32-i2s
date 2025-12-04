include <../configurations/global.scad>

use <../pieces/facadeBackPiece.scad>

use <../assets/battery/battery.scad>
use <../assets/on-off-button/onOffButton.scad>
use <../assets/usb-connector/usbConnector.scad>

module backFacadeComponent() {

    facadeBackPiece();

    translate([
        case_external_x_size / 2,
        housingBorderPiece_border_thickness,
        case_external_panes_thickness
    ])
        translate([- Battery_x_size / 2, 0, 0])
            battery(center = false);

    translate(onOffButton_position_coords)
        rotate([180, 0, 0])
            onOffButton();

    translate(chargerConnector_position_coords)
        rotate([180, 0, 0])
            usbConnector();
}



backFacadeComponent();
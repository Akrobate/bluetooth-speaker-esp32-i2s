include <../configurations/global.scad>

use <../pieces/facadeBackPiece.scad>

use <../openscad_modules/battery/battery.scad>
use <../openscad_modules/button/onOffButton/onOffButton.scad>
use <../assets/usb-connector/usbConnector.scad>

module backFacadeComponent() {

    facadeBackPiece();

    translate([
        Battery_coords_position.x,
        Battery_coords_position.y,
        case_external_panes_thickness
    ])
        battery(center = false);

    translate(onOffButton_position_coords)
        rotate([180, 0, 0])
            onOffButton();

    translate(chargerConnector_position_coords)
        rotate([180, 0, 0])
            usbConnector();
}



backFacadeComponent();
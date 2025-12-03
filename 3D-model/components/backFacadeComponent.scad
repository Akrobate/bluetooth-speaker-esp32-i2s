include <../configurations/global.scad>

use <../pieces/facadeBackPiece.scad>

use <../assets/battery/battery.scad>
use <../assets/on-off-button/onOffButton.scad>

module backFacadeComponent() {

    facadeBackPiece();

    translate([
        case_external_x_size / 2,
        housingBorderPiece_border_thickness,
        case_external_panes_thickness
    ])
        translate([- Battery_x_size / 2, 0, 0])
            battery(center = false);

    translate([15, 30, 0])
        rotate([180, 0, 0])
            onOffButton();
}



backFacadeComponent();
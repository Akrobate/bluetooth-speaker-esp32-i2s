include <../configurations/global.scad>

use <../pieces/facadeBackPiece.scad>
use <../assets/battery/battery.scad>

module backFacadeComponent() {

    facadeBackPiece();

    translate([
        case_external_x_size / 2,
        housingBorderPiece_border_thickness,
        case_external_panes_thickness
    ])
        translate([- Battery_x_size / 2, 0, 0])
            battery(center = false);
}



backFacadeComponent();
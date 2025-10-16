include <configurations/global.scad>

use <assets/battery/battery.scad>
use <assets/speaker40mm/speaker40mm.scad>

use <pieces/housingBorderPiece.scad>
use <pieces/facadeFrontPiece.scad>


translate([
    case_external_x_size / 2,
    case_external_y_size / 2 + 10,
    case_external_z_size
]) {
    translate([-25, 0, 0])
        speaker40mm();

    translate([25, 0, 0])
        speaker40mm();
}

translate([case_external_x_size / 2, 15, case_external_z_size / 2])
    battery(true);

#translate([0, 0, case_external_panes_thickness])
    housingBorderPiece();

facadeFrontPiece();

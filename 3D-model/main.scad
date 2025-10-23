include <configurations/global.scad>

use <assets/battery/battery.scad>
use <assets/speaker40mm/speaker40mm.scad>

use <components/housingComponent.scad>

use <pieces/housingBorderPiece.scad>
use <pieces/facadeFrontPiece.scad>


translate([0, 0, case_external_z_size - case_external_panes_thickness]) {
    translate(speaker_1_x_y_coords)
        speaker40mm();

    translate(speaker_2_x_y_coords)
        speaker40mm();
}

translate([case_external_x_size / 2, 0, 0])
    battery(center = true);

housingComponent();

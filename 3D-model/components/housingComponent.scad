include <../configurations/global.scad>

use <../pieces/housingBorderPiece.scad>
use <../pieces/facadeFrontPiece.scad>
use <../pieces/facadeBackPiece.scad>

module housingComponent() {
    translate([0, 0, case_external_panes_thickness])
        housingBorderPiece();

    *facadeBackPiece();

    translate([0, 0, case_external_z_size - case_external_panes_thickness])
        facadeFrontPiece();

}

housingComponent();

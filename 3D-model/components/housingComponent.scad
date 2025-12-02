include <../configurations/global.scad>

use <../pieces/housingBorderPiece.scad>
use <../pieces/facadeFrontPiece.scad>


module housingComponent() {
    translate([0, 0, case_external_panes_thickness])
        housingBorderPiece();

    translate([0, 0, case_external_z_size - case_external_panes_thickness])
        facadeFrontPiece();

}

housingComponent();

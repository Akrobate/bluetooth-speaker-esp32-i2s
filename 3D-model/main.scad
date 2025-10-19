include <configurations/global.scad>

use <assets/battery/battery.scad>
use <assets/speaker40mm/speaker40mm.scad>

use <components/housingComponent.scad>

use <pieces/housingBorderPiece.scad>
use <pieces/facadeFrontPiece.scad>



translate(speaker_1_x_y_coords)
    speaker40mm();

translate(speaker_2_x_y_coords)
    speaker40mm();

housingComponent();

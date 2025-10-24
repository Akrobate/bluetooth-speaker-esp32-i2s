include <./../configurations/global.scad>
use <./../libraries/commons.scad>
use <./../libraries/electronics.scad>

use <./subpieces/roundedPaneSubpiece.scad>
use <./subpieces/speakerGridSubpiece.scad>


 /**
 * facadeFrontPiece
 * @name facadeFrontPiece
 * @description Piece can be printed or CNC cutted #3DPrint, #CNC
 * @type piece
 * @parent housingComponent
 * @stl
 */
module facadeFrontPiece(
    x_size = case_external_x_size,
    y_size = case_external_y_size,
    z_size = case_external_panes_thickness,
    throws_margin = facade_throws_margin,
    round_edges_radius = facade_front_round_edges_radius,
    throws_diameter = housing_facades_throws_diameter,
    $fn = facade_fn
) {
    echo(str("facadeFrontPiece ", "x_size: ", x_size, " y_size: ", y_size, " z_size: ", z_size));

    difference() {
        color("BurlyWood")
            roundedPaneSubpiece(
                [x_size, y_size, z_size],
                r1 = round_edges_radius,
                r2 = round_edges_radius,
                center = false,
                $fn = $fn
            );

        centeredFourPaneThrows([x_size, y_size, z_size], throws_margin, throws_diameter, $fn = $fn);
     
        for(item = [speaker_1_x_y_coords, speaker_2_x_y_coords])
            translate(item)
                speakerGrid(x_size = 40, section_count = 6, section_y_size = 4, section_y_margin = 2);
    }
}



facadeFrontPiece();



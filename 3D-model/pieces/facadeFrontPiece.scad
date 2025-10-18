include <./../configurations/global.scad>
use <./../libraries/commons.scad>
use <./../libraries/electronics.scad>

use <./subpieces/roundedPaneSubpiece.scad>


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

        translate([0, 0, -z_size / 2])
            forEachCoord([
                [throws_margin, throws_margin],
                [x_size - throws_margin, throws_margin],
                [throws_margin, y_size - throws_margin],
                [x_size - throws_margin, y_size - throws_margin,],
            ])
                cylinder(h = z_size * 2, d = throws_diameter, $fn = $fn);        
    

        translate([25, -30 / 2 + y_size / 2, 0])
            for(offset = [0, 10, 20, 30])
                translate([0, offset, 0])
                    section(width = 7, length = 30, center = true);


        translate([x_size - 25, -30 / 2 + y_size / 2, 0])
            for(offset = [0, 10, 20, 30])
                translate([0, offset, 0])
                    section(width = 7, length = 30, center = true);
    }
}


module section(width, length, center = true) {
    height = 40;
    translate([0, 0, -height / 2]) {
        if (center) {
            translate([-length / 2, 0, 0])
                hull() {
                    cylinder(d = width, h = height);
                    translate([length, 0, 0])
                        cylinder(d = width, h = height);
                }
        } else {
            hull() {
                cylinder(d = width, h = height);
                translate([length, 0, 0])
                    cylinder(d = width, h = height);
            }
        }
    }
}


facadeFrontPiece();



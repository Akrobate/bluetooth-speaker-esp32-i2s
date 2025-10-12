include <../../libraries/commons.scad>;
use <roundedPaneSubpiece.scad>

module housingBorderSubpiece(
    x_size = 50,
    y_size = 50,
    z_size = 15,
    round_edges_radius = 5,
    border_thickness = 2,
    insert_throw_diameter = 2,
    insert_throw_length = 2,
    facade_throws_margin = 2
) {

    epsilon = 0.1;

    thorws_coords_list = [
        [facade_throws_margin, facade_throws_margin],
        [facade_throws_margin, y_size - facade_throws_margin],
        [x_size - facade_throws_margin, y_size - facade_throws_margin],
        [x_size - facade_throws_margin, facade_throws_margin],
    ];


    //render() {
    difference() {
        union() {
            difference() {
                roundedPaneSubpiece(
                    [
                        x_size,
                        y_size,
                        z_size,
                    ],
                    round_edges_radius,
                    round_edges_radius,
                    center = false,
                    $fn = 100
                );

                translate([
                    border_thickness,
                    border_thickness,
                    -epsilon
                ])
                    roundedPaneSubpiece(
                        [
                            x_size - border_thickness * 2,
                            y_size - border_thickness * 2,
                            z_size + border_thickness * 2,
                        ],
                        round_edges_radius,
                        round_edges_radius,
                        center = false,
                        $fn = 100
                    );
            }

            translate([0, 0, 0])
                forEachCoord(thorws_coords_list)
                    cylinder(
                        d = 10,
                        h = z_size,
                        center = false,
                        $fn = 100
                    );

        }

        // facade inserts throws
        translate([0, 0, -epsilon])
            forEachCoord(thorws_coords_list)
                cylinder(
                    d = insert_throw_diameter,
                    h = insert_throw_length + epsilon,
                    center = false,
                    $fn = 100
                );

        translate([0, 0, z_size - insert_throw_length])
            forEachCoord(thorws_coords_list)
                cylinder(
                    d = insert_throw_diameter,
                    h = insert_throw_length + epsilon,
                    center = false,
                    $fn = 100
                );
    }

}


housingBorderSubpiece();


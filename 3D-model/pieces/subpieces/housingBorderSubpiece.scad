include <../../libraries/commons.scad>;
use <roundedPaneSubpiece.scad>

module housingBorderSubpiece(
    x_size = 60,
    y_size = 60,
    z_size = 30,
    round_edges_radius = 5,
    border_thickness = 4,
    insert_throw_diameter = 4.25,
    insert_throw_length = 2,
    insert_holder_diameter = 10,
    facade_throws_margin = 5,
    _fn = 100
) {

    epsilon = 0.1;

    thorws_coords_list = [
        [facade_throws_margin, facade_throws_margin],
        [facade_throws_margin, y_size - facade_throws_margin],
        [x_size - facade_throws_margin, y_size - facade_throws_margin],
        [x_size - facade_throws_margin, facade_throws_margin],
    ];

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
                    $fn = _fn
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
                        $fn = _fn
                    );
            }

            translate([0, 0, 0])
                forEachCoord(thorws_coords_list)
                    cylinder(
                        d = insert_holder_diameter,
                        h = z_size,
                        center = false,
                        $fn = _fn
                    );

        }

        // facade inserts throws
        translate([0, 0, -epsilon])
            forEachCoord(thorws_coords_list)
                cylinder(
                    d = insert_throw_diameter,
                    h = insert_throw_length + epsilon,
                    center = false,
                    $fn = _fn
                );

        translate([0, 0, z_size - insert_throw_length])
            forEachCoord(thorws_coords_list)
                cylinder(
                    d = insert_throw_diameter,
                    h = insert_throw_length + epsilon,
                    center = false,
                    $fn = _fn
                );
    }

}


housingBorderSubpiece();


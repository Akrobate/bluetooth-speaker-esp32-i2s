

module housingBorderSubpiece() {

    local_z_size = z_size - case_external_panes_thickness * 2;

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
                        local_z_size,
                    ],
                    round_edges_radius,
                    round_edges_radius,
                    center = false,
                    $fn = 100
                );

                translate([
                    border_thickness,
                    border_thickness,
                    -case_external_panes_thickness
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
                        h = local_z_size,
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

        translate([0, 0, local_z_size - insert_throw_length])
            forEachCoord(thorws_coords_list)
                cylinder(
                    d = insert_throw_diameter,
                    h = insert_throw_length + epsilon,
                    center = false,
                    $fn = 100
                );
    }

}


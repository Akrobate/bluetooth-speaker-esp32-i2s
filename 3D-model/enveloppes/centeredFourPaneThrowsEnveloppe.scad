use <../libraries/commons.scad>

module centeredFourPaneThrowsEnveloppe(x_y_z_size, throws_margin, throws_diameter) {
    translate([0, 0, - x_y_z_size.z / 2])
        forEachCoord([
            [throws_margin, throws_margin],
            [x_y_z_size.x - throws_margin, throws_margin],
            [throws_margin, x_y_z_size.y - throws_margin],
            [x_y_z_size.x - throws_margin, x_y_z_size.y - throws_margin],
        ])
            cylinder(h = x_y_z_size.z * 2, d = throws_diameter, $fn = $fn);
}

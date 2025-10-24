use <../../libraries/commons.scad>


/**
 * roundedPane
 * @name roundedPane
 * @description roundedPane
 * @type Supbiece
 * @parent 
 */
module roundedPaneSubpiece(
    x_y_z_size,
    r1,
    r2,
    center = false,
) {
    x = x_y_z_size[0];
    y = x_y_z_size[1];
    z = x_y_z_size[2];

    r = (r1 < r2) ? r2 : r1;

    module _pane() {
        hull() {
            translate([r, r, 0]) {
                cylinder(z, r1 = r1, r2 = r2);
            }

            translate([x - r, r, 0]) {
                cylinder(z, r1 = r1, r2 = r2);
            }

            translate([r, y - r, 0]) {
                cylinder(z, r1 = r1, r2 = r2);
            }

            translate([x - r, y - r, 0]) {
                cylinder(z, r1 = r1, r2 = r2);
            }
        }
    }

    if (center) {
        translate([-x / 2, -y / 2, -z / 2])
            _pane();
    } else {
        _pane();
    }

}


module centeredFourPaneThrows(x_y_z_size, throws_margin, throws_diameter) {
    translate([0, 0, - x_y_z_size.z / 2])
        forEachCoord([
            [throws_margin, throws_margin],
            [x_y_z_size.x - throws_margin, throws_margin],
            [throws_margin, x_y_z_size.y - throws_margin],
            [x_y_z_size.x - throws_margin, x_y_z_size.y - throws_margin],
        ])
            cylinder(h = x_y_z_size.z * 2, d = throws_diameter, $fn = $fn);
}


roundedPaneSubpiece(x_y_z_size = [100,50,5], r1 = 5, r2 = 5, $fn = 1000);

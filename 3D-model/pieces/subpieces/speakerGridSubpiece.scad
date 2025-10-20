
// speaker_asset_main_diameter

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
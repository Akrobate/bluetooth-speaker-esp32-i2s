
// speaker_asset_main_diameter


module speakerGrid(x_size, section_count, section_y_size, section_y_margin) {
    y_size = section_count * (section_y_size + section_y_margin) - section_y_margin;

    translate([0, - y_size / 2, 0])
    for(offset = [0 : section_count - 1])
        translate([
            0,
            offset * (section_y_size + section_y_margin) + section_y_size / 2,
            0
        ])
            section(width = section_y_size, length = x_size, center = true, $fn = 100);
}


module section(width, length, center = true) {
    height = 40;
    translate([0, 0, -height / 2]) {
        if (center) {
                hull() {
                    translate([-length / 2 + width / 2, 0, 0])
                        cylinder(d = width, h = height);
                    translate([length / 2 - width / 2, 0, 0])
                        cylinder(d = width, h = height);
                }
        } else {
            hull() {
                cylinder(d = width, h = height);
                translate([length - width, 0, 0])
                    cylinder(d = width, h = height);
            }
        }
    }
}


speakerGrid(
    x_size = 30,
    section_count = 5,
    section_y_size = 5,
    section_y_margin = 2
);


use <./roundedPaneSubpiece.scad>


module facadeSpeakerHolder(
    size
) {

    facade_speaker_holder_z_size = 1;

    translate([0, 0, z_size - facade_speaker_holder_z_size - (case_external_panes_thickness * 2)])
        difference() {

            union() {
                roundedPaneSubpiece([x_size, y_size, facade_speaker_holder_z_size], round_edges_radius, round_edges_radius);
                // Holding diameter
                holding_speaker_diameter = speaker_asset_main_diameter + 4;
                for (speaker_x_y_coords = speakers_x_y_coords)
                    translate(speaker_x_y_coords)
                        cylinder(d = holding_speaker_diameter, h = facade_speaker_holder_z_size * 3, center = true, $fn = 100);
            }

            // Inserts throw
            centeredFourPaneThrows([x_size, y_size, 1], facade_throws_margin, insert_throw_diameter, $fn = 100);
            
            // speakers throws
            *for (speaker_x_y_coords = speakers_x_y_coords)
                translate(speaker_x_y_coords)
                    cylinder(d = speaker_asset_main_diameter, h = facade_speaker_holder_z_size * 3, center = true, $fn = 100);


        }
}

facadeSpeakerHolder();
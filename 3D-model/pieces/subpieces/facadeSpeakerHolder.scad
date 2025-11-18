
include <../../configurations/global.scad>;
include <../../assets/speaker40mm/configurations.scad>;

use <./roundedPaneSubpiece.scad>


module facadeSpeakerHolder(
    x_size = case_external_x_size,
    y_size = case_external_y_size,
    facade_speaker_holder_z_size = facade_speaker_holder_z_size,
    round_edges_radius = facade_front_round_edges_radius,
    speaker_asset_main_diameter = speaker_asset_main_diameter,
    speakers_x_y_coords = speakers_x_y_coords,
    facade_throws_margin = facade_throws_margin,
    insert_throw_diameter = insert_throw_diameter,
) {
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

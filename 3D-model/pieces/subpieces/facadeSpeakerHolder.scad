
include <../../configurations/global.scad>;
include <../../openscad_modules/speaker/speaker40mm/configurations.scad>;

// debug
use <../../openscad_modules/speaker/speaker40mm/speaker40mm.scad>;

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

    epsilon = 0.01;
    one_speaker_holder = 3.5;
    margin_x_y_speader_holder = 0.3;
    margin_z_speader_holder = 0.3;      // Should add to holder

    difference() {


        union() {
            roundedPaneSubpiece([x_size, y_size, facade_speaker_holder_z_size], round_edges_radius, round_edges_radius);
            // Holding diameter
            holding_speaker_diameter = speaker_asset_main_diameter + 4;
            for (speaker_x_y_coords = speakers_x_y_coords)
                translate(speaker_x_y_coords)
                    translate([0, 0, facade_speaker_holder_z_size - 0.01])
                        cylinder(d = holding_speaker_diameter, h = one_speaker_holder, center = false, $fn = 200);
        }

        // speakers throws
        for (speaker_x_y_coords = speakers_x_y_coords)
            translate([speaker_x_y_coords.x, speaker_x_y_coords.y, -epsilon])
                cylinder(
                    d = speaker_asset_main_diameter + (margin_x_y_speader_holder * 2),
                    h = speaker_asset_base_border_z_size + epsilon + margin_z_speader_holder,
                    center = false,
                    $fn = 200
                );

        // speakers throws
        for (speaker_x_y_coords = speakers_x_y_coords)
            translate([speaker_x_y_coords.x, speaker_x_y_coords.y, speaker_asset_base_border_z_size - epsilon])
                cylinder(
                    d = speaker_asset_base_border_diameter + (margin_x_y_speader_holder * 2),
                    h = one_speaker_holder,
                    center = false,
                    $fn = 100
                );


        // Inserts throw
        centeredFourPaneThrows([x_size, y_size, 1], facade_throws_margin, insert_throw_diameter, $fn = 100);
       
    }



}

*for (speaker_x_y_coords = speakers_x_y_coords)
    translate(speaker_x_y_coords)
        translate([0, 0, -0.01])
            rotate([180,0,0])
            speaker40mm();

facadeSpeakerHolder();

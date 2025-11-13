include <../configurations/global.scad>;
include <../libraries/commons.scad>;
include <../assets/speaker40mm/configurations.scad>;

use <../enveloppes/onOffButtonThrowEnveloppe.scad>
use <../enveloppes/usbConnectorThrowEnveloppe.scad>

use <./subpieces/housingBorderSubpiece.scad>
use <./subpieces/roundedPaneSubpiece.scad>


/**
 * housingBorderPiece
 * @name housingBorderPiece
 * @description Piece must be printed
 * @type piece
 * @parent housingComponent
 * @stl
 */
module housingBorderPiece(
    x_size = case_external_x_size,
    y_size = case_external_y_size,
    z_size = case_external_z_size,
    round_edges_radius = facade_front_round_edges_radius,
    case_external_panes_thickness = case_external_panes_thickness,
    border_thickness = housingBorderPiece_border_thickness,
    insert_throw_diameter = insert_throw_diameter,
    insert_throw_length = insert_throw_length,
    facade_throws_margin = facade_throws_margin,
    onOffButton_position_coords = onOffButton_position_coords,
    chargerConnector_position_coords = chargerConnector_position_coords,
    speakers_x_y_coords = speakers_x_y_coords,
    usb_connector_throw_diameter = usb_connector_throw_diameter,
    usb_connector_throw_fn = usb_connector_throw_fn,
    Battery_x_position = Battery_x_position,
    Battery_x_size = Battery_x_size,
    throw_m3_diameter = throw_m3_diameter,
    speaker_asset_main_diameter = speaker_asset_main_diameter,
) {

    epsilon = 0.1;

    nut_encaps_depth = 2.6; // 2.8 is the depth of the battery nut encapsulation

    local_z_size = z_size - case_external_panes_thickness * 2;

    union() {


        // facadeSpeakerHolder() <- for replacement

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

        *difference() {
            housingBorderSubpiece(
                x_size = x_size,
                y_size = y_size,
                z_size = local_z_size,
                round_edges_radius = round_edges_radius,
                border_thickness = border_thickness,
                insert_throw_diameter = insert_throw_diameter,
                insert_throw_length = insert_throw_length,
                insert_holder_diameter = 10,
                facade_throws_margin = facade_throws_margin
            );

            // CHARGER CONNECTOR
            translate([
                chargerConnector_position_coords.x,
                chargerConnector_position_coords.y,
                chargerConnector_position_coords.z - case_external_panes_thickness
            ])
                rotate([0, -90, 0])
                    usbConnectorThrowEnveloppe();

            // Button
            translate([
                onOffButton_position_coords.x,
                onOffButton_position_coords.y,
                onOffButton_position_coords.z - case_external_panes_thickness
            ])
                rotate([-90,0,0])
                    onOffButtonThrowEnveloppe();


            // Battery throw
    //        color("Green")
    //            translate([Battery_x_position + Battery_x_size / 2, nut_encaps_depth, local_z_size / 2])
    //                rotate([90, 0, 0])
    //                    nutEncapsEnveloppe(border_thickness * 4);

        }
    }
                    
}



housingBorderPiece();

include <../configurations/global.scad>;
include <../libraries/commons.scad>;

use <../enveloppes/onOffButtonThrowEnveloppe.scad>
use <../enveloppes/usbConnectorThrowEnveloppe.scad>

use <./subpieces/housingBorderSubpiece.scad>


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
    photoButton_position_coords = photoButton_position_coords,
    chargerConnector_position_coords = chargerConnector_position_coords,
    usb_connector_throw_diameter = usb_connector_throw_diameter,
    usb_connector_throw_fn = usb_connector_throw_fn,
    Battery_x_position = Battery_x_position,
    Battery_x_size = Battery_x_size,
    throw_m3_diameter = throw_m3_diameter
) {

    epsilon = 0.1;

    nut_encaps_depth = 2.6; // 2.8 is the depth of the battery nut encapsulation

    local_z_size = z_size - case_external_panes_thickness * 2;

    //render() {
    difference() {
        housingBorderSubpiece(
            x_size = x_size,
            y_size = y_size,
            z_size = local_z_size,
            round_edges_radius = round_edges_radius,
            border_thickness = border_thickness,
            insert_throw_diameter = insert_throw_diameter,
            insert_throw_length = insert_throw_length,
            facade_throws_margin = facade_throws_margin
        );


        // Battery throw
//        color("Green")
//            translate([Battery_x_position + Battery_x_size / 2, nut_encaps_depth, local_z_size / 2])
//                rotate([90, 0, 0])
//                    nutEncapsEnveloppe(border_thickness * 4);

        // Button
//        translate([
//            photoButton_position_coords.x,
//            photoButton_position_coords.y,
//            photoButton_position_coords.z - case_external_panes_thickness
//        ])
//            rotate([-90,0,0])
//                onOffButtonThrowEnveloppe();
                

        // CHARGER CONNECTOR
//        translate([
//            chargerConnector_position_coords.x,
//            chargerConnector_position_coords.y,
//            chargerConnector_position_coords.z - case_external_panes_thickness
//        ])
//            rotate([0, -90, 0])
//                usbConnectorThrowEnveloppe();
                
    }
    //}
}


housingBorderPiece();

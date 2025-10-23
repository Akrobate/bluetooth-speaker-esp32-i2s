// Display
display_buttons = true;

wood_throw_m3_diameter = 3.3;

// Generics
he14female_z_size = 8.5;
insert_throw_diameter = 4.25;
insert_throw_length = 6;
throw_m3_diameter = 3.5;

mil = 2.54;

// external size
case_external_x_size = 150; // 105
case_external_y_size = 55; // 66
case_external_z_size = 32;
case_external_panes_thickness = 4.8;


housing_facades_throws_diameter = wood_throw_m3_diameter;

facade_front_round_edges_radius = 5;
facade_throws_margin = 5;


speaker_center_offset = 45; // 25

// speakers
speaker_1_x_y_coords = [
    case_external_x_size / 2 - speaker_center_offset,
    case_external_y_size / 2
];

speaker_2_x_y_coords = [
    case_external_x_size / 2 + speaker_center_offset,
    case_external_y_size / 2
];


// facade corners
facade_fn = 100;

// Button
wood_facade_top_on_off_button_throw_diameter = 12.3;
facade_top_on_off_button_throw_diameter = 12.4;

// USB Connector
usb_connector_diameter = 10.65;
usb_connector_throw_diameter = 10.9;
usb_connector_throw_fn = 250;

motherBoardComponent_breadboard_camera_point_position = [5, 3];
breadboard_z_size = 1.5;


photoButton_position_coords = [19, case_external_y_size, case_external_z_size / 2];
chargerConnector_position_coords = [0, 18, case_external_z_size / 2];

onOffButtonThrowEnveloppe_fn = 250;
boltEnveloppe_fn = 100;

// Housing border
housingBorderPiece_border_thickness = 4;

// Battery
Battery_x_size = 75.8;
Battery_y_size = 21.4;
Battery_z_size = 21.4;

Battery_x_position = case_external_x_size / 2 - Battery_x_size / 2 + 2.5;

// Usb Connector
//usbConnectorThrowEnveloppe_margin = 0.25;
//usbConnectorThrowEnveloppe_length = 20;
//usbConnectorThrowEnveloppe_fn = 100;

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
case_external_x_size = 110; // 105
case_external_y_size = 55; // 66
case_external_z_size = 60;
case_external_panes_thickness = 4.8;


housing_facades_throws_diameter = wood_throw_m3_diameter;

facade_front_round_edges_radius = 5;
facade_throws_margin = 5;

facade_speaker_holder_z_size = 1;

speaker_border_offset = 30; // 25

// speakers
speaker_1_x_y_coords = [
    speaker_border_offset,
    case_external_y_size / 2
];

speaker_2_x_y_coords = [
    case_external_x_size - speaker_border_offset,
    case_external_y_size / 2
];

speakers_x_y_coords = [
    speaker_1_x_y_coords,
    speaker_2_x_y_coords
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


onOffButton_position_coords = [15, 30];
chargerConnector_position_coords = [15, 15];

control_buttons_position_coords_list = [
    [19 * 2, case_external_y_size, case_external_z_size / 2],
    [19 * 3, case_external_y_size, case_external_z_size / 2],
    [19 * 4, case_external_y_size, case_external_z_size / 2]
];

onOffButtonThrowEnveloppe_fn = 250;
boltEnveloppe_fn = 100;

// Housing border
housingBorderPiece_border_thickness = 4;

Battery_coords_position = [23, 4];

// Usb Connector
usbConnectorThrowEnveloppe_margin = 0.25;
usbConnectorThrowEnveloppe_length = 20;
usbConnectorThrowEnveloppe_fn = 100;


max98357_center_coords = [20, 30];
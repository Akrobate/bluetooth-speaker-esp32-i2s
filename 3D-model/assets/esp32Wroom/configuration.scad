
esp32_wroom_board_size = [55.1, 27.7, 1.5];

esp32_wroom_throws_diameter = 2.54;
esp32_wroom_throws_x_gap = 50.8;
esp32_wroom_throws_y_gap = 23.5;

esp32_wroom_pins_count = 19 * 2;
esp32_wroom_connectors_gap_count = 11;

esp32_wroom_fixation_throws_list = [
    [esp32_wroom_board_size.x / 2 - esp32_wroom_throws_x_gap / 2, esp32_wroom_board_size.y / 2 - esp32_wroom_throws_y_gap / 2],
    [esp32_wroom_board_size.x / 2 + esp32_wroom_throws_x_gap / 2, esp32_wroom_board_size.y / 2 - esp32_wroom_throws_y_gap / 2],
    [esp32_wroom_board_size.x / 2 + esp32_wroom_throws_x_gap / 2, esp32_wroom_board_size.y / 2 + esp32_wroom_throws_y_gap / 2],
    [esp32_wroom_board_size.x / 2 - esp32_wroom_throws_x_gap / 2, esp32_wroom_board_size.y / 2 + esp32_wroom_throws_y_gap / 2]
];

esp32_wroom_pin_coords_list = [
    [
        esp32_wroom_board_size.x / 2 - (esp32_wroom_pins_count / 2 - 1) / 2 * 2.54,
        esp32_wroom_board_size.y / 2 - (esp32_wroom_connectors_gap_count - 1) / 2 * 2.54
    ],
    [
        esp32_wroom_board_size.x / 2 - (esp32_wroom_pins_count / 2 - 1) / 2 * 2.54,
        esp32_wroom_board_size.y / 2 + (esp32_wroom_connectors_gap_count - 1) / 2 * 2.54
    ],
];


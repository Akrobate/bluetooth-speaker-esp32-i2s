max98357_board_size = [17.78, 19.05, 1.6];

max98357_fixing_throws_distance = 0.5 * 25.4;

max98357_fixing_throws_offset_list = [
    [((max98357_board_size.x - max98357_fixing_throws_distance) / 2), 0.65 * 25.4],
    [max98357_board_size.x - ((max98357_board_size.x - max98357_fixing_throws_distance) / 2), 0.65 * 25.4]
];

max98357_fixing_throws_diameter = 0.1 * 25.4;

max98357_speaker_pads_gap = 3.35;

max98357_speaker_pads_coords_list = [
    [max98357_board_size.x / 2 + max98357_speaker_pads_gap / 2, 0.61 * 25.4],
    [max98357_board_size.x / 2 - max98357_speaker_pads_gap / 2, 0.61 * 25.4],
];

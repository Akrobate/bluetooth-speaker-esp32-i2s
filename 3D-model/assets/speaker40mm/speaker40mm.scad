
include <configurations.scad>

module speaker40mm(
    speaker_asset_main_diameter = speaker_asset_main_diameter,
    speaker_asset_main_z_size = speaker_asset_main_z_size,
    speaker_asset_magnet_diameter = speaker_asset_magnet_diameter,
    speaker_asset_magnet_z_size = speaker_asset_magnet_z_size,
    speaker_asset_magnet_holder_diameter = speaker_asset_magnet_holder_diameter,

    speaker_asset_base_border_z_size = speaker_asset_base_border_z_size,
    speaker_asset_base_border_diameter = speaker_asset_base_border_diameter,

    speaker_asset_fn = speaker_asset_fn
) {
    color("DimGray")
        translate([0, 0, -speaker_asset_main_z_size])
            union() {

                translate([0, 0, 0])
                    cylinder(
                        h = speaker_asset_magnet_z_size,
                        d = speaker_asset_magnet_diameter,
                        $fn = speaker_asset_fn
                    );

                translate([0, 0, speaker_asset_magnet_z_size])
                    cylinder(
                        h = speaker_asset_main_z_size - speaker_asset_magnet_z_size - speaker_asset_base_border_z_size,
                        d1 = speaker_asset_magnet_holder_diameter,
                        d2 = speaker_asset_base_border_diameter,
                        $fn = speaker_asset_fn
                    );

                translate([0, 0, speaker_asset_main_z_size - speaker_asset_base_border_z_size])
                    cylinder(
                        h = speaker_asset_base_border_z_size,
                        d1 = speaker_asset_main_diameter,
                        d2 = speaker_asset_main_diameter,
                        $fn = speaker_asset_fn
                    );
            }
}


speaker40mm();
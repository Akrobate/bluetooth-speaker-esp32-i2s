include <configurations.scad>

/**
 * he14male1
 * @name he14male1
 * @description he14male1 One pin he14
 * @type asset
 * @parent 
 */
module he14male1() {

    _connector_fn = 4;
    mil = 2.54;

    x_size = mil;
    y_size = mil;

    translate([0, 0, -he14_isolation_z_size])
        color("Grey")
        cylinder(
            d = he14_isolation_diameter,
            h = he14_isolation_z_size,
            center = false,
            $fn = 8
        );

    translate([0, 0, -mil - 5.85])
        color("Yellow")
            cylinder(
                d = he14_connector_diametter,
                h = he14_connector_z_size,
                center = false,
                $fn = _connector_fn
            );
}


/**
 * he14XYLoop
 * @name he14XYLoop
 * @description helper for looping
 * @type asset
 * @parent 
 */
module he14XYLoop(x = 1, y = 1) {
    for (i = [0:x - 1]) {
        for(j = [0:y - 1]) {
            translate([i * 2.54, j * 2.54, 0])
                children();
        }
    }

}


/**
 * he14pad
 * @name he14pad
 * @description model of one pad
 * @type asset
 * @parent 
 */
module he14pad() {
    _fn = 30;
    epsilon = 0.1;

    difference() {
        cylinder(
            d = he14_pad_external_diameter,
            h = he14_pad_z_size,
            center = false,
            $fn = _fn
        );
        translate([0, 0, -epsilon])
            cylinder(
                d = he14_connector_throw_diametter,
                h = he14_pad_z_size + (epsilon * 2),
                center = false,
                $fn = _fn
            );
    }
}


/**
 * he14malen
 * @name he14malen
 * @description he14malen you can param the number of pins x and y sizes
 * @type asset
 * @parent 
 */
module he14malen(x = 1, y = 1) {
    he14XYLoop(x, y)
        he14male1();
}


/**
 * he14malen
 * @name he14malen
 * @description he14malen you can param the number of pins x and y sizes
 * @type asset
 * @parent 
 */
module he14padn(x = 1, y = 1) {
    he14XYLoop(x, y)
        he14pad();
}


module he14maleAndPadn(x = 1, y = 1, board_z_size = 1) {
    he14malen(x, y);
    translate([0, 0, board_z_size])
        he14padn(x, y);
}


he14malen(1, 10);

he14padn(1, 10);


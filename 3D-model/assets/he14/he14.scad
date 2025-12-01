/**
 * he14male1
 * @name he14male1
 * @description he14male1 One pin he14
 * @type asset
 * @parent 
 */
module he14male1(_connector_fn = 4) {

    mil = 2.54;

    connector_z_size = 11.2;
    connector_diametter = 0.6;

    x_size = mil;
    y_size = mil;

    cylinder_radius = mil;
    translate([0, 0, -mil])
        color("Grey")
        cylinder(d = mil, h = mil, center = false, $fn = 8);

    translate([0, 0, -mil - 5.85])
        color("Yellow")
            cylinder(d = connector_diametter, h = connector_z_size, center = false, $fn = _connector_fn);  
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
    pad_external_diameter = 2;
    pad_z_size = 0.1;
    connector_throw_diametter = 0.7;
    epsilon = 0.1;

    difference() {
        cylinder(d = pad_external_diameter, h = pad_z_size, center = false, $fn = _fn);
        translate([0,0, -epsilon])
            cylinder(d = connector_throw_diametter, h = pad_z_size + (epsilon * 2), center = false, $fn = _fn);
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

he14malen(1, 10);

he14padn(1, 10);


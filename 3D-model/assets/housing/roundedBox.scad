

module halfTopRoundedBoxEmpty(size, r, border_size) {
    epsilon = 0.1;
    difference() {
        halfTopRoundedBox(size, r);

        translate([border_size, border_size, -epsilon])
            halfTopRoundedBox(size = [
                size.x - border_size * 2,
                size.y - border_size * 2,
                size.z - border_size * 1 + epsilon,
            ], r = r - border_size);
    }
}


module halfTopRoundedBox(
    size,
    r
) {    
    hull() {
        translate([0, 0, 0])
            _positionningXY(size, r)
                cylinder(h = size.z - r, r = r);

        translate([0, 0, size.z - r])
            _positionningXY(size, r)
                sphere(r = r);
    }

}


module halfBottomRoundedBox(
    size,
    r
) {
    translate([0, 0, size.z])
        mirror([0,0,1])
            halfTopRoundedBox(size, r);
}


module halfBottomRoundedBoxEmpty(
    size,
    r,
    border_size
) {
    translate([0, 0, size.z])
        mirror([0,0,1])
            halfTopRoundedBoxEmpty(size, r, border_size);
}


module roundedBox(
    size,
    r
) {
    hull() {
        for(z_coord = [r, size.z - r]) {
            translate([0, 0, z_coord])
                _positionningXY(size, r)
                    sphere(r = r);
        }
    }
}


module _positionningXY(size, r) {

    coords = [
        [r, r, 0],
        [size.x-r, r, 0],
        [r, size.y-r, 0],
        [size.x-r, size.y-r, 0]
    ];

    for (coord = coords)
        translate(coord)
            children();
}




// roundedBox(
//halfTopRoundedBox(
*halfBottomRoundedBox(
    size = [50, 40, 25],
    r = 5
);



halfBottomRoundedBoxEmpty(
    size = [50, 40, 25],
    r = 10,
    border_size = 3,
    $fn = 100
);
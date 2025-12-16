include <../configurations/global.scad>

module insertThrowEnveloppe() {
    cylinder(d = 4.25, h = insert_throw_length, center = false);
}

insertThrowEnveloppe();

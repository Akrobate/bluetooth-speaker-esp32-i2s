include <configurations.scad>

/**
 * battery
 * @name battery
 * @description battery
 * @type component
 * @parent root
 */
module battery(
    center = false,
) {
    color("red")
    cube([
        Battery_x_size,
        Battery_y_size,
        Battery_z_size
    ], center = center);
}

battery();
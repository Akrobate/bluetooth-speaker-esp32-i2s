include <../configurations/global.scad>


/**
 * onOffButtonThrowEnveloppe
 * @name onOffButtonThrowEnveloppe
 * @description onOffButtonThrowEnveloppe
 * @type enveloppe
 * @parent root
 */
module onOffButtonThrowEnveloppe(
    z_size = case_external_panes_thickness * 3,
    throw_diameter = facade_top_on_off_button_throw_diameter,
    _fn = onOffButtonThrowEnveloppe_fn
) {
    cylinder(h = z_size, d = throw_diameter, center = true, $fn = _fn);
}

onOffButtonThrowEnveloppe();
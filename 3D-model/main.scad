use <assets/battery/battery.scad>
use <assets/speaker40mm/speaker40mm.scad>



translate([-25, 0, 0])
    speaker40mm();

translate([25, 0, 0])
    speaker40mm();


translate([0, 0, -15])
    rotate([0,0,90])
    battery(true);


*translate([0, -30, -15])
    battery(true);


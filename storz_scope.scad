//cs system, 
//z along barrel of scope,
//x horizontal
//y vertical

include<geometry.h>

union()
{
translate([0,0,-handle_length+mounting_width])
cylinder(d=scope_diameter,h=handle_length,$fn=60);
translate([0,0,mounting_width])
cylinder(d1=scope_diameter,d2=barrel_diameter, h=transition_length,$fn=60);
translate([0,0,mounting_width+transition_length])
cylinder(d=barrel_diameter, h = barrel_length,$fn=60);

}

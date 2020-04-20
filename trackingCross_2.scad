//cs system, 
//z along barrel of scope,
//x horizontal
//y vertical
include<geometry.h>
bar1_angle=(atan((centre1.y-centre2.y)/(centre1.x-centre2.x)));
bar2_angle=(atan((centre4.y-centre3.y)/(centre4.x-centre3.x)));
bar1_length=(sqrt((centre1.y-centre2.y)*(centre1.y-centre2.y)+ (centre1.x-centre2.x)*(centre1.x-centre2.x)));
bar2_length=(sqrt((centre3.y-centre4.y)*(centre3.y-centre4.y) + (centre3.x-centre4.x)*(centre3.x-centre4.x)));
bar1_offset=sqrt(centre1.y*centre1.y + centre1.x*centre1.x);
bar2_offset=sqrt(centre4.y*centre4.y + centre4.x*centre4.x);


translate([0,
mounting_height + scope_diameter/2 - (tracker_mount_height/2 - tracker_mount_pitch/2)*cos(scope_angle),
mounting_width + (tracker_mount_height/2-tracker_mount_pitch/2)*sin(scope_angle)])

rotate(scope_angle,[-1,0,0])

rotate(-cross_angle, [0,0,1])

translate([0.0, -tracker_mount_pitch/2 , 0.0])
difference()
{
union()
{
translate(centre1)
sphere(d=ball_diameter,$fn=30);
translate(centre2)
sphere(d=ball_diameter,$fn=30);
translate(centre3)
sphere(d=ball_diameter,$fn=30);
translate(centre4)
sphere(d=ball_diameter,$fn=30);

rotate(bar1_angle,[0,0,-1])
translate([-bar1_offset,-bar_width/2,0.0])
cube(size=[bar1_length, bar_width, bar_width]);

rotate(bar2_angle,[0,0,1])
translate([-bar2_offset,-bar_width/2,0.0])

cube(size=[bar2_length, bar_width, bar_width]);

translate(centre1)
translate([0,0,-centrez])
cylinder(d=bar_width,h=centrez);

translate(centre2)
translate([0,0,-centrez])
cylinder(d=bar_width,h=centrez);

translate(centre3)
translate([0,0,-centrez])
cylinder(d=bar_width,h=centrez);

translate(centre4)
translate([0,0,-centrez])
cylinder(d=bar_width,h=centrez);

//the mounting screw
translate([0,-tracker_mount_pitch/2,-tracker_mount_hole_depth])
cylinder(d=tracker_mount_hole_diameter,h=tracker_mount_hole_depth,$fn=20);

}
//the mounting hole
translate([0,tracker_mount_pitch/2,0])
cylinder(d=tracker_mount_pin_diameter,h=tracker_mount_pin_height,$fn=20);
}


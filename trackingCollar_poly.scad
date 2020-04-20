//cs system, 
//z along barrel of scope,
//x horizontal
//y vertical
include<geometry.h>

union()
{
//the top mounting block
difference()
{
union()
{
   translate([-(scope_diameter/2),0,0])
	cube(size=[mount_annular_thickness,mounting_height+scope_diameter/2,mounting_width]);
	translate([(scope_diameter/2)-mount_annular_thickness,0,0])
	cube(size=[mount_annular_thickness,mounting_height+scope_diameter/2,mounting_width]);	
// the mounting ring
	cylinder ( h=mounting_width, r = scope_diameter/2+mount_annular_thickness);
// the bosses
	translate([-(scope_diameter/2 + bolt_boss_size+mount_annular_thickness),-bolt_boss_size/2,0])
	cube(size=[scope_diameter+(2*bolt_boss_size)+2*mount_annular_thickness,bolt_boss_size,mounting_width]);
	
	polyhedron(points = [
//0
[ -scope_diameter/2 , mounting_height+scope_diameter/2 , mounting_width ],
//1
[ scope_diameter/2 , mounting_height+scope_diameter/2 , mounting_width ],
//2
[ scope_diameter/2 , 
mounting_height + scope_diameter/2- (tracker_mount_height * cos(scope_angle)),
mounting_width + (tracker_mount_height * sin(scope_angle))],
//3
[ -scope_diameter/2 , 
mounting_height + scope_diameter/2 - (tracker_mount_height * cos(scope_angle)),
mounting_width + (tracker_mount_height * sin(scope_angle))],
//4
[ -scope_diameter/2 , 
mounting_height + scope_diameter/2 - (tracker_mount_height / cos(scope_angle)),
mounting_width],
//5
[ scope_diameter/2 , 
mounting_height + scope_diameter/2 - (tracker_mount_height / cos(scope_angle)),
mounting_width],
//6
[ -scope_diameter/2 , mounting_height+scope_diameter/2 , mounting_width -tracker_mount_back_thickness],
//7
[ scope_diameter/2 , mounting_height+scope_diameter/2 , mounting_width - tracker_mount_back_thickness],
//8
[ -scope_diameter/2 , 
mounting_height + scope_diameter/2 - (tracker_mount_height / cos(scope_angle)),
mounting_width-tracker_mount_back_thickness],
//9
[ scope_diameter/2 , 
mounting_height + scope_diameter/2 - (tracker_mount_height / cos(scope_angle)),
mounting_width-tracker_mount_back_thickness]
 ],
faces = [[0,1,2,3],[0,3,4],[5,2,1],[4,3,2,5],[7,6,8,9],[4,5,9,8],[1,0,6,7],[0,4,8,6],[5,1,7,9]],
convexity = 1);
//the centre mounting pin	
translate([0,
mounting_height + scope_diameter/2 - (tracker_mount_height/2 - tracker_mount_pitch/2)*cos(scope_angle),
mounting_width + (tracker_mount_height/2 - tracker_mount_pitch/2)*sin(scope_angle)])
	rotate(scope_angle,[-1,0,0])
	translate([0,0,-hack])
	cylinder(h=tracker_mount_pin_height+hack,r=tracker_mount_pin_diameter/2,$fn=10);

};
	//the hole for the scope
	cylinder ( h=mounting_width, r = scope_diameter/2);
	//the split
	translate([-(scope_diameter/2 + bolt_boss_size + mount_annular_thickness),-split_size/2,0])
	cube(size=[scope_diameter+(2*bolt_boss_size)+mount_annular_thickness*2,split_size,mounting_width]);
	//the tracker mounting hole
	translate([0,
	mounting_height + scope_diameter/2 - (tracker_mount_height/2 - tracker_mount_pitch/2)*cos(scope_angle),
	mounting_width + (tracker_mount_height/2 - tracker_mount_pitch/2)*sin(scope_angle)])
	rotate(scope_angle,[-1,0,0])
	rotate(cross_angle, [0,0,1])
	translate([0,-tracker_mount_pitch,-tracker_mount_hole_depth])
	cylinder(h=tracker_mount_hole_depth,d=tracker_mount_hole_diameter,$fn=10);
//the other tracker mounting hole
	translate([0,
	mounting_height + scope_diameter/2 - (tracker_mount_height/2 - tracker_mount_pitch/2)*cos(scope_angle),
	mounting_width + (tracker_mount_height/2 - tracker_mount_pitch/2)*sin(scope_angle)])
	rotate(scope_angle,[-1,0,0])
	rotate(-cross_angle, [0,0,1])
	translate([0,-tracker_mount_pitch,-tracker_mount_hole_depth])
	cylinder(h=tracker_mount_hole_depth,d=tracker_mount_hole_diameter,$fn=10);

//one side mounting hole
//hack alert - added a bit to the hole depth, otherwise it doesn't 
// seem to work quite right
	translate ( [scope_diameter/2 - (tracker_mount_height/2 + tracker_mount_pitch/2)*sin(side_mount_angle),
mounting_height + scope_diameter/2 - (tracker_mount_height / cos(scope_angle)) + (tracker_mount_height/2 + tracker_mount_pitch/2)*cos(side_mount_angle)
,mounting_width/2] )
	rotate ( side_mount_angle, [0,0,1])	
	rotate ( 90, [0,1,0] )
	rotate(-side_cross_angle, [0,0,1])
	translate([0,-tracker_mount_pitch,-tracker_mount_hole_depth+hack])
	cylinder(h=tracker_mount_hole_depth+hack*2,d=tracker_mount_hole_diameter,$fn=10);
//the other side mounting hole
//hack alert - added a bit to the hole depth, otherwise it doesn't 
// seem to work quite right
	translate ( [-(scope_diameter/2 - (tracker_mount_height/2 + tracker_mount_pitch/2)*sin(side_mount_angle)),
mounting_height + scope_diameter/2 - (tracker_mount_height / cos(scope_angle)) + (tracker_mount_height/2 + tracker_mount_pitch/2)*cos(side_mount_angle)
,mounting_width/2] )
	rotate ( side_mount_angle, [0,0,-1])
	rotate ( 90, [0,-1,0] )
	rotate(side_cross_angle, [0,0,1])
	translate([0,-tracker_mount_pitch,-tracker_mount_hole_depth+hack])
cylinder(h=tracker_mount_hole_depth+hack*2,d=tracker_mount_hole_diameter,$fn=10);
	//the cut for one side mount
	translate([scope_diameter/2,mounting_height + scope_diameter/2 - (tracker_mount_height / cos(scope_angle)),0])
	rotate(side_mount_angle,[0,0,1])
	cube(size = [scope_diameter/2 + bolt_boss_size,
mounting_height,mounting_width + (tracker_mount_height * sin(scope_angle))]);
	//the cut for the other side mount
	translate([-scope_diameter/2,mounting_height + scope_diameter/2 - (tracker_mount_height / cos(scope_angle)),0])
	rotate(side_mount_angle,[0,0,-1])
	translate([-(scope_diameter/2 + bolt_boss_size),0,0])
	cube(size = [scope_diameter/2 + bolt_boss_size,
mounting_height,mounting_width + (tracker_mount_height * sin(scope_angle))]);
//the holes for the mounting bolts
//cube(size=[scope_diameter+(2*bolt_boss_size),bolt_boss_size,mounting_width]);
	translate([scope_diameter/2 + mount_annular_thickness+ bolt_boss_size/2,-(bolt_boss_size+hack)/2,mounting_width/2])
rotate(90,[-1,0,0])
cylinder(h=bolt_boss_size+hack,d=bolt_hole_size,$fn=20);
translate([-(scope_diameter/2 + mount_annular_thickness+ bolt_boss_size/2),-(bolt_boss_size+hack)/2,mounting_width/2])
rotate(90,[-1,0,0])
cylinder(h=bolt_boss_size+hack,d=bolt_hole_size,$fn=20);
//nut hole
for ( j = [ -1, 2, 1] ){
translate ( [j*(scope_diameter/2 + mount_annular_thickness+ bolt_boss_size/2),+(bolt_boss_size- nut_depth +hack)/2,mounting_width/2] )
rotate (90,[1,0,0])
for  ( i=[0,60,120] ){
rotate (i, [0,0,1])
cube(size=[nut_flat_width, nut_flat_radius * sin (30), nut_depth+hack],center=true);
}
}
//end of difference
}
//one side mounting pin
	translate ( [scope_diameter/2 - (tracker_mount_height/2 + tracker_mount_pitch/2)*sin(side_mount_angle),
mounting_height + scope_diameter/2 - (tracker_mount_height / cos(scope_angle)) + (tracker_mount_height/2 + tracker_mount_pitch/2)*cos(side_mount_angle)
,mounting_width/2] )
	rotate ( side_mount_angle, [0,0,1])
	rotate ( 90, [0,1,0] )
	cylinder(h=tracker_mount_pin_height,r=tracker_mount_pin_diameter/2,$fn=10);

//the other one side mounting pin
	translate ( [-(scope_diameter/2 - (tracker_mount_height/2 + tracker_mount_pitch/2)*sin(side_mount_angle)),
mounting_height + scope_diameter/2 - (tracker_mount_height / cos(scope_angle)) + (tracker_mount_height/2 + tracker_mount_pitch/2)*cos(side_mount_angle)
,mounting_width/2] )
	rotate ( side_mount_angle, [0,0,-1])
	rotate ( 90, [0,-1,0] )
	cylinder(h=tracker_mount_pin_height,r=tracker_mount_pin_diameter/2,$fn=10);
	for (i=[10:mounting_ridge_angle:350]){
	rotate (i, [0,0,1])
	translate ([scope_diameter/2 - mounting_ridge_size, 0 , 0 ])
	cube (size = [ mounting_ridge_size*2 , mounting_ridge_size, mounting_width]);}

}


//assume cylinder 25.4
//cylinder (h=mounting_width,r=scope_diameter/2);
//rotate (-scope_angle,[0,0,1])
		//cube(mounting_width,scope_diameter,30);
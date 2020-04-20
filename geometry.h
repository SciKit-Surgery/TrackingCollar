scope_diameter=34.3;
mounting_width=10.0;
mounting_height=30.0;
scope_angle=20;
side_mount_angle=10;
bolt_boss_size=9.0;
//for m3 mounting scress
bolt_hole_size=3.0;
mount_annular_thickness=5.0;
tracker_mount_height=23.0;
split_size=1.0;
mounting_ridge_size=0.5;
mounting_ridge_angle=20.0;
//we angle the tracking cross so that it fits more tightly round the scope #4012
cross_angle=30;
side_cross_angle=scope_angle;

//mount attached with a screw (m2?) and a pin 2mm dia on pitch 15 mm
// centres on mount block, pin is 4mm high (do pin at top, no real reason)

tracker_mount_pitch=15;
tracker_mount_pin_height=4.0;
tracker_mount_pin_diameter=2.0;
//m3 screws
tracker_mount_hole_diameter=2.5;
tracker_mount_hole_depth=8.0;
tracker_mount_back_thickness=2.0;

hack=1.0;

//details of the tracking cross
//moved centre from centre to hole (mount to post on collar) #4012
//and flip it over the x axis
ball_diameter=12.0;

centrez=15.0;

centre1=[0.0,-57.0,centrez];
centre2=[0.0,34.0,centrez];
centre3=[35.0,-5.0,centrez];
centre4=[-48.0,5.0,centrez];
bar_width=7.0;


//details of the scope (very approximate)

barrel_diameter=10.0;
handle_length=210.0;
transition_length=30.0;
barrel_length=600;

//m3 nut (http://www.fairburyfastener.com/xdims_metric_nuts.htm)
//for m3 width accross flats in 5.5 mm
//and depth is 2.4
nut_flat_width=5.7;
nut_depth=2.2;

nut_flat_radius = nut_flat_width / sin (120);



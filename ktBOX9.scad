//
// ktBOX9
//
//





gap1 = 0.001;
gap2 = 0.002;
th = 2;

X = 103;



base1();base1b();//base2();
difference(){c();base_diff();}
difference(){f();base_diff();}

    

translate([70+2, 0, 0]) rotate([0, 180, 0])
{
up();
difference(){d();up_diff();}
}


module base1()
{
difference()
{
    union()
    {
        translate([0, 0, -18/2]) cylinder(th, 70/2, 70/2, $fn=100);
    }
}
}
module base1b()
{
difference()
{
    union()
    {
        translate([0, 0, -18/2]) cylinder(18, 70/2, 70/2, $fn=100);
    }
    translate([0, 0, -18/2+th]) cylinder(18, 70/2-th, 70/2-th, $fn=100);
    
    translate([-50, -50+16-6, 18/2-th]) rotate([-45, 0, 0]) cube([100, 100, 100]);
    //#translate([-50, -50+16-6, 18/2-th]) rotate([-45+90, 180, 180]) cube([100, 100, 100]);
}
}
module base2()
{
difference()
{
    union()
    {
        resize([40+5, 25+4, 18-th]) cylinder( 1, center=true, $fn=100);
        translate([-5, 25, -18/2+th/2]) rotate([-10, 0, 0]) cube([10, th, 10]);
    }
    resize([40+5-th*2, 25+4-th*2, 18]) cylinder( 1, center=true, $fn=100);
    translate([7-th, 8, -18/2]) cube([10, 10, 18]);
}
}

module base_diff()
{
    translate([0, 0, 50]) cube([70,70,100], center=true);
    translate([0, 0, -18/2]) cylinder(18, 70/2, 70/2, $fn=100);
}
module base_diff2b()
{
difference()
{
    cube([50, 50, 18], center=true);
    rotate([0, 0, 22]) resize([40+5, 25+4, 18]) cylinder( 1, center=true, $fn=100);
}
}

module up()
{
difference()
{
    union()
    {
        translate([0, 0, -18/2+th]) cylinder(18-th, 70/2, 70/2, $fn=100);
    }
    translate([0, 0, -18/2-th]) cylinder(18, 70/2-th, 70/2-th, $fn=100);
    
    translate([-50, -50+16-6, 18/2-th]) rotate([-45+90, 180, 180]) cube([100, 100, 100]);
}
}
module up_diff()
{
    translate([0, 0, -50]) cube([70,70,100], center=true);
    translate([0, 0, -18/2]) cylinder(18, 70/2, 70/2, $fn=100);
}



module c()
{
translate([0, 55, 0]) difference()
{
    union()
    {
        translate([-30.3/2, -91, -9]) rotate([0, 0, -90]) hinge();
        translate([30.3/2-30/3+0.3, -91, -9]) rotate([0, 0, -90]) hinge();
        translate([-30/2, -91-6.5, -9]) cube([30, 6.5+10, 8-2]);
        
        translate([-(48.3/2)/2, -91-6.5/2, -10+8+2]) rotate([90, 0, 90]) cylinder( 1, 2, 2, center=true, $fn=30 );
    }
    translate([-(48.3/2)/2, -91-6.5/2, -10+8+2]) rotate([90, 0, 90]) cylinder( 1+gap2, 1, 1, center=true, $fn=30 );
}
}



module d()
{
translate([0, 55, 0]) difference()
{
    union()
    {
        translate([(30/3)/2-0.3/2, -91, 9]) rotate([0, 180, 90]) hinge();
        translate([-30.3/2, -91-6.5, 9-(8-2)]) cube([30.3, 6.5+10, 8-2]);
    }
}
}



module e()
{
translate([0, -18, 0]) difference()
{
    union()
    {
        translate([-30/2, 48+5-10, 0]) cube([30, 20, 18/2]);
        translate([-30/2, 48+10, 0-3]) cube([30, 5, 3]);
    }
}
}

module f()
{
translate([0, -18, 0]) difference()
{
    union()
    {
        translate([-30/2, 48+5-10, 0-3-6]) cube([30, 10+th, 6]);
    }
}
}



module screw_hole()
{
    cylinder( 10, 1.6, 1.6, $fn=30 );
    translate( [0, 0, 1.5] ) cylinder( 10, 6.5/2+0.1, 6.5/2+0.1, $fn=6 );
}



module rear_screw_hole()
{
    translate([0, 0, 3]) cylinder(5, 1.5, 1.5, $fn=30);
    translate([0, 0, 2.2-gap1]) cylinder(0.8+gap2, 1.5+0.7, 1.5, $fn=30);
    translate([0, 0, -gap1]) cylinder(2.2+gap1, 3.25+0.4, 3.25-0.6, $fn=30);
    translate([0, 0, -10]) cylinder(10, 3.25+0.4, 3.25+0.4, $fn=30);
}


module hinge()
{
h = 7;
hinge_x = 6.5;
hinge_y = 30/3-0.3;
hinge_hole = 1.1+0.4;
difference()
{
    union()
    {
        cube( [hinge_x, hinge_y, h+th] );
        translate( [hinge_x/2+0.25, hinge_y/2, h+th] ) rotate( [90, 0, 0] ) cylinder( hinge_y, hinge_x/2-0.25, hinge_x/2-0.25, center=true, $fn=30 );
    }
    translate( [hinge_x/2+0.25, hinge_y/2, h+th] )
     rotate( [90, 0, 0] ) cylinder( hinge_y+gap2, hinge_hole, hinge_hole, center=true, $fn=30 );
}
}

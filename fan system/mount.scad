$fs=0.5;

module hatch(){
	difference(){
		cylinder(3.5,r=8.5,center=true);
		cylinder(5,r=7,center=true);
	}
}



difference(){
	union(){
		cylinder(7,r=6);
		translate([0,-20,0])rotate([90,0,90])cylinder(10,r=8,center=true);
		translate([-5,-20,0])cube([10,20,6]);
	}
	translate([-10,-30,-10])cube([20,50,10]);
	cylinder(20,r=2.6,center=true);
	translate([0,-20,0])rotate([90,0,90])cylinder(20,r=4,center=true);
	translate([0,-20,0])rotate([0,90,0])hatch();
}

//cylinder(12,r=5);
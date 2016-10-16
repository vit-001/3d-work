$fs=1;

module holes(){
	translate([5,5,-3])cylinder(10,r=2.5);
	translate([55,5,-3])cylinder(10,r=2.5);
	translate([5,55,-3])cylinder(10,r=2.5);
	translate([55,55,-3])cylinder(10,r=2.5);
}

module plate(){
//	translate([5,5,0])cylinder(4,r=5);
//	translate([55,5,0])cylinder(4,r=5);
//	translate([5,55,0])cylinder(4,r=5);
//	translate([55,55,0])cylinder(4,r=5);
	difference(){
		translate([5,5,0]) minkowski(){ 
			cube([50,50,3]);	
			cylinder(1,r=5);
		}

		translate([5,5,-3])
			difference(){
				cube([50,50,10]);
				translate([0,0,-3])cylinder(10,r=5);
				translate([50,0,-3])cylinder(10,r=5);
				translate([0,50,-3])cylinder(10,r=5);
				translate([50,50,-3])cylinder(10,r=5);
			}
	}
}

module lug(){
	rotate([90,0,0]) difference(){
		hull(){ 
			//cube([10,0,3]);	
			cylinder(5,r=5);
			translate([10,-3,0])cylinder(5,r=2);
		}
		translate([0,0,-3])cylinder(10,r=2.6);
	}
	

}

difference (){
	plate();
	holes();
}

translate ([-7,15,5]) lug();
translate ([-7,50,5]) lug();
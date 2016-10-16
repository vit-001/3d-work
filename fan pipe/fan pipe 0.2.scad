module nose(){
	scale([1,0.8,1])  cylinder(16 ,r=3);
}


module noses(){
	difference(){
		rotate([0,11.1,0]){
			rotate([90,0,-45]) translate([0,0,24]) nose();
			rotate([90,0,-45-90]) translate([0,0,24]) nose();
		}
		translate([-47,-50,0]) cube([20,100,50]);
	}
}

module channel_out(){
	translate([-31.5,15,6])rotate([90,0,0]) scale([1,0.5,1]) 
		cylinder(46,r=8);
	intersection(){
		union(){
			translate([-34.7,45,6])rotate([90,0,0]) scale([0.64,0.5,1]) 
				cylinder(31,r=8.3);	
			translate([-26,31,6])rotate([90,0,0]) //scale([1,0.5,1]) 
				cylinder(20,r=3);
		}
		translate([-31.5,46,6])rotate([90,0,0]) scale([1,0.5,1]) 
			cylinder(76,r=8);
	}
}

module channel_in(){

	difference(){
		translate([0,63,36.2]) rotate([118,0,0])
			cylinder(70,r=15.5,center=true);
		cube([100,77,100],center=true);
	}
}


module inner(){
	noses();
	channel_out();
	channel_in();
}

module nose_body(){
	scale([1,0.8,1]) cylinder(15 ,r=5);
}

module noses_body(){
	rotate([0,11.1,0]){
		rotate([90,0,-45]) translate([0,0,25]) nose_body();
		rotate([90,0,-45-90]) translate([0,0,25]) nose_body();
	}
}

module channel_body(){
	translate([-31.5,33,6])rotate([90,0,0]) scale([1,0.5,1]) 
		cylinder(66,r=10);
	translate([-41.5,33,1])rotate([90,0,0]) 
		cube([3,10,66]);
}

module outer(){
	
	noses_body();
	channel_body();

	//cube([100,100,20])
}

module base(){

	#translate([-50,27.5,30.5])rotate([90,0,90]) cylinder(100,r=2.5);
	#translate([-8,-8,3])cube([20,16,10]);

	#translate([0,48,46]){
		translate([15.7,0,0])rotate([28,0,0])difference(){
			cube([8,2,8],center=true);
			rotate([90,0,0])cylinder(10,r=2,center=true);
		}
		translate([-15.7,0,0])rotate([28,0,0])difference(){
			cube([8,2,8],center=true);
			rotate([90,0,0])cylinder(10,r=2,center=true);
		}	
	}

}

module fan(){
	#translate([0,63,36.2]) rotate([28,0,0])
	difference(){
		cube([41.5,10,41.5],center=true);
		rotate([90,0,0])cylinder(20,r=15.5,center=true);
		translate([15.7,0,15.7])rotate([90,0,0])cylinder(20,r=2,center=true);
		translate([-15.7,0,15.7])rotate([90,0,0])cylinder(20,r=2,center=true);
		translate([15.7,0,-15.7])rotate([90,0,0])cylinder(20,r=2,center=true);
		translate([-15.7,0,-15.7])rotate([90,0,0])cylinder(20,r=2,center=true);
	}
}

base();
//fan();

//rotate([0,-90,0])
//difference(){
//	outer();
	inner();
//}
module nose(){
	scale([1,0.8,1])  cylinder(16.5 ,r=3);
}


module noses(){
	rotate([0,11.1,0]){
		rotate([90,0,-45]) translate([0,0,24]) nose();
		rotate([90,0,-45-90]) translate([0,0,24]) nose();
	}
}

module channel(){
	translate([-31.5,35,6])rotate([90,0,0]) scale([1,0.5,1]) 
		cylinder(66,r=8);
}

module inner(){
	noses();
	channel();
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
}

rotate([0,-90,0])
difference(){
	outer();
	inner();
}
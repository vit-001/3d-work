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
			cylinder(90,r=15.5,center=true);
		cube([100,69.5,100],center=true);
		cube([100,100,17],center=true);

		#translate([0,63,36.2]) rotate([118,0,0])
			translate([-50,8.5,-50])cube([100,40,100]);

	}

	difference(){
		intersection(){
			translate([0,40,0]) cube([100,10,100],center=true);
		
			translate([-36,40,5]) rotate([0,65,0]) cylinder(40,r1=3,r2=15);
		}
		translate([0,63,36.2]) rotate([118,0,0])
			translate([-50,8.5,-50])cube([100,40,100]);

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
	translate([-31.5,47,6])rotate([90,0,0]) scale([1,0.5,1]) 
		cylinder(80,r=10);
	//translate([-41.5,47,1])rotate([90,0,0]) 
		//cube([3,10,80]);
}

module fan_frame(){
	translate([0,63,36.2]) rotate([28,0,0])
	difference(){
		translate([0,-6.5,0])cube([41.5,3,41.5],center=true);
//		rotate([90,0,0])cylinder(20,r=15.5,center=true);
		translate([15.7,0,15.7])rotate([90,0,0])cylinder(20,r=2,center=true);
		translate([-15.7,0,15.7])rotate([90,0,0])cylinder(20,r=2,center=true);
		translate([15.7,0,-15.7])rotate([90,0,0])cylinder(20,r=2,center=true);
		translate([-15.7,0,-15.7])rotate([90,0,0])cylinder(20,r=2,center=true);
	}
}

module tube(){
	difference(){
		translate([0,63,36.2]) rotate([118,0,0])
			cylinder(90,r=17,center=true);
		cube([100,67.5,100],center=true);
		cube([100,100,15],center=true);
	

		translate([0,63,36.2]) rotate([28,0,0])
			translate([0,42.5,0])cube([41.5,100,41.5],center=true);	
	

		#translate([0,63,36.2]) rotate([118,0,0])
			translate([-50,10,-50])cube([100,40,100]);
	}
}

module cone(){
	difference(){
		//translate([0,41,0]) cube([100,14,100],center=true);
	
		translate([-36,40,5]) rotate([0,65,0]) cylinder(40,r1=4.5,r2=16.5);

		cube([100,67.5,100],center=true);
		translate([0,67,0]) cube([100,40,100],center=true);

		translate([0,63,36.2]) rotate([118,0,0])
			translate([-50,9,-50])cube([100,40,100]);

	}
}

module support(){
	translate([-41.5,47,3])rotate([90,0,0]) 
		cube([2,5,80]);

	hull(){
		translate([0,63,36.2]) rotate([28,0,0])
			translate([-20.7,-6.5,0]) cube([1,3,41.5],center=true);
	
		intersection(){
			translate([0,63,36.2]) rotate([28,0,0])
				translate([-40,-6.5,0]) cube([10,3,10],center=true);
			translate([-41.5,147,3])rotate([90,0,0]) 
				cube([2,200,200]);
		}
	}

	hull(){

		translate([0,63,36.2]) rotate([118,0,0])
			translate([-17,0,17])cube([3,8,20],center=true);
//			cylinder(90,r=17,center=true);

	
		intersection(){
			translate([0,63,36.2]) rotate([118,0,0])
				translate([-37,0,10])cube([20,3,8],center=true);
			translate([-41.5,147,3])rotate([90,0,0]) 
				cube([2,200,200]);
		}
	}


}

module outer(){
	
	noses_body();
	channel_body();

	fan_frame();
	tube();
	cone();
	
	support();


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

//base();
//fan();

//fan_frame();

rotate([0,-90,0])
difference(){
	outer();
	inner();

	cube([1000,1000,1],center=true);
}
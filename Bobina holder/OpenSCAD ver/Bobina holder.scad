module support(){
	translate ([-100,0,0]){
		rotate ([0,90,0]) cylinder (h=200, r=4);
		translate ([0,59,0]) rotate ([0,90,0]) cylinder (h=200, r=5);
	}
}

module bar (){
	$fs=0.5;
	cylinder(h=60,d=8);
	translate ([0,0,10])cylinder(h=60,d=6);
}

module mount(){
	rotate ([0,90,0]) cylinder (h=16, r=8);
	translate ([15,0,0])rotate ([0,90,0]) cylinder (h=3, r=9);
}

//support();

module stand(){
	difference(){
		union(){
			rotate ([0,90,0]) cylinder (h=12, r=10);
			translate ([0,59,0]) rotate ([0,90,0]) cylinder (h=12, r=10);
			translate([1,0,-4]) cube([10,59,10]);
			mount();
			translate ([0,59,0]) mount();
	   	}
	
		translate ([-50,-20,-100]) cube (100);
		support();
	}
	
	translate ([6,15,5]) bar();
	translate ([6,44,5]) bar();
}

module base(){
	stand();
	translate ([110,0,0]) mirror ([1,0,0]) stand();
	difference(){
		translate ([5,17,0]) rotate ([0,90,0]) cylinder (h=100, r=6);
		translate ([-150,-20,-300]) cube (300);
	}
}

module top(){
	$fs=0.5;
	difference(){
		union(){ 
			cylinder(h=13,d=10);
			translate ([0,29,0]) cylinder(h=13,d=10);
			translate ([-4,0,0])cube([8,29,9]);
		}
		cylinder(h=10.2,d=6.2);
		translate ([0,29,0])cylinder(h=10.2,d=6.2);
	}
	difference(){
		hull(){
			translate ([0,11,5]) cylinder(h=60,d=8);
			translate ([0,18,5]) cylinder(h=60,d=8);
		}
		translate ([-2,10.5,60])union(){
			cube([8,8,12]);	
			translate([0,4,0])rotate([0,90,0])cylinder(h=8,d=8);
			translate([3,4,-12]) cylinder(h=10,d=4.3);
			
		}
	}
}

module bobina(){
		difference(){ 
			cylinder(h=80,d=200);
			cylinder(h=80,d=40);
		}
	}

// main design

base();
translate([70,40,0])rotate([0,0,90])top();
translate([70,60,0])rotate([0,0,90])mirror([1,0,0])top();


//translate([6,15,65])top();
//translate ([15,30,110]) rotate([0,90,0]) bobina();
		
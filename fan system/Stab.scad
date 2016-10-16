dH=12;
r0=2;
offX=100;
offZ=100;

module base(){
	color("WhiteSmoke")rotate([0,90,0]) cylinder(300,r=4);
	color("WhiteSmoke") translate([0,dH,0]) rotate([0,180,0]) cylinder(300,r=4);
}

module clip(){
	difference(){
		minkowski(){
			translate([0,r0,-(18-2*r0)/2]) cube([39,9-2*r0,18-2*r0]);
			rotate([0,90,0]) cylinder(1,r=r0);
		}
		translate([-10,0,0]) rotate([0,90,0]) cylinder(60,r=4.3);
	}
}

module body(){
	rotate([90,0,0])translate ([-53,-258,-10]) difference(){
		linear_extrude(height = 10) import("Stab.dxf",layer="A");
		linear_extrude(height = 8) import("Stab.dxf",layer="B");
	}
}

module lug(){
	difference(){
		cube([10,10,40]);
		translate([-5,5,20]) rotate([0,90,0]) cylinder (20,r=2.5);
		translate([3,-5,15])cube([4,20,10]);
	}
}

module stab(){

	translate([offX,0,0]) clip();
	translate([0,dH,-offZ]) rotate([0,90,180]) clip();
	translate ([9,0,-9]) body();
	translate ([50,-8,-95])lug();
	
}



base();
stab();

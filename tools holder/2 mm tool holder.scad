$fs=1;


difference(){

//база
	translate([10,0,0]) minkowski(){
		cube([160,45,38]);
		cylinder(r=10,h=1);
	}	

	translate([-10,-50,-5]) cube([200,50,60]);
	translate([-10,4,18]) cube([200,55,40]);

// вырез сзади для приклеивания двухстороннего скотча
	translate([30,-10,8]) minkowski(){
		cube([120,10,22]);
		rotate([-90,0,0])cylinder(r1=1.5,r2=0,h=1);
	}


//// отверстия для укладывания инструмента
	for(i=[10:10:150]){
		translate([i,15,3]) cylinder(r=1.6,h=30);
//		translate([i,15,16]) cylinder(r1=1,r2=10,h=10);				

		translate([i,25,3]) cylinder(r=1.6,h=30);
//		translate([i,25,16]) cylinder(r1=1,r2=10,h=10);

		translate([i,35,3]) cylinder(r=1.6,h=30);
//		translate([i,35,16]) cylinder(r1=1,r2=10,h=10);

		translate([i,45,3]) cylinder(r=1.6,h=30);
//		translate([i,45,16]) cylinder(r1=1,r2=10,h=10);
	}

	translate([165,15,3]) cylinder(r=3.2,h=30);
//	translate([165,19,10]) cylinder(r1=1,r2=10,h=10);				

	translate([165,25,3]) cylinder(r=3.2,h=30);
//	translate([165,39,10]) cylinder(r1=1,r2=10,h=10);				

	translate([165,35,3]) cylinder(r=3.2,h=30);
//	translate([145,19,10]) cylinder(r1=1,r2=10,h=10);				

	translate([165,45,3]) cylinder(r=3.2,h=30);
//	translate([145,39,10]) cylinder(r1=1,r2=10,h=10);				


}

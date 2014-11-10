height = 3; //mm
squoojefactor = 1; //mm
screw = 3.5 + squoojefactor; //mm, ie a loose M3
wire = 1 + squoojefactor; //mm
thick = 3;//

length = 60;


difference(){
union(){
joint();
translate([length,0,0]) joint();
translate([thick,-(thick/2),0]) cube([length-(2*thick), thick, height]);
translate([screw+wire,0,0]) cylinder(h=height, d=thick+(2*wire));
translate([-(screw+wire),0,0]) cylinder(h=height, d=thick+(2*wire));
}

translate([screw+wire,0,0]) cylinder(h=height, d=wire);
translate([-(screw+wire),0,0]) cylinder(h=height, d=wire);
}



module joint(){
difference(){
	cylinder(h=height, d=thick + (2*screw));
	cylinder(h=height, d=screw);
	}
}

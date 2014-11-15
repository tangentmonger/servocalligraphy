height = 3; //mm
squoojefactor = 1; //mm
screw = 3.5 + squoojefactor; //mm, ie a loose M3
wire = 1.5 + squoojefactor; //mm
thick = 3;//
servoarmlength = 25; //mm

length = 60;
servoheight = 3 + height; //mm


difference(){
union(){
joint();
translate([length,0,0]) joint();
translate([thick,-(thick/2),0]) cube([length-(2*thick), thick, height]);

translate([servoarmlength/2,0,0]) cylinder(h=servoheight, d=thick+(2*wire));
translate([-(servoarmlength/2),0,0]) cylinder(h=servoheight, d=thick+(2*wire));

//extra bit of arm
translate([-(thick+(screw/2)+servoarmlength/2-(2*thick)),-(thick/2),0]) cube([servoarmlength/2-(2*thick), thick, height]);
}

translate([servoarmlength/2,0,0]) cylinder(h=servoheight, d=wire);
translate([-(servoarmlength/2),0,0]) cylinder(h=servoheight, d=wire);
}



module joint(){
difference(){
	cylinder(h=height, d=thick + (2*screw));
	cylinder(h=height, d=screw);
	}
}

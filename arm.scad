height = 3; //mm
screw = 4.5; //mm, actually M3 but allow for squoojing
thick = 3;//

length = 60;


joint();
translate([length,0,0]) joint();
translate([thick,-(thick/2),0]) cube([length-(2*thick), thick, height]);

module joint(){
difference(){
	cylinder(h=height, d=thick + (2*screw));
	cylinder(h=height, d=screw);
	}
}
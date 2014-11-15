height = 3; //mm
squoojefactor = 1; //mm
screw = 3.5 + squoojefactor; //mm, ie a loose M3
wire = 1 + squoojefactor; //mm
thick = 3; //mm

length = 60; //mm

pairDistance = 20; //mm, distance between hole centres
armDistance = 30; //mm, distance between inner hole centres
width = 15;




//arm holes
translate([thick + (screw/2),                thick + (screw/2) + width, 0]) joint();
translate([thick + (screw/2) + pairDistance, thick + (screw/2) + width, 0]) joint();
translate([pairDistance + armDistance + thick + (screw/2), thick + (screw/2) + width, 0]) joint();
translate([pairDistance + armDistance + thick + (screw/2) + pairDistance, thick + (screw/2) + width , 0]) joint();

//mounting holes
translate([thick + (screw/2) + pairDistance, thick + (screw/2), 0]) joint();
translate([pairDistance + armDistance + thick + (screw/2), thick + (screw/2), 0]) joint();
translate([(pairDistance + armDistance + pairDistance) / 2 + thick + (screw/2), thick + (screw/2) + width, 0]) joint();

//end bars
translate([2*thick + screw, (width) + (screw/2) + (thick/2), 0]) cube([pairDistance - screw - (2*thick), thick, height]);
translate([2*thick + screw + pairDistance + armDistance, (width) + (screw/2) + (thick/2), 0]) cube([pairDistance - screw - (2*thick), thick, height]);

//mid bars
translate([(2*thick) + screw  + pairDistance, (width) + (screw/2) + (thick/2), 0]) cube([armDistance/2 - screw - (2*thick), thick, height]);
translate([(2*thick) + screw  + pairDistance + (armDistance / 2), (width) + (screw/2) + (thick/2), 0]) cube([armDistance/2 - screw - (2*thick), thick, height]);


//base bar
translate([(2*thick) + screw  + pairDistance, (screw/2) + (thick/2), 0]) cube([armDistance - screw - (2*thick), thick, height]);

//up bars
translate([thick/2 + pairDistance + thick + screw/2, screw + thick, 0]) rotate([0,0,90]) cube([width - screw, thick, height]);
translate([thick/2 + pairDistance + thick + screw/2 + armDistance, screw + thick, 0]) rotate([0,0,90]) cube([width - screw, thick, height]);



module joint(){
difference(){
	cylinder(h=height, d=thick + (2*screw));
	cylinder(h=height, d=screw);
	}
}

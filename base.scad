height = 3; //mm
squoojefactor = 1; //mm
screw = 3.5 + squoojefactor; //mm, ie a loose M3
wire = 1 + squoojefactor; //mm
thick = 3; //mm

length = 60; //mm

pairDistance = 20; //mm, distance between hole centres
armDistance = 30; //mm, distance between inner hole centres
width = 25;


difference(){
cube([pairDistance + armDistance + pairDistance + screw + (2*thick), width + screw + (2*thick), height]);

//arm holes
translate([thick + (screw/2), thick + (screw/2) + width/2, 0]) cylinder(h=height, d=screw);
translate([thick + (screw/2) + pairDistance, thick + (screw/2) + width / 2, 0]) cylinder(h=height, d=screw);
translate([pairDistance + armDistance + thick + (screw/2), thick + (screw/2) + width/2, 0]) cylinder(h=height, d=screw);
translate([pairDistance + armDistance + thick + (screw/2) + pairDistance, thick + (screw/2) + width / 2, 0]) cylinder(h=height, d=screw);

//mounting holes
translate([thick + (screw/2), thick + (screw/2), 0]) cylinder(h=height, d=screw);
translate([pairDistance + armDistance + pairDistance + thick + (screw/2), thick + (screw/2), 0]) cylinder(h=height, d=screw);
translate([(pairDistance + armDistance + pairDistance) / 2 + thick + (screw/2), thick + (screw/2) + width, 0]) cylinder(h=height, d=screw);

}


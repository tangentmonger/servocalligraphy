height = 3; //mm
squoojefactor = 1; //mm
screw = 3.5 + squoojefactor; //mm, ie a loose M3
wire = 1 + squoojefactor; //mm
thick = 3; //mm

length = 60; //mm

pairDistance = 20; //mm, distance between hole centres
elbowLength = 15; //mm, distance between hole centres


difference(){
cube([pairDistance + screw + (2*thick), elbowLength + screw + (2*thick), height]);

translate([thick + (screw/2), thick + (screw/2), 0]) cylinder(h=height, d=screw);
translate([thick + (screw/2) + pairDistance, thick + (screw/2), 0]) cylinder(h=height, d=screw);
translate([thick + (screw/2), thick + (screw/2) + elbowLength, 0]) cylinder(h=height, d=screw);
translate([thick + (screw/2) + pairDistance, thick + (screw/2) + elbowLength, 0]) cylinder(h=height, d=screw);
}


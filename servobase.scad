height = 3; //mm
squoojefactor = 1; //mm
bolt = 3.5 + squoojefactor; //mm, ie a loose M3
wire = 1 + squoojefactor; //mm
thick = 3; //mm

screw = 1.5 + squoojefactor; //diameter

length = 60; //mm

servoheight = 25 - thick;



pairDistance = 20; //mm, distance between hole centres
armDistance = 30; //mm, distance between inner hole centres
width = 15;

basewidth = 80;
barwidth = 5;

servoScrewDistance = 28;

frontYaxis = thick + (bolt/2) + width;
frontBarExtra = 6;
backBarExtra = -23;

difference(){
union(){

//square (yuk)
translate([pairDistance-1,barwidth-5,servoheight]) cube([armDistance+(thick*4),28,thick]);


//servo bars
translate([0,frontYaxis + frontBarExtra,servoheight]) cube([basewidth, barwidth, height]);
translate([0,frontYaxis + backBarExtra , servoheight]) cube([basewidth, barwidth, height]);

//arm holes
//translate([thick + (bolt/2),                thick + (bolt/2) + width, 0]) joint(height);
//translate([thick + (bolt/2),                thick + (bolt/2) + width, 0]) joint(height);
//translate([thick + (bolt/2) + pairDistance, thick + (bolt/2) + width, 0]) joint(height);
//translate([pairDistance + armDistance + thick + (bolt/2), thick + (bolt/2) + width, 0]) joint(height);
//translate([pairDistance + armDistance + thick + (bolt/2) + pairDistance, thick + (bolt/2) + width , 0]) joint(height);



//mounting holes
translate([thick + (bolt/2) + pairDistance, thick + (bolt/2), 0]) joint(servoheight+thick);
translate([pairDistance + armDistance + thick + (bolt/2), thick + (bolt/2), 0]) joint(servoheight+thick);
translate([(pairDistance + armDistance + pairDistance) / 2 + thick + (bolt/2), thick + (bolt/2) + width, 0]) joint(servoheight+thick);

/*
//end bars
translate([2*thick + bolt, (width) + (bolt/2) + (thick/2), 0]) cube([pairDistance - bolt - (2*thick), thick, height]);
translate([2*thick + bolt + pairDistance + armDistance, (width) + (bolt/2) + (thick/2), 0]) cube([pairDistance - bolt - (2*thick), thick, height]);

//mid bars
translate([(2*thick) + bolt  + pairDistance, (width) + (bolt/2) + (thick/2), 0]) cube([armDistance/2 - bolt - (2*thick), thick, height]);
translate([(2*thick) + bolt  + pairDistance + (armDistance / 2), (width) + (bolt/2) + (thick/2), 0]) cube([armDistance/2 - bolt - (2*thick), thick, height]);


//base bar
translate([(2*thick) + bolt  + pairDistance, (bolt/2) + (thick/2), 0]) cube([armDistance - bolt - (2*thick), thick, height]);

//up bars
translate([thick/2 + pairDistance + thick + bolt/2, bolt + thick, 0]) rotate([0,0,90]) cube([width - bolt, thick, height]);
translate([thick/2 + pairDistance + thick + bolt/2 + armDistance, bolt + thick, 0]) rotate([0,0,90]) cube([width - bolt, thick, height]);
*/

}

//servo screw holes




translate([thick + (bolt/2),frontYaxis+frontBarExtra+(barwidth/2),servoheight]) cylinder(h=thick, d=servoScrew);
translate([thick + (bolt/2),frontYaxis+backBarExtra+(barwidth/2),servoheight]) cylinder(h=thick, d=servoScrew);

translate([pairDistance + armDistance + thick + (bolt/2) + pairDistance,frontYaxis+frontBarExtra+(barwidth/2),servoheight]) cylinder(h=thick, d=servoScrew);
translate([pairDistance + armDistance + thick + (bolt/2) + pairDistance,frontYaxis+backBarExtra+(barwidth/2),servoheight]) cylinder(h=thick, d=servoScrew);

}



module joint(jointHeight){
difference(){
	cylinder(h=jointHeight, d=thick + (2*bolt));
	cylinder(h=jointHeight, d=screw);
	}
}

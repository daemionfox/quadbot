use <./commonparts.scad>
use <../MCAD/servos.scad>

servoBracket(44,76,2);


//color([.3,.3,.3]){ 
//    futabas3003([-14.25,-30,21.25],[0,90,0],0); 
//}


module servoBracket(length, width, height)
{
        difference() {
            union() {
                basePlate(length=length,width=width, height=height, radius=10);
                color([1,0,1]){
                    translate([17.5,-width/2+4,11]){ cube([4,8,20], center=true); }
                    translate([10.75,-width/2+4,11]){ cube([3,8,20], center=true); }
                    translate([17.5,-width/2+52,11]){ cube([4,8,20], center=true); }
                    translate([10.75,-width/2+52,11]){ cube([3,8,20], center=true); }
                }
            }
            translate([0,-width/2+4,16.25]){ rotate([0,90,0]){ cylinder(d=3.5, h=100, center=true); } }
            translate([0,-width/2+4,6.25]){ rotate([0,90,0]){ cylinder(d=3.5, h=100, center=true); } }
            translate([0,-width/2+52,6.25]){ rotate([0,90,0]){ cylinder(d=3.5, h=100, center=true); } }
            translate([0,-width/2+52,16.25]){ rotate([0,90,0]){ cylinder(d=3.5, h=100, center=true); } }
            translate([0,0,0]){ cylinder(d=24, h=12, center=true); }
            translate([15.5,0,11]){
                cube([2,100,2.5], center = true);
            }
    }
}
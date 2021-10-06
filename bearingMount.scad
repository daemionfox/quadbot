use <./commonparts.scad>
use <../MCAD/bearing.scad>

bearingMount(44,76,2,10,45);

module bearingMount(length, width, height, radius = 10, distance=18) {
    plates(length, width, height, radius,distance);
    difference(){
        hull(){
            translate([0,-width/2+4,20]){
                rotate([90,0,0]){
                    cylinder(d=30, h=6.75, center=true);
                }
            }
            translate([distance/2+5,-width/2+4,0]){
                    cube([16,8,2], center=true);
            }
            mirror([1,0,0]){
                translate([distance/2+5,-width/2+4,0]){
                    cube([16,8,2], center=true);
                }
            }
        }
        
            translate([0,-width/2+4,20]){
                rotate([90,0,0]){
                    cylinder(d=22.25, h=10, center=true);
                }
            }

            translate([0,-width/2+4,-20]){
                rotate([90,0,0]){
                    cylinder(d=50, h=10, center=true);
                }
            }
        
        
    }
}
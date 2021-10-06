use <../MCAD/servos.scad>

use <./commonparts.scad>
use <./servoBracket.scad>


servoClamp(44, 76, 2);

//translate([0,0,-2]){
//    color([0,.9,.5]){
//        servoBracket(44,76,2);
//    }
//    color([.3,.3,.3]){ 
//        futabas3003([-14.25,-30,21.25],[0,90,0],0); 
//    }
//
//}

module servoClamp(length, width, height)
{
    union(){
        difference(){
            basePlate(length=length,width=width, height=height, radius=10);
            translate([7,-10,0]){
                cube([length, 42, height+2], center =true);
            }
            translate([length-14,0,0]){
                cube([length, width+50, height+2], center =true);
            }
        }

        translate([-18,-5,10]){
            cube([2,16,22], center=true);
        }

        translate([-4,-32,10]){
            cube([10,2,22], center=true);
        }
        translate([-4,12,10]){
            cube([10,2,22], center=true);
        }

        
        translate([-5,-10,20.5]){
            basePlate(20,46,2, radius=8, holes=false);
        }
    }
}

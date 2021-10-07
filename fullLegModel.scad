use <../MCAD/servos.scad>
use <../MCAD/bearing.scad>

use <./commonparts.scad>
use <./bearingMount.scad>
use <./servoBracket.scad>
use <./servoClamp.scad>
use <./hipConnector.scad>
use <./legThigh.scad>
use <./legCalf.scad>
use <./legConnector.scad>

explode = .25;
primary = [1,1,1]; // [.1,.1,.1];
secondary = [1,.4,0];

length = 44;
width = 90;
thick = 2;
legRotate = -45;
hip();

module hip(){

    rotate([180,0,0]){
        halfHip(explode);
        translate([width,0,0]){
            rotate([0,0,180]){
                halfHip(explode);
            }
        }
        translate([0,0,-5+explode]){
            color(primary){
                rotate([180,0,0]){
                    hipConnector(length,width,thick);
                }
            }
        }
        
        color(primary){

        translate([31,0,11]){
            rotate([270,legRotate,90]){
                partLeg(80);

                translate([52,0,-12]){
                    rotate([0,0,-90]){
                        legConnector(200, 8, true);
                    }
                }

            }
        }
    }
    
        color(primary){
            translate([59,0,11]){
                rotate([90,180-legRotate,90]){
                    partLeg(200,8);
                }
            }
        }
        
        color(secondary){
            translate([51.75,-82,166.5]){
                rotate([270,legRotate-176,90]){
                    legCalf(120,240,8,true);
                }
            }
        }
        
    }
}

module partLeg(length, thick=5) 
{
    color([.1,.1,.1]){
        servoArm();
    }
    color(primary){
        translate([0,0,-thick+1.5]){
            legThigh(length, 28, thick);
        }
    }    
}

module halfHip(explode = .25){
    color(primary){
        servoBracket(length,width,thick);
    }
    translate([0,0,2+explode]){
        color(secondary){
            servoClamp(length,width,thick);
        }
    }

    
    
        bearing([width/2,width/2-.5,-22-explode],[90,0,0], 608);
    
    color([.3,.3,.3]){ 
        futabas3003([-14.25,-30,21.25],[0,90,0],0); 
    }

    rotate([0,180,0]){
        translate([-width/2,0,2+explode]){
            color(secondary){
                bearingMount(length,width,thick,10,45);
            }
        }
    }
}
use <./commonparts.scad>
use <../MCAD/bearing.scad>


legThigh(80, 28, 5);

module legThigh(length, width, thick)
{
    difference(){
        legBase(length, width, thick);
        translate([0,0,thick-2.2]){
            servoArm(true);
        }
        translate([length-width, 0, 0]){
            cylinder(d=8, h=thick+20, center=true);
        }
        translate([length-width, 0, thick+1]){
            cylinder(d=12, h=thick, center=true);
        }
    }
}

use <./commonparts.scad>
use <../MCAD/bearing.scad>

legCalf(120,240,8,true);

module legCalf(calfLength, footLength, thick, showBearing=false)
{
    difference(){
        hookedLeg(calfLength,footLength,32,thick);
        cylinder(d=22.25,h=thick+12, center=true);
        translate([50, 0,0]) {
            cylinder(d=22.25,h=thick+12, center=true);
        }
    }
    if (showBearing){
        bearing([0,0,0],[0,0,0],608);
        bearing([50,0,0],[0,0,0],608);
    }
}

module hookedLeg(calfLength, footLength, width, thick)
{
    legBase(calfLength,width,thick);
    translate([calfLength-32,0,0]){
        rotate([0,0,150]){
            difference(){
                legBase(footLength,width,thick);
                for(i = [0:10:30]){
                    translate([footLength-32-i,0,0]){
                        cylinder(d=3.5, h=thick+15, center=true);
                    }
                }
            }
        }
    }
}
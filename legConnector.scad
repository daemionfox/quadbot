use <./commonparts.scad>
use <../MCAD/bearing.scad>

legConnector(160, 8, true);

module legConnector(length, thick, showBearing = 0)
{
    difference(){
        legBase(length, 32, 8);
        cylinder(d=22.25, h=20, center=true);
        translate([length - 32,0,0]){
            cylinder(d=8, h=20, center=true);
            translate([0,0,thick+2]){
                cylinder(d=12, h=thick, center=true);
            }
        }

    }
    
    if(showBearing) {
        
        bearing([0,0,0],[0,0,0], 608);
    
    }
    
}
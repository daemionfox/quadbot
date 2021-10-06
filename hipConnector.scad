use <./commonparts.scad>

hipConnector(44,76,2);

module hipConnector(length, width, height)
{
    difference(){
        basePlate(length, width, height, 10);
        translate([10,0,0]){
            cube([length, width+2, height+2], center=true);
        }
    }
        
    translate([-17,0,8]){
        difference(){
            cube([8,24,16], center=true);
            translate([0,0,4]){
                cube([10,14,15], center=true);
            }
            translate([0,0,3]){
                rotate([90,0,0]){
                    cylinder(d=3.5, h=30, center=true);
                }
            }
            
        }
    }
}
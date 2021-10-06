//servoArm(false);
//    basePlate(length=44,width=76, height=2, radius=10);
    
//    translate([0,0,2]){
//        mirror([0,1,0]){
//            basePlate(length=44,width=76, height=2, radius=10);
//        }
//    }

plates(44,76, 2, 10);

    
    module servoArm(dif = false)
    {
            holeStart = 33;
            translate([0,0,4]){
                difference(){
                    union(){
                        cylinder(d=10, h=8, center=true);
                        difference(){
                            translate([0,0,-2.85]){
                                hull(){
                                    cylinder(d=14, h=2.3, center=true);
                                    translate([30,0,0]){
                                        cylinder(d=9, h=2.3, center=true);
                                    }
                                }
                            }
                            
                            for (i = [1:6]){
                                translate([holeStart  - 3*i,0,0]){ cylinder(d=1.5, h=10, center=true); }
                            }
                            
                        }

                    }
                    cylinder(d=5, h=10, center=true);
                    translate([0,0,4]){
                        cylinder(d=6, h=5, center=true);
                    }
                    translate([0,0,-2]){
                        cylinder(d=6, h=5, center=true);
                    }
                }
            }
            
            if (dif) {
                for (i = [1:6]){
                    translate([holeStart  - 3*i,0,0]){ cylinder(d=1.6, h=16, center=true); }
                }
                    cylinder(d=4, h=20, center=true);
                    translate([0,0,5.5]){
                        cylinder(d=7, h=5, center=true);
                    }
                    translate([0,0,2.5]){
                        cylinder(d=7, h=5, center=true);
                    }
            }
            
    }
    
    module basePlate(length=10, width=10, height=10, radius=2, holes = true)
    {
        translate([length/4-1,0,0]){
            difference(){
                hull(){
            
                    cube([length - 2*radius, width, height], center=true);
                    translate([-length/2, width/2-radius, 0]){
                        cylinder(d=2*radius, h=height, center=true);
                    }
                    translate([-length/2, -(width/2-radius), 0]){
                        cylinder(d=2*radius, h=height, center=true);
                    }
                }
                if (holes){
                    translate([-length/8, (width/2-3)-.75, 0]){ cylinder(d=3.5, h=10, center=true); }
                    translate([-length/8, -(width/2-3 - .75), 0]){ cylinder(d=3.5, h=10, center=true); }

                    translate([-(length+radius)/2 + .75, width/2-(radius/2)-.75, 0]){ cylinder(d=3.5, h=10, center=true); }
                    translate([-(length+radius)/2 + .75, -(width/2-(radius/2)-.75), 0]){ cylinder(d=3.5, h=10, center=true); }

                    translate([-(length+radius)/2-.75, width/4+.75, 0]){ cylinder(d=3.5, h=10, center=true); }
                    translate([-(length+radius)/2-.75, -(width/4+.75), 0]){ cylinder(d=3.5, h=10, center=true); }


//                    translate([-(length+radius)/2-.75, width/4+.75, 0]){ cylinder(d=3.5, h=10, center=true); }
//                    translate([-length/2-6.5, -width/4-.75, 0]){ cylinder(d=3.5, h=10, center=true); }
                }
            }
        }
    }
    
    
module legBase(length, width, thick)
{
    translate([0,0,thick/2]){
            hull(){
                cylinder(d=width, h=thick, center=true);
                translate([length-width, 0,0]){
                    cylinder(d=width, h=thick, center=true);
                }
            }
        }
}
    
    module plates(l, w, h, r = 10, d=18){
        singlePlate(l, w, h, r, d);

        mirror([1,0,0]){
            singlePlate(l, w, h, r, d);
        }
    }
    
    module singlePlate(l, w, h, r = 10, d=18){
        translate([-d,0,0]){ 
            union(){
                difference(){
                    basePlate(l,w,h,r); 
                    translate([0,w/2,0]){
                        cube([l+2,w+2,h+2], center=true); 
                    }
                    color([0,0,1]){
                        translate([l/2,0,0]){
                            cube([l/2,w+2,h+2], center=true); 
                        }
                    }

                    color([0,0,1]){
                        translate([0,2,0]){
                            basePlate(l-16,w-12,h+2,r-4, false); 
                        }
                    }
                }
                
            }            
        }
        
    }
    
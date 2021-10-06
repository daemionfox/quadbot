    use <../MCAD/servos.scad>;
    use <../MCAD/bearing.scad>;


fulllayout();
//servobracket();
//servoclamp();
//bearingmount();


module fulllayout()
{        
        servobracket();
        color([1,0,0]){
            translate([0,0,-2.25]){
                servoclamp();
            }
        }
        color([1,0,1]){
            translate([0,0,2.25]){
                bearingmount();
            }
        }
        
    //    
    //    
        translate([76,20,0]){
            rotate([0,0,180]){
                servobracket();
                color([1,0,0]){
                    translate([0,0,-2.25]){
                        servoclamp();
                    }
                }
                color([.3,.3,.3]){ futabas3003([-14.25,-20,-1.25],[0,90,0],0); }
                
                    color([1,0,1]){
                        translate([0,0,2.25]){
                            bearingmount();
                        }
                    }
                color([0,1,0]){
                    bearing([30,-20.5,23],[90,0,0], outline=false);
                }

            }
            
            
        }
        color([.3,.3,.3]){ futabas3003([-14.25,-20,-1.25],[0,90,0],0); }
        color([0,1,0]){
            bearing([38,-20.5,23],[90,0,0], outline=false);
        }
    }    
        
    module bearingmount(){
        difference(){
            union(){
                    difference(){
                            halfRoundedCube(length=44,width=76, height=2, radius=10);
                            translate([44,0,0]){ cube([20,80,4], center=true); }
                            translate([6,16,0]){ cube([40,72,20], center=true); }
                            translate([-10,31,0]){ cube([36,62,20], center=true); }
                    }
            
                    translate([76,0,0]){
                        mirror([1,0,0]){
                                difference(){
                                    halfRoundedCube(length=44,width=76, height=2, radius=10);
                                    translate([44,20,0]){ cube([20,80,4], center=true); }
                                    translate([6,16,0]){ cube([40,72,20], center=true); }
                                    translate([-10,31,0]){ cube([36,62,20], center=true); }
                            }
            
                        }
                    }
                    translate([38,-24,20.75]){
                        difference(){
                            hull(){
                                rotate([90,0,0]){
                                    cylinder(d=30, h=6.75, center=true);
                                }
                                translate([0,0,-20.75]){
                                    cube([36,8,2], center=true);
                                }
                            }
                            rotate([90,0,0]){
                                cylinder(d=22.25,h=10, center=true);
                            }
                    }
                }   
            }
            translate([38,-25,-7]){
                rotate([90,0,0]){
                    cylinder(d=21.9 ,h=16, center=true);
                }
            }
            
        }
    }
    
    
    module servoclamp(){
        union(){
            difference(){
                    halfRoundedCube(length=44,width=76, height=2, radius=10);
                    translate([16,0,0]){
                        cube([20,80,4], center=true);
                    }
                    translate([0,0,0]){
                        cube([30,42,20], center=true);
                    }
            }
            translate([-1,24.5,-10]){ cube([2,7,21], center=true); }
            translate([-1,-24.5,-10]){ cube([2,7,21], center=true); }
            translate([-1,0,-20.5]){ cube([2,56,2], center=true); }

            translate([-11,10,-20.5]){ cube([22,12,2], center=true); }
            difference(){
                union(){
                    color([1,0,0]){
                        translate([-18.5,10,-10]){ cube([7,12,21], center=true); }
                    }
                    translate([-23,10, -5]){
                        rotate([90,0,0]){
                                cylinder(d=8, h=3, center=true);
                        }
                    }
                }
                
                    translate([-23,10, -5]){
                        rotate([90,0,0]){
                                cylinder(d=4, h=22, center=true);
                        }
                    }
                
            }
        }
    }
    
    module halfRoundedCube(length=10, width=10, height=10, radius=2)
    {
        translate([length/4-1,10,0]){
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
                translate([-6.5, (width/2-3)-.75, 0]){ cylinder(d=3.5, h=10, center=true); }
                translate([-6.5, -(width/2-3 - .75), 0]){ cylinder(d=3.5, h=10, center=true); }

                translate([-24, (width/2-3)-.75, 0]){ cylinder(d=3.5, h=10, center=true); }
                
                translate([-24, -(width/2-3)+.75, 0]){ cylinder(d=3.5, h=10, center=true); }

                translate([-length/2-6.5, width/4+.75, 0]){ cylinder(d=3.5, h=10, center=true); }
                translate([-length/2-6.5, -width/4, 0]){ cylinder(d=3.5, h=10, center=true); }
            }
        }
    }
    
    module servobracket(){
        difference(){
            union(){
                halfRoundedCube(length=44,width=76, height=2, radius=10);
                translate([17.5,-24,-11]){ cube([4,8,20], center=true); }
                translate([10.75,-24,-11]){ cube([3,8,20], center=true); }
                translate([17.5,24,-11]){ cube([4,8,20], center=true); }
                translate([10.75,24,-11]){ cube([3,8,20], center=true); }
            }
            translate([0,-24,-16.25]){ rotate([0,90,0]){ cylinder(d=3.5, h=100, center=true); } }
            translate([0,-24,-6.25]){ rotate([0,90,0]){ cylinder(d=3.5, h=100, center=true); } }
            translate([0,24.5,-6.25]){ rotate([0,90,0]){ cylinder(d=3.5, h=100, center=true); } }
            translate([0,24.5,-16.25]){ rotate([0,90,0]){ cylinder(d=3.5, h=100, center=true); } }
            translate([0,0,0]){ cylinder(d=24, h=12, center=true); }
            translate([15.5,0,-11]){
                cube([2,100,2.5], center = true);
            }
            
    }
}
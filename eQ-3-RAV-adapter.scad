/*
 * eQ-3-RAV-adapter.scad: eQ-3 Thermostat / DANFOSS RAV Adapter
 * Copyright 2019 Peter Senna Tschudin <peter.senna@gmail.com>
 * Licensed under the terms of GNU General Public License v2.0 only
 */

$fn = 256;

module adapter(gap) {
    
    difference() {
        cylinder(d=37.6, h=8, center=true);
        cylinder(d=28, h=9, center=true);
        translate([0,0,12.5]) sphere(d=36);
        translate([0,0,-2]) cylinder(d=31.5, h=4.05, center=true);
        translate([0,10,0]) cube([gap,20,20], center=true);
    }

    translate([0,0,-3.8]) difference() {
        cylinder(d=37.6, h=1, center=true);
        cylinder(d=22, h=2, center=true);
        translate([-7,-7,0]) cylinder(d=7, h=2, center=true);
        translate([7,7,0]) cylinder(d=7, h=2, center=true);
        translate([-7,7,0]) cylinder(d=7, h=2, center=true);
        translate([7,-7,0]) cylinder(d=7, h=2, center=true);
        translate([0,10,0]) cube([gap,20,20], center=true);
    }

    translate([0,0,-18]) {
        difference() {
            cylinder(d2=37.6, d1=38, h=0.5, center=true);
            cylinder(d=34, h=1, center=true);
            translate([0,0,-6]) cube([3.5,40,20],center=true);
            translate([0,0,-6]) cube([40,3.5,20],center=true);
        }
    }

    translate([0,0,-11.7]) {
        difference() {
            translate([0,0,0.7]) cylinder(d=37.6, h=13.5, center=true);
            cylinder(d=34, h=15, center=true);
            
            translate([0,0,4]) rotate([90,0,0]) cylinder(d=3.5, h=40, center=true);
            translate([0,0,4]) rotate([90,0,90]) cylinder(d=3.5, h=40, center=true);
            translate([0,0,-6]) cube([3.5,40,20],center=true);
            translate([0,0,-6]) cube([40,3.5,20],center=true);
            translate([0,10,10]) cube([gap,20,20], center=true);
        }
    }


    translate([12.25,-12.25,-6]) difference() {
        union() {
            cylinder(d=4, h=5,center=true);
            translate([0,0,-4]) cylinder(d2=4, d1=0.5, h=3,center=true);
        }
        translate([2,-2,0]) rotate(45) cube([6,6,10],center=true);
    }

    translate([-12.25,12.25,-6]) difference() {
        union() {
            cylinder(d=4, h=5,center=true);
            translate([0,0,-4]) cylinder(d2=4, d1=0.5, h=3,center=true);
        }
        translate([-2,2,0]) rotate(45) cube([6,6,10],center=true);
    }

    translate([0,0,-9]) difference() {
        rotate_extrude(convexity = 10)
            translate([19.2, 0, 0])
                circle(r = 3, $fn = 24);
        difference() {
            cylinder(d=60, h=7, center=true);
            cylinder(d=37.6, h=7.1, center=true);
        }
            translate([0,0,-6]) cube([3.5,40,20],center=true);
            translate([0,0,-6]) cube([40,3.5,20],center=true);
    }
}
adapter(gap=0.2);

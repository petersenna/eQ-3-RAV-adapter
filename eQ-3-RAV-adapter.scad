/*
 * eQ-3-RAV-adapter.scad: eQ-3 Thermostat / DANFOSS RAV Adapter
 * Copyright 2019 Peter Senna Tschudin <peter.senna@gmail.com>
 * Licensed under the terms of GNU General Public License v2.0 only
 */

$fn = 256;

eQ3_h = 7.15;

/*
 * interface_h is an important number. On my valves this was adjusted to
 * match the distance between the eQ-3 motor and the valve pin. A value
 * smaller than 1mm would mean that the eQ-3 would not be capable of
 * fully opening the valve.
 */
interface_h = 1;

RAV_h = 13.5;
//translate([0,0,7.15 + 1/2]) cylinder(d=25,h=1,center=true);
module eQ3 (side_cut=0.2) {
    translate([0,0,eQ3_h/2]) rotate([180,0,0]) difference() {
        cylinder(d=37.6, h=eQ3_h, center=true);
        cylinder(d=28, h=eQ3_h+1, center=true);
        translate([0,0,12]) sphere(d=36);
        translate([0,0,-2]) cylinder(d=32.5, h=4.05, center=true);
        translate([0,10,0]) cube([side_cut,20,20], center=true);
    }
}

module interface (side_cut=0.2) {
    translate([0,0,eQ3_h + interface_h/2]) rotate([180,0,0]) difference() {
        cylinder(d=37.6, h=interface_h, center=true);
        cylinder(d=22, h=interface_h+1, center=true);
        translate([-7,-7,0]) cylinder(d=7, h=2, center=true);
        translate([7,7,0]) cylinder(d=7, h=2, center=true);
        translate([-7,7,0]) cylinder(d=7, h=2, center=true);
        translate([7,-7,0]) cylinder(d=7, h=2, center=true);
        translate([0,10,0]) cube([side_cut,20,20], center=true);
    }
}

module RAV_vane() {
        difference() {
            union() {
                cylinder(d=4, h=4,center=true);
                translate([0,0,-3.5]) cylinder(d2=4, d1=0.5, h=3,center=true);
            }
            translate([2,-2,0]) rotate(45) cube([6,6,10],center=true);
        }
}

module RAV(side_cut=0.2) {
    translate([0,0,eQ3_h + interface_h + RAV_h/2]) rotate([180,0,0]) {
        
        difference() {
            cylinder(d=37.6, h=RAV_h, center=true);
            cylinder(d=34, h=15, center=true);
            
            for (i=[0:60:180]) {
                translate([0,0,4]) rotate([90,0,i]) cylinder(d=3.5, h=40, center=true);
                rotate(i) translate([0,0,-6]) cube([3.5,40,20],center=true);
            }
            
            translate([0,10,10]) cube([side_cut,20,20], center=true);
            translate([0,0,-1.25]) difference() {
                cylinder(d=38, h=11, center=true);
                cylinder(d=36.6, h=11, center=true);
            }
        }

        translate([12.25,-12.25,4.75]) RAV_vane();
        translate([-12.25,12.25,4.75]) rotate(180) RAV_vane();

        translate([0,0,1]) difference() {
            rotate_extrude(convexity = 10)
                translate([19.2, 0, 0])
                    circle(r = 3, $fn = 24);
            difference() {
                cylinder(d=60, h=7, center=true);
                cylinder(d=36.6, h=7.1, center=true);
            }
            for (i=[0:60:180])
                rotate(i) translate([0,0,-6]) cube([3.5,40,20],center=true);
        }
        dent_h = 0.5;
        translate([0,0,(RAV_h+dent_h)/-2]) difference() {
            cylinder(d2=36.6, d1=37.6, h=dent_h, center=true);
            cylinder(d=34, h=1, center=true);
            for (i=[0:60:180])
                rotate(i) translate([0,0,-6]) cube([3.5,40,20],center=true);
        }
    }
}

eQ3();
interface();
RAV();

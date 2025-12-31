//////////////////////////////
// GLOBAL SETTINGS
//////////////////////////////
$fn = 64;

// Adapter inner clearance
inner_x = 200;
inner_y = 80;
inner_z = 45;

// Box structure
wall = 2;
base_thickness = 2;

// Feet
foot_diameter = 10;
foot_height = 2;
foot_offset = 12;

// Cable exit (TOP EDGE — CORRECT)
slot_width = 12;
slot_height = 8;

// Bottom ventilation
vent_size = 6;
vent_spacing = 10;

// Lid
lid_plate = 3;
lid_lip = 4;
lid_wall = 2;
tolerance = 0.4;

//////////////////////////////
// DERIVED
//////////////////////////////
outer_x = inner_x + wall * 2;
outer_y = inner_y + wall * 2;
outer_z = inner_z + base_thickness;

//////////////////////////////
// MAIN
//////////////////////////////
box();
//translate([outer_x + 20, 0, 0]) lid();

//////////////////////////////
// BOX
//////////////////////////////
module box() {
    difference() {

        union() {
            // Outer shell
            cube([outer_x, outer_y, outer_z]);

            // Feet (RESTORED)
            for (x = [foot_offset, outer_x - foot_offset])
                for (y = [foot_offset, outer_y - foot_offset])
                    translate([x, y, -foot_height])
                        cylinder(d=foot_diameter, h=foot_height);
        }

        // Inner cavity
        translate([wall, wall, base_thickness])
            cube([inner_x, inner_y, inner_z + 0.1]);

        // Bottom ventilation
        for (x = [wall + 5 : vent_spacing : outer_x - wall - 5])
            for (y = [wall + 5 : vent_spacing : outer_y - wall - 5])
                translate([x, y, -0.1])
                    cube([vent_size, vent_size, base_thickness + 1]);

        // Cable exits (CUT INTO TOP EDGE)
        cable_slots();
    }
}

//////////////////////////////
// CABLE SLOTS — CORRECT EDGE CUT
//////////////////////////////
module cable_slots() {

    z_pos = outer_z - slot_height; // <-- THIS IS THE FIX

    // Front
    translate([outer_x/2 - slot_width/2, -0.1, z_pos])
        cube([slot_width, wall + 1, slot_height]);

    // Back
    translate([outer_x/2 - slot_width/2, outer_y - wall, z_pos])
        cube([slot_width, wall + 1, slot_height]);

    // Left
    translate([-0.1, outer_y/2 - slot_width/2, z_pos])
        cube([wall + 1, slot_width, slot_height]);

    // Right
    translate([outer_x - wall, outer_y/2 - slot_width/2, z_pos])
        cube([wall + 1, slot_width, slot_height]);
}

//////////////////////////////
// LID — SOLID + CORRECT EDGE
//////////////////////////////
module lid() {

    union() {

        // Lip (goes INTO box)
        difference() {
            cube([outer_x, outer_y, lid_lip]);

            translate([
                lid_wall + tolerance,
                lid_wall + tolerance,
                -0.1
            ])
            cube([
                outer_x - 2*(lid_wall + tolerance),
                outer_y - 2*(lid_wall + tolerance),
                lid_lip + 0.2
            ]);
        }

        // Solid top plate (sits ON rim)
        translate([0, 0, lid_lip])
            cube([outer_x, outer_y, lid_plate]);
    }
}

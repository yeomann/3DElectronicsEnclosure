⚠️ Non-Commercial Use Only  
This repository is licensed under CC BY-NC 4.0. You may use, modify, and print the models for personal, educational, or hobbyist projects. Commercial use is prohibited.


## Description

This is a fully parametric, 3D-printable electronics enclosure designed to house small projects, PCBs, or Arduino/Raspberry Pi setups. It features a robust box design with optional lid, ventilation, and cable exit slots for easy wiring. The design is fully customizable in OpenSCAD and can be scaled or modified to suit your project requirements.


### Features:

- Adjustable inner cavity dimensions (default: 200 × 80 × 45 mm)
- Solid outer walls and base for stability
- Removable lid with lip for secure fit
- Bottom ventilation slots to improve airflow
- Cable exit slots on all sides for neat wiring
- Optional feet for elevated mounting
- Parametric OpenSCAD design: easily customize wall thickness, lid, vents, and slot sizes
- Designed for 3D printing with minimal supports

### Use Cases:

- Electronics projects (Arduino, Raspberry Pi, ESP32, etc.)
- Small sensor modules or PCBs
- DIY enclosures for hobby projects
- Prototyping and testing setups

### Printing Recommendations:

- Layer height: 0.2 mm or lower for a clean finish
- Wall thickness: 2 mm (default)
- Supports: only needed for overhangs if you rotate the box
- Material: PLA, PETG, or ABS depending on your application

### Included Files:

- `enclosure.scad` – fully parametric OpenSCAD source
- STL exports ready for slicing

### Safety Note 

- This enclosure is intended for fully insulated power adapters only.
- Do not use with exposed mains wiring or damaged power supplies.
- Ensure adequate ventilation and periodically check operating temperature.

## OpenSCAD Parameters & Customization Guide

This model is fully parametric. All key dimensions and behaviors can be adjusted via variables at the top of the OpenSCAD file.
Structural integrity is achieved through wall thickness and geometry rather than high infill percentages.
Ventilation and cable accessibility are prioritized over aesthetic minimalism for safety and usability.

### Adapter Dimensions
```
adapter_length = 200;
adapter_width  = 80;
adapter_height = 45;
```

#### What they do:
 - Define the physical size of the power adapter.

#### When to change:

 - Using a different power brick
 - Want tighter or looser internal fit

_**📌 Tip:** Measure the adapter with a caliper and add 1–2 mm clearance._


### Wall & Structural Parameters

```
wall_thickness = 3;
bottom_thickness = 3;
lid_thickness = 3;
```

#### What they do:
- Control the strength and rigidity of the enclosure.

#### Effects:

- Thicker walls → stronger, heavier, better heat buffering
- Thinner walls → lighter, faster print, less impact resistant

#### Recommended range:

- PLA: 2.5–3.5 mm
- PETG: 2.0–3.0 mm

### Tolerance & Fit

```
tolerance = 0.4;
```

#### What it does:

- Defines clearance between lid and box.

#### Effects:

- Higher value → easier fit, less friction
- Lower value → tighter, cleaner fit

#### Recommended:

- PLA: 0.3–0.5
- PETG: 0.4–0.6

### Ventilation Slots

```
vent_width = 6;
vent_height = 2;
vent_spacing = 10;
```
#### What they do:

- Create airflow openings for heat dissipation.

#### Why it matters:
- Power adapters generate heat. Proper ventilation extends lifespan and reduces risk.

#### When to increase:

- Adapter >30 W
- Adapter feels warm during use


### Other settings:

#### Cable Exit Slots (Top Edge Access)
```
cable_slot_width = 10;
cable_slot_height = 6;
cable_slot_offset = 2;
```

#### Feet (Desk Isolation)
```
foot_diameter = 8;
foot_height = 2;
foot_offset = 6;
```
#### Lid Lip Geometry:
```
lid_lip_height = 4;
lid_lip_overlap = 3;
```

### Recommended Defaults in OpenSCAD(PLA)

| Parameter      | Value  |
| -------------- | ------ |
| Wall thickness | 3 mm   |
| Tolerance      | 0.4    |
| Infill         | 15–20% |
| Vent height    | 2 mm   |
| Lid lip height | 4 mm   |


## Bambu Lab Print Settings (Recommended)

Printer: Bambu Lab P1 / P1S / X1 / X1C / P2S (potentially new models as well)
Material: PLA (generic or Bambu PLA)
Nozzle: 0.4 mm
Layer Height: 0.20 mm

These settings prioritize mechanical strength, dimensional accuracy, and heat safety for a power-adapter enclosure.

### Quality

- Layer Height: 0.20 mm
- Initial Layer Height: 0.24 mm
- Line Width: 0.42 mm
- Seam Position: Aligned

### Strength

- Wall Loops: 4
- Top Shell Layers: 6
- Bottom Shell Layers: 6
- Infill Density: 20 %
- Infill Pattern: Gyroid

**Note:** Strength is achieved primarily via wall thickness rather than infill.


### Adhesion & Dimensional Accuracy

- Elephant Foot Compensation: 0.15 mm
- Brim: Off (enable only if bed adhesion is poor)
- Supports: Off



var num_enemies = 1;

// Only spawn if o_safeSpot exists
if (instance_exists(o_safeSpot)) {
	var walkables = [];
	with (o_walkable) {
        array_push(walkables, id);
    }

    while (instance_number(o_enemy) < num_enemies && array_length(walkables) > 0) {
        var tries = 0;
        var placed = false;

        while (!placed && tries < 50) {

            tries += 1;
			
			var idx = irandom(array_length(walkables) -1);
			var walk_inst = walkables[idx];

            if (!position_meeting(walk_inst.x,walk_inst.y, o_enemy)){
                instance_create_layer(walk_inst.x,walk_inst.y, "Instances", o_enemy);
                placed = true;
            }
        }

        if (!placed) break;
    }
}

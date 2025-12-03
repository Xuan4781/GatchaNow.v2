var num_enemies = 1;

// Only spawn if o_safeSpot exists
if (instance_exists(o_safeSpot)) {
    while (instance_number(o_enemy) < num_enemies) {
        var tries = 0;
        var placed = false;

        while (!placed && tries < 100) {
            var ex = irandom(room_width - 100);
            var ey = irandom(room_height - 100);
            tries += 1;

            if (!position_meeting(ex, ey, o_wall) && !position_meeting(ex, ey, o_safeSpot)) {
                instance_create_layer(ex, ey, "Instances", o_enemy);
                placed = true;
            }
        }

        if (!placed) break;
    }
}

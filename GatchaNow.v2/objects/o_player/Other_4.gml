if (global.move_to_last_safe) {
    if (global.last_safeSpot != noone) {
        x = global.last_safeSpot.x;
        y = global.last_safeSpot.y;
    }
    global.move_to_last_safe = false;
}

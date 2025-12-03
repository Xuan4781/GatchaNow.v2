last_hdir = "right"; // default direction
if (!variable_global_exists("move_to_last_safe")) {
    global.move_to_last_safe = false;
}

if (!variable_global_exists("last_safeSpot")) {
    global.last_safeSpot = noone;
}

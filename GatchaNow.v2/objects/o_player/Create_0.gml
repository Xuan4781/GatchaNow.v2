last_hdir = "right"; // default direction
if (!variable_global_exists("move_to_last_safe")) {
    global.move_to_last_safe = false;
}

if (!variable_global_exists("last_safeSpot")) {
    global.last_safeSpot = noone;
}
if (!variable_global_exists("current_form")) {
    global.current_form = 0; 
}


function apply_player_form() {
    switch (global.current_form) {
        case 1:
            sprite_index = s_rare1;
            break;
        case 2:
            sprite_index = s_docter1;
            break;
        case 3:
            sprite_index = s_farmer1;
            break;
		case 4:
			sprite_index = s_playerleftidle;
        default:
            sprite_index = s_playerleftidle;
    }
}


apply_player_form();
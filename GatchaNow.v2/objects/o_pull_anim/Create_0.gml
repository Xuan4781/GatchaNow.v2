anim_finished = false;
image_index = 0;
image_speed = 0.2; 

x = 0;
y = 0;

// pulled sprite animation
if (variable_global_exists("last_pull_sprite_anim")) {
	audio_play_sound(so_pull, 1, false);
    sprite_index = global.last_pull_sprite_anim;
} else {
    sprite_index = s_c1_anim; 
}



image_xscale = 1;
image_yscale = 1;

var safe_inst = instance_nearest(x, y, o_safeSpot);
var in_safe = place_meeting(o_player.x, o_player.y, o_safeSpot);


if (in_safe) {
    if (irandom(100) < change_dir_chance) move_dir = irandom(360);
    var nx = x + lengthdir_x(random_speed, move_dir);
    var ny = y + lengthdir_y(random_speed, move_dir);

    if (place_meeting(nx, ny, o_wall) 
        || (safe_inst != noone && point_distance(nx, ny, safe_inst.x, safe_inst.y) < avoid_dist)) {
        move_dir = irandom(360);
    } else {
        x = nx;
        y = ny;
    }

} else {
    var dir = point_direction(x, y, o_player.x, o_player.y);
    dir += irandom_range(-20, 20);
    var other_enemy = instance_nearest(x, y, o_enemy);
    if (other != noone && other.id != id) {
        var dist = point_distance(x, y, other_enemy.x, other_enemy.y);
        if (dist < 48) {
            var away = point_direction(other_enemy.x, other_enemy.y, x, y);
            dir = lerp(dir, away, 0.3);
        }
    }

    var nx = x + lengthdir_x(move_speed, dir);
    var ny = y + lengthdir_y(move_speed, dir);

    var tries = 0;
    var max_tries = 20;
    while ((place_meeting(nx, ny, o_wall) 
        || (safe_inst != noone && point_distance(nx, ny, safe_inst.x, safe_inst.y) < avoid_dist)) 
        && tries < max_tries) 
    {
        dir += irandom_range(-90, 90);
        nx = x + lengthdir_x(move_speed, dir);
        ny = y + lengthdir_y(move_speed, dir);
        tries++;
    }

    if (!place_meeting(nx, ny, o_wall) 
        && (safe_inst == noone || point_distance(nx, ny, safe_inst.x, safe_inst.y) >= avoid_dist)) {
        x = nx;
        y = ny;
    }
}

if (move_dir >= 90 && move_dir <= 270) {
    sprite_index = s_enemyleft;
} else {
    sprite_index = s_enemyright;
}

if (place_meeting(x, y, o_player)) {
    global.coins = 0;
    if (safe_inst != noone) {
        o_player.x = safe_inst.x;
        o_player.y = safe_inst.y;
    }
}



// dialogue
dialogue_timer++;
if (dialogue_timer >= dialogue_interval) {
    dialogue_timer = 0;
    dialogue_text = choose(
        "You can't escape me!",
        "Those coins are mine!",
        "Run while you can!",
        "I see you...",
        "Soon, I'll catch you!"
    );
}

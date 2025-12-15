var move = 2;
var moving = false;
var hsp = 0;
var vsp = 0;

switch(global.current_form) {
    case 1: 
        move += 1;
        break;
    case 2:
        break;
    case 3: 
        break;
    default:
        break;
}

if (room == gacha) exit;
if (keyboard_check(vk_left))  hsp -= move;
if (keyboard_check(vk_right)) hsp += move;
if (keyboard_check(vk_up))    vsp -= move;
if (keyboard_check(vk_down))  vsp += move;

// --- Horizontal 
if (hsp != 0) {
    if (!place_meeting(x + hsp, y, o_wall)) {
        x += hsp;
    } else {
        while (!place_meeting(x + sign(hsp), y, o_wall)) {
            x += sign(hsp);
        }
    }
    moving = true;
    last_hdir = (hsp < 0) ? "left" : "right";
}

// --- Vertical
if (vsp != 0) {
    if (!place_meeting(x, y + vsp, o_wall)) {
        y += vsp;
    } else {
        while (!place_meeting(x, y + sign(vsp), o_wall)) {
            y += sign(vsp);
        }
    }
    moving = true;
}


if (global.current_form == 0) {
    if (!moving) {
        sprite_index = (last_hdir == "left")
            ? s_playerleftidle
            : s_playerrightidle;
    } else {
        sprite_index = (last_hdir == "left")
            ? s_playerleftrun
            : s_playerrightrun;
    }
}

// --- Enemy
if (place_meeting(x, y, o_enemy)) {
    global.coins = 0;
    var safe_inst = instance_nearest(x, y, o_safeSpot);
    if (safe_inst != noone) {
        x = safe_inst.x;
        y = safe_inst.y;
    }
}

var safe_inst = instance_place(x, y, o_safeSpot);
if (safe_inst != noone) {
    global.last_safeSpot = safe_inst;
}


//player swich
if (keyboard_check_pressed(ord("1")) && global.unlocked_forms.banner1) {
    global.current_form = 1;
    apply_player_form();
}

if (keyboard_check_pressed(ord("2")) && global.unlocked_forms.banner2) {
    global.current_form = 2;
    apply_player_form();
}

if (keyboard_check_pressed(ord("3")) && global.unlocked_forms.banner3) {
    global.current_form = 3;
    apply_player_form();
}
if (keyboard_check_pressed(ord("4"))) {
    global.current_form = 0;
    apply_player_form();
}
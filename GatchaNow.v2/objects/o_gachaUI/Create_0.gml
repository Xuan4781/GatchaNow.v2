display_set_gui_size(746, 287);

start_x = 20;
start_y = 20;
button_width  = sprite_get_width(s_b1);
button_height = sprite_get_height(s_b1);
button_gap    = 20;
button2_y = start_y + button_height + button_gap;
button3_y = button2_y + button_height + button_gap;

banner1_sprite = s_gatcha_back;  
banner2_sprite = s_gatcha2;     
banner3_sprite = s_gatcha3;      

// Button sprites
button1_sprite = s_b1;
button2_sprite = s_b2;
button3_sprite = s_b3;


show_banner1 = true;    
show_banner2 = false;
show_banner3 = false;

button_width = sprite_get_width(s_b1);
button_height = sprite_get_height(s_b1);
button_gap = 20;

// back / pull sizes
exit_w = sprite_get_width(s_back);
exit_h = sprite_get_height(s_back);

pull_w = sprite_get_width(s_pull);
pull_h = sprite_get_height(s_pull);

function do_gacha_pull() {
    if (global.coins < 1) {
        show_message("Not enough coins!");
        return;
    }

    global.coins -= 1;

    var pull_table = [
        { spr: s_rare, anim_spr: s_rare_anim, weight: 5 },
        { spr: s_c1,   anim_spr: s_c1_anim,   weight: 47 },
        { spr: s_c4,   anim_spr: s_c4_anim,   weight: 71 },
        { spr: s_c5,   anim_spr: s_c5_anim,   weight: 30 },
        { spr: s_c6,   anim_spr: s_c6_anim,   weight: 90 }
    ];

    // Weighted roll
    var total_weight = 0;
    for (var i = 0; i < array_length(pull_table); i++)
        total_weight += pull_table[i].weight;

    var r = irandom(total_weight - 1);
    var cum_weight = 0;
    var chosen_entry;

    for (var i = 0; i < array_length(pull_table); i++) {
        cum_weight += pull_table[i].weight;
        if (r < cum_weight) {
            chosen_entry = pull_table[i];
            break;
        }
    }

    var chosen_static = chosen_entry.spr;
    global.last_pull_sprite_static = chosen_static;
    global.last_pull_sprite_anim   = chosen_entry.anim_spr;

    // Add to inventory
    var found = false;
    for (var i = 0; i < array_length(global.inv); i++) {
        if (global.inv[i].sprite == chosen_static) {
            global.inv[i].count += 1;
            found = true;
            break;
        }
    }

    if (!found) {
        for (var i = 0; i < array_length(global.item_list); i++) {
            if (global.item_list[i].sprite == chosen_static) {
                var new_item = {
                    name: global.item_list[i].name,
                    description: global.item_list[i].description,
                    sprite: global.item_list[i].sprite,
                    count: 1
                };
                array_push(global.inv, new_item);
                break;
            }
        }
    }

    room_goto(rm_pull_result);
}

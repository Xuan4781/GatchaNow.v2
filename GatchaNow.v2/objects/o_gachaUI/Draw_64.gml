var gui_w = display_get_gui_width();  // 746
var gui_h = display_get_gui_height(); // 287


var start_x = 20;  
var start_y = 20;  


draw_sprite(button1_sprite, 0, start_x, start_y);

var button2_y = start_y + button_height + button_gap;
draw_sprite(button2_sprite, 0, start_x, button2_y);

var button3_y = button2_y + button_height + button_gap;
draw_sprite(button3_sprite, 0, start_x, button3_y);


if (show_banner1) {
    var banner_x = gui_w - sprite_get_width(banner1_sprite); 
    draw_sprite(banner1_sprite, 0, banner_x, 0);
} 
else if (show_banner2) {
    var banner_x = gui_w - sprite_get_width(banner2_sprite);  
    draw_sprite(banner2_sprite, 0, banner_x, 0);
} 
else if (show_banner3) {
    var banner_x = gui_w - sprite_get_width(banner3_sprite);  
    draw_sprite(banner3_sprite, 0, banner_x, 0);
}


// back button
var exit_w = sprite_get_width(s_back);
var exit_h = sprite_get_height(s_back);
var exit_x = gui_w - exit_w/2 - 30; 
var exit_y = exit_h/2 + 1;         

draw_sprite(s_back, 0, exit_x, exit_y);

// back click
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(mx, my, exit_x - exit_w/2, exit_y - exit_h/2,
                                        exit_x + exit_w/2, exit_y + exit_h/2)) {
        room_goto(map);
        global.move_to_last_safe = true;
    }
}              

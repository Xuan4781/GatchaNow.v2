var gui_w = display_get_gui_width();  // 746
var gui_h = display_get_gui_height(); // 287


draw_sprite(button1_sprite, 0, start_x, start_y);
draw_sprite(button2_sprite, 0, start_x, button2_y);
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


// back button + pull button
draw_sprite(s_back, 0, exit_x, exit_y);
draw_sprite(s_pull, 0, pull_x, pull_y);

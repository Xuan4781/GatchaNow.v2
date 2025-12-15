var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();


// BACK position
exit_x = gui_w - exit_w/2 - 30;
exit_y = exit_h/2 + 1;

// PULL position
pull_x = gui_w - pull_w/2 - 30;
pull_y = gui_h - pull_h/2 - 20;


if (mouse_check_button_pressed(mb_left)) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
	// BACK BUTTON
    if (point_in_rectangle(
        mx, my,
        exit_x - exit_w/2, exit_y - exit_h/2,
        exit_x + exit_w/2, exit_y + exit_h/2
    )) {
        room_goto(map);
        global.move_to_last_safe = true;
        exit;
    }

    // PULL BUTTON
    if (point_in_rectangle(
        mx, my,
        pull_x - pull_w/2, pull_y - pull_h/2,
        pull_x + pull_w/2, pull_y + pull_h/2
    )) {
        do_gacha_pull();
        exit;
    }
	

    // b1
    if (mx >= start_x && mx <= start_x + button_width &&
        my >= start_y && my <= start_y + button_height) {
        show_banner1 = true;
        show_banner2 = false;
        show_banner3 = false;
		global.current_banner = 1;
    }
    
    // b2
    var button2_y = start_y + button_height + button_gap;
    if (mx >= start_x && mx <= start_x + button_width &&
        my >= button2_y && my <= button2_y + button_height) {
        show_banner1 = false;
        show_banner2 = true;
        show_banner3 = false;
		global.current_banner = 2;
    }
    
    // b3
    var button3_y = button2_y + button_height + button_gap;
    if (mx >= start_x && mx <= start_x + button_width &&
        my >= button3_y && my <= button3_y + button_height) {
        show_banner1 = false;
        show_banner2 = false;
        show_banner3 = true;
		global.current_banner = 3;
    }
}



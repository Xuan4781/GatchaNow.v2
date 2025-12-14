if (mouse_check_button_pressed(mb_left)) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
    var start_x = 20;
    var start_y = 20;
    // b1
    if (mx >= start_x && mx <= start_x + button_width &&
        my >= start_y && my <= start_y + button_height) {
        show_banner1 = true;
        show_banner2 = false;
        show_banner3 = false;
    }
    
    // b2
    var button2_y = start_y + button_height + button_gap;
    if (mx >= start_x && mx <= start_x + button_width &&
        my >= button2_y && my <= button2_y + button_height) {
        show_banner1 = false;
        show_banner2 = true;
        show_banner3 = false;
    }
    
    // b3
    var button3_y = button2_y + button_height + button_gap;
    if (mx >= start_x && mx <= start_x + button_width &&
        my >= button3_y && my <= button3_y + button_height) {
        show_banner1 = false;
        show_banner2 = false;
        show_banner3 = true;
    }
}
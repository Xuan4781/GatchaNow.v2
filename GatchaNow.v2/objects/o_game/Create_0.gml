display_set_gui_size(746, 287);

if !variable_global_exists("coins") {
    global.coins = 0;
}
if !variable_global_exists("current_pull") {
    global.current_pull = noone;
}
if (!variable_global_exists("current_banner")) {
    global.current_banner = 1; 
}

var win_w = 1290
var win_h = 574; 

surface_resize(application_surface, win_w, win_h);
window_set_size(win_w, win_h);

enum BannerRare {
    BANNER1 = 1,
    BANNER2 = 2,
    BANNER3 = 3
}

if (!variable_global_exists("unlocked_forms")) {
    global.unlocked_forms = {
        banner1: false,
        banner2: false,
        banner3: false
    };
}

if (!variable_global_exists("current_form")) {
    global.current_form = 1; 
}
display_set_gui_size(746, 287);

if !variable_global_exists("coins") {
    global.coins = 0;
}
if !variable_global_exists("current_pull") {
    global.current_pull = noone;
}
var win_w = 1290
var win_h = 574; 

surface_resize(application_surface, win_w, win_h);
window_set_size(win_w, win_h);

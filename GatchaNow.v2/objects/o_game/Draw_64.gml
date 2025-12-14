draw_set_font(FontSmall);

if (room == gacha) {
    draw_set_color(c_black);
} else {
    draw_set_color(c_white);
}

var margin_top = 4; 
var coin_text = "Coins: " + string(global.coins);
var text_w = string_width(coin_text);

var x_gui = display_get_gui_width() / 2 - text_w / 2;
var y_gui = margin_top;
draw_text(x_gui, y_gui, coin_text);

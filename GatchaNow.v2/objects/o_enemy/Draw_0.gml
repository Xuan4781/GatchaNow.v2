draw_self();

if (dialogue_text != "") {
    draw_set_font(-1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_color(c_white);

    draw_text(x, y - sprite_height, dialogue_text);
}

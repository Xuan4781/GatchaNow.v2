if (room != gacha) {
    draw_set_font(global.Font);
    draw_set_color(c_white);
    draw_set_halign(fa_left);  
    draw_set_valign(fa_top);   
    draw_set_alpha(1);        

    for (var i = 0; i < array_length(global.inv); i++) {
        var _xx = screen_bord_x;
        var _yy = screen_bord_y + sep * i;

        draw_sprite_ext(global.inv[i].sprite, 0, _xx, _yy, inv_sprite_scale, inv_sprite_scale, 0, c_white, 1);

        var name_text = global.inv[i].name;
        if (global.inv[i].count > 1) {
            name_text += " x" + string(global.inv[i].count);
        }

        draw_text(_xx + text_padding_x, _yy + text_offset_y, name_text);
    }
}


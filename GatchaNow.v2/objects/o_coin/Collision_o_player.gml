if (instance_exists(o_player)) {
    audio_play_sound(so_coin, 1, false);

    var coin_value = 1;

    if (global.current_form == 2) {
        coin_value += 2; 
    }

    global.coins += coin_value;
    instance_destroy();
}

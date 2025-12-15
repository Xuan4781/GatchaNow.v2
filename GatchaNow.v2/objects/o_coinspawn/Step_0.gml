var max_coins = 5;
var buffer = 16; 

if (global.current_form == 3) {
    max_coins = 10;
}

if (instance_number(o_coin) < max_coins) {
    var attempts = 0;
    var placed = false;

    while (!placed && attempts < 50) {
        attempts += 1;

        var cx = irandom(room_width - 32);
        var cy = irandom(room_height - 32);

        var left = cx - buffer;
        var top = cy - buffer;
        var right = cx + 32 + buffer;
        var bottom = cy + 32 + buffer;

        if (instance_position(cx, cy, o_walkable) != noone &&
            collision_rectangle(left, top, right, bottom, o_wall, false, true) == noone) 
        {
            instance_create_layer(cx, cy, "Instances", o_coin);
            placed = true;
        }
    }
}

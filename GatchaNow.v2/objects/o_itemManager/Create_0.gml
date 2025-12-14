depth = -999;
persistent = true;

if (!variable_global_exists("FontSmall")) {
    global.Font = Font1;
}
global.font = global.Font;

if (!variable_global_exists("item_list")) {
    global.item_list = [
		//b1
        { name:"Burger", description:"It's a Burger, recovers HP", sprite:s_c1 },
        { name:"Rare Char", description:"A super rare character", sprite:s_rare },
        { name:"Rejection", description:"Useless", sprite:s_c4 },
        { name:"Resume", description:"Some working paper", sprite:s_c5 },
        { name:"Mcdonalds", description:"An option", sprite:s_c6 },
		
		//b2
		{ name:"Doctor", description:"Rare", sprite:s_docter },
		{ name:"Cerf", description:"Common", sprite:s_cerf},
		{ name:"Syringe",description:"Common", sprite:s_syringe},
		
		//b3
		{ name:"Farmer", description:"Rare", sprite:s_farmer},
		{ name:"No Crops", description:"Common", sprite:s_nocrops},
		{ name:"Taxes", description: "Common", sprite:s_taxes}
    ];
}

if (!variable_global_exists("inv")) {
    global.inv = [];
}

if (!variable_global_exists("inv_display")) {
    global.inv_display = [];
}

sep = 17;
screen_bord_x = 10;
screen_bord_y = 10;
inv_sprite_scale = 0.4;
text_padding_x = 18;
text_offset_y = 2;

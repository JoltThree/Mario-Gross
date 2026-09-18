// Draw GUI event
if(room != rm_title){
    draw_set_colour(c_white)
    draw_set_font(Font1)

    var scale = 2;           // bump this up/down to taste
    var label = "VIDAS: ";
    var label_x = 32;
    var label_y = 16;

    draw_text_transformed(label_x, label_y, label, scale, scale, 0);

    // find out how wide the scaled text actually is, so sprites start right after it
    var label_w = string_width(label) * scale;
    var icon_spacing = 40;   // gap between each life icon, scaled up from your old 33
    var icon_size = 32;      // scaled up from your old 8x8
    var icon_x = label_x + label_w - 25; // small padding after the text
    var icon_y = label_y;

    for(var i = 0; i < global.Vidas; i += 1)
    {
        draw_sprite_stretched(spr_mario_idle, 2, icon_x + (i * icon_spacing), icon_y, icon_size, icon_size)
    }
}
// Draw GUI event
if (show_jumpscare) {
    var frame_count = sprite_get_number(spr_jumpscare);
    var frame = min(floor(jumpscare_timer), frame_count - 1);

    draw_sprite_stretched(spr_jumpscare, frame, 0, 0, display_get_gui_width(), display_get_gui_height());

    jumpscare_timer += 0.5; // playback speed — raise/lower to taste
}
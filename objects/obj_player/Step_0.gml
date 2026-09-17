// Step event
if (!alive) {
    if (!dead_handled) {
        dead_handled = true;
        xspd = 0;
        yspd = jump_spd * 1.25;
        is_jumping = true;
        instance_deactivate_layer("enemy");
        alarm[1] = 10;
        alarm[0] = 60;
    }

    // death hop: fall freely, no collision
    sprite_index = spr_mariodead;
    image_speed = 0;
    yspd += grav;
    y += yspd;
    exit;
}


//controls
var left_key = keyboard_check(vk_left)
var right_key = keyboard_check(vk_right)
var up_pressed = keyboard_check_pressed(vk_up)
var up_held = keyboard_check(vk_up)

//movement
if(alive == true){
	xspd = (right_key - left_key) * move_spd
}else if(alive == false){
	sprite_index = spr_mariodead
}
//check if on ground (one pixel below mario)
on_ground = place_meeting(x, y + 1, obj_collision);

//jump start
if(alive == true){
	if (up_pressed && on_ground) {
		audio_play_sound(snd_jump,10,false)
		yspd = jump_spd;
		is_jumping = true;
	}
} else
if(alive == false){
	sprite_index = spr_mariodead
}
//variable gravity: lighter gravity while holding jump AND still rising
if (is_jumping && up_held && yspd < 0) {
    yspd += jump_grav;
} else {
    yspd += grav;
}

//if the player releases jump early while still rising, cut the velocity (short hop)
if (is_jumping && !up_held && yspd < 0) {
    yspd *= jump_cut;
    is_jumping = false;
}

//horizontal collision
if (place_meeting(x + xspd, y, obj_collision)) {
    xspd = 0;
}
x += xspd;

//vertical collision
if (yspd != 0 && place_meeting(x, y + yspd, obj_collision)) {
    //snap to the collider so we don't tunnel/jitter
    while (!place_meeting(x, y + sign(yspd), obj_collision)) {
        y += sign(yspd);
    }
    yspd = 0;
    is_jumping = false;
}
y += yspd;

//animate
if (xspd > 0) {
    dir = 2;
    if (on_ground) {
        sprite_index = spr_mario_wr;
        image_speed = 1;
    }
} else if (xspd < 0) {
    dir = 1;
    if (on_ground) {
        sprite_index = spr_mario_wl;
        image_speed = 1;
    }
}

if (yspd == 0 && xspd == 0 && on_ground) {
    if (dir == 1) {
        sprite_index = spr_mario_idle_2;
    } else if (dir == 2) {
        sprite_index = spr_mario_idle;
    }
}

//airborne sprites (based on being off the ground, not is_jumping)
if (!on_ground) {
    if (dir == 1) {
        sprite_index = spr_mario_jump_2;
        image_speed = 0;
    } else if (dir == 2) {
        sprite_index = spr_mario_jump;
        image_speed = 1;
    }
}
if (place_meeting(x, y - 1, obj_player) && is_dead == false){
	sprite_index = spr_goombadead
	is_dead = true
	alarm[0] = 1 * 60
} else if (place_meeting(x - 1,y , obj_player) && is_dead == false){
	game_restart()
}else if (place_meeting(x + 1,y , obj_player) && is_dead == false){
	game_restart()
}
if (is_dead == false){
	// Apply gravity if not on the ground
	if (!place_meeting(x, y + 1, obj_collision)) {
	    v_speed += grav;
	} else {
	    v_speed = 0;
	}

	// collision Collision & Turning
	if (place_meeting(x + h_speed, y, obj_collision)) {
	    // Move up close to the collision before turning
	    while (!place_meeting(x + sign(h_speed), y, obj_collision)) {
	        x += sign(h_speed);
	    }
	    h_speed = -h_speed; // Reverse horizontal direction
	}
	x += h_speed; // Commit horizontal movement

	// Ledge Detection & Turning (Optional)
	if (turn_at_ledges && place_meeting(x, y + 1, obj_collision)) {
	    // Check if there is no ground ahead where the Goomba is walking
	    var check_x = x + (sign(h_speed) * sprite_width / 2);
	    if (!place_meeting(check_x, y + 1, obj_collision)) {
	        h_speed = -h_speed; // Turn around at the edge
	    }
	}

	// Vertical Collision
	if (place_meeting(x, y + v_speed, obj_collision)) {
	    while (!place_meeting(x, y + sign(v_speed), obj_collision)) {
	        y += sign(v_speed);
	    }
	    v_speed = 0;
	}
	y += v_speed; // Commit vertical movement

	// Update sprite direction to match movement
	if (h_speed != 0) {
	    image_xscale = -sign(h_speed); // Flips sprite based on direction
	}
}
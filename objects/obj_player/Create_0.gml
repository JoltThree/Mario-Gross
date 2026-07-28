//define variables
dir = 0 // 1 =L, 2 = R
xspd = 0
yspd = 0
move_spd = 2
grav = 0.5;        // normal fall gravity
jump_grav = 0.25;  // reduced gravity while holding jump on the way up
jump_spd = -6.4;      // initial jump velocity
jump_cut = 0.5;     // how much upward speed gets cut if you release early
is_jumping = false; // tracks whether we're still in the "held jump" phase
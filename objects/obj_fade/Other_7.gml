room_goto(target_room)
obj_player.x = target_x
obj_player.y = target_y

//fade out
image_speed = -1

//facing

if(facing == 0)
{
	obj_player.sprite_index = spr_mario_idle
}
if(facing == 1)
{
	obj_player.sprite_index = spr_mario_idle_2
}

//fade out
image_index = 8
image_speed = -1
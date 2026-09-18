//slide on screen
if(x < 120)
{
	x += 2
}
//dont' shake
x[0] = round(x[0.1]);
y[0] = round(y[0.1]);

//start save
ini_open("mariogross.ini")
if(image_index == 1 and keyboard_check_pressed(ord("Z")))
{
	room_goto(global.start_room)
	var instantiated = instance_create_layer(global.start_x, global.start_y, "player", obj_player)
	global.new_game = false
}
ini_close()
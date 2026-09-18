/// @Description add an id for every new room

global.start_room = rm_test
global.start_x = 159
global.start_y = 161

global.new_game = false
global.title_buttons = false

//room ids
global.rm0 = 0
global.rm1 = 1
global.rm2 = 2
global.rm3 = 3
global.rm4 = 4
global.rm5 = 5

if(file_exists("dambakqurrLegends.ini"))
{
	instance_create_depth(-40, 80, 100, obj_buttons_continue)
	
	ini_open("dambakqurrLegends.ini")
	global.start_room = ini_read_real("Save1", "room", rm_test)
	global.start_x = ini_read_real("Save1", "x", 159)
	global.start_y = ini_read_real("Save1", "y", 161)
	ini_close()
}
else
{
	instance_create_depth(-40, 80, 100, obj_buttons)
}
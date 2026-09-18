/// @Description add an id for every new room

global.start_room = rm_level1
global.start_x = 125
global.start_y = 200

global.new_game = false
global.title_buttons = false

//room ids
global.rm0 = 0
global.rm1 = 1
global.rm2 = 2
global.rm3 = 3
global.rm4 = 4
global.rm5 = 5

if(file_exists("mariogross.ini"))
{
	instance_create_depth(-15, 100, 100, obj_buttons_continue)
	
	ini_open("mariogross.ini")
	global.start_room = ini_read_real("Save1", "room", rm_level2)
	global.start_x = ini_read_real("Save1", "x", 159)
	global.start_y = ini_read_real("Save1", "y", 161)
	global.Vidas = ini_read_real("Save1", "lives", 3)
	obj_mus.song = ini_read_real("Save1", "song", snd_music)
	ini_close()
}
else
{
	instance_create_depth(-15, 100, 100, obj_buttons)
}
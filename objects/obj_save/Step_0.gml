// obj_save, Step_0
if place_meeting(x, y, obj_player)
{
    show_debug_message("saved")

    global.start_room = room;
    global.start_x = obj_player.x;
    global.start_y = obj_player.y;

    ini_open("mariogross.ini")
    ini_write_real("Save1", "room", room)
    ini_write_real("Save1", "x", obj_player.x)
    ini_write_real("Save1", "y", obj_player.y)
    ini_write_real("Save1", "facing", obj_player.dir)
    ini_write_real("Save1", "lives", global.Vidas)
    ini_close()
}
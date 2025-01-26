if room = rm_game
{
	global.soffitto = camera_get_view_y(view_camera[0]);
	global.terreno = 640;
	var a = instance_create_depth(room_width/2,global.terreno,-100,obj_player);	
	with a
	{
		player = other.playerbirth;	
	}
}
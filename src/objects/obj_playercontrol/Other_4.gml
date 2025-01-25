if room = rm_game
{
	global.terreno = 640;
	var a = instance_create_depth(room_width/2,global.terreno,-100,obj_player);	
	with a
	{
		player = other.playerbirth;	
	}
}
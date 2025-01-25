if room = rm_game
{
	global.terreno = room_height-30;
	var a = instance_create_depth(room_width/2,global.terreno,-100,obj_player);	
	with a
	{
		player = other.playerbirth;	
	}
}
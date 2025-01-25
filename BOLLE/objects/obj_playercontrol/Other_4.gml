if room = rm_game
{
	var a = instance_create_depth(room_width/2,room_height-30,-100,obj_player);	
	with a
	{
		player = other.playerbirth;	
	}
}
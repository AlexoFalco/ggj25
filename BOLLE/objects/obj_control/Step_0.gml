if room = rm_menu
{
	if pausePress
		room_goto(rm_game);
}
else if room = rm_game
{
	
}

if room != rm_game || (room = rm_game && gameover)
{
	{//allarmi in-game
		alarm[0] = 300; //vento
		alarm[1] = 120; //ape
		alarm[2] = 240; //foglia
	}
}
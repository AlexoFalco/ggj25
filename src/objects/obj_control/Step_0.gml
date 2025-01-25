if room = rm_menu
{
	if pausePress
		room_goto(rm_game);
}
else if room = rm_game
{
	if !gameover
	{
		
	}
	else
	{
		if floor(punteggio) > record[NumGiocatori]
		{
			record[NumGiocatori] = floor(punteggio);
			scr_send_score(nome,punteggio);
			scr_record();
		}	
	}
}

if room != rm_game || (room = rm_game && gameover)
{
	{//allarmi in-game
		alarm[0] = 300; //vento
		alarm[1] = 120; //ape
		alarm[2] = 240; //foglia
	}
}
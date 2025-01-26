if room = rm_menu
{
	if premuto_per_iniziare
		scr_menuiniziale_step();
	else
	{
		if confirmPress || pausePress
		{
			premuto_per_iniziare = true;
			parte_audio(global.sfx,sfx_bubble_pop,1,false);
		}
	}
}
else if room = rm_game
{
	if !gameover
	{
		alarm[4] = 180;
		if !instance_exists(obj_bolla)
			gameover = true;
			
		if pausePress && !pausato
		{
			pausato = true;
		}
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
		//alarm[2] = 240; //foglia
	}
}
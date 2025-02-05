if room = rm_menu
{
	alarm[9] = 90;
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
		score_sent = false;
		alarm[9] = 90;
		alarm[4] = 180;
		if !instance_exists(obj_bolla)
			gameover = true;
			
		if (pausePress || escPress) && !pausato
		{
			pausato = true;
		}
		
		if !con.pausato
		{
			timer_foglie = alarm[2];
			timer_api = alarm[1];
			timer_vento = alarm[0];
		}
		else
		{
			alarm[2] = timer_foglie;
			alarm[1] = timer_api;
			alarm[0] = timer_vento;
		}
	}
	else
	{
		if pp < floor(punteggio)
			pp+=floor((punteggio)/30);
		else
			pp = floor(punteggio);
			
		if floor(punteggio) > record[NumGiocatori]
		{
			record[NumGiocatori] = floor(punteggio);
			scr_record();
		}
		if !score_sent
		{
			score_sent = true;
			scr_send_score(nome,punteggio);
		}
		
		if sxPress
				selegameover = 0;
		else if dxPress
			selegameover = 1;
		
		if confirmPress && selegameover = 0 && alarm[9] <= 0
			{
				partita_iniziando = true;
				parte_audio(global.sfx,choose(sfx_gnap_zig, sfx_gnap_1, sfx_gnap_2, sfx_gnap_3, sfx_gnap_0),1,false,,5)
				partitaReset();
				room_restart();
			}
			else if (confirmPress && selegameover = 1)
			{
				partita_iniziando = false;
				partitaReset();
				room_goto(rm_menu);
			}
	}
}

if room != rm_game || (room = rm_game && gameover)
{
	{//allarmi in-game
		alarm[0] = 300; //vento
		alarm[1] = 360; //ape
		//alarm[2] = 240; //foglia
	}
}

if !impostazioni
	selimpostazioni = IMPOST.MUSICA;
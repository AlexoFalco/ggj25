if room = rm_menu
{
	draw_text_border(display_get_gui_width()/2,display_get_gui_height()/3,fnt_bubble,"GNÀP",,#FFA3F5,#CCF9FF,2,2);
	if !premuto_per_iniziare
		draw_text_border(display_get_gui_width()/2,display_get_gui_height()*2/3,fnt_base,"Press Enter to start", "Premi Invio per iniziare",c_white,c_black,,,,fa_center,fa_middle);
	else
	{
		if !impostazioni && !instance_exists(obj_highscore) //&& !menugiocatori
			scr_menuiniziale_draw();
		//else if menugiocatori
			//menu_giocatori_draw();
	}
	if impostazioni
	{
		scr_impostazioni_draw();
	}
}
else
{
	if pausato
	{
		scr_menu_pausa_step();
		if !impostazioni
		{
			menu_pausa_draw();
		}
		else
		{
			scr_impostazioni_draw();
		}
	}
	
	draw_text_border(display_get_gui_width()*15/16,display_get_gui_height()/16,fnt_base,$"Score\n{punteggio}", $"Punti\n{punteggio}")
	//debug_text($"{gameover}",display_get_gui_width()/2,display_get_gui_height()/2);
}
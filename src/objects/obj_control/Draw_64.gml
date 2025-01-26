if room = rm_menu
{
	
	var _x_center = display_get_gui_width()/2
	var _y_center = display_get_gui_height()/3
	var _scale = 1+dsin(current_time/12)/5
	var _title_rot = 15*dsin(current_time/10)
	draw_sprite_ext(spr_menu_title, 0, _x_center,_y_center, _scale, _scale, _title_rot, c_white, 1)
	//draw_text_border(display_get_gui_width()/2,display_get_gui_height()/3,fnt_bubble,"GNÀP",,#FFA3F5,#CCF9FF,2,2);
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
	else
	{
		draw_text_border(display_get_gui_width()/12+10,display_get_gui_height()*15/16,fnt_base,$"Ver. {versione}");
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
	
	draw_text_border(display_get_gui_width()*15/16,display_get_gui_height()/16,fnt_base,$"{punteggio}", $"{punteggio}")
	//debug_text($"{gameover}",display_get_gui_width()/2,display_get_gui_height()/2);
}
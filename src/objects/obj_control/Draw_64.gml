if room = rm_menu
{
	
	//draw_text_border(display_get_gui_width()/2,display_get_gui_height()/3,fnt_bubble,"GNÀP",,#FFA3F5,#CCF9FF,2,2);
	if !premuto_per_iniziare
	{
		var _x_center = display_get_gui_width()/2
		var _y_center = display_get_gui_height()/3
		var _scale = 1+dsin(current_time/12)/5
		var _title_rot = 10*dsin(current_time/15)
		draw_sprite_ext(spr_menu_title, 0, _x_center + 150,_y_center, _scale, _scale, _title_rot, c_white, 1)

		draw_text_border(display_get_gui_width()-10,display_get_gui_height()*15/16,fnt_base,"Press Z or Enter to start", "Premi Z o Invio per iniziare",c_white,c_black,,,,fa_right,fa_middle);
	}
	else
	{
draw_text_border(display_get_gui_width()-10,display_get_gui_height()*15/16,fnt_base,"Press Z to select", "Premi Z per selezionare",c_white,c_black,,,,fa_right,fa_middle);
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
	if !gameover
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
	else
	{
		if !instance_exists(obj_highscore)
			draw_text_border(display_get_gui_width()/2, display_get_gui_height()/2-50,fnt_base,"GAME OVER",,#CCF9FF,#FFA3F5,4);
		var _gopt, _gopty = display_get_gui_height()-50, _LNG = 70;
		if selegameover = 0
			_gopt = display_get_gui_width()/3-_LNG;
		else if selegameover = 1
			_gopt = 2*display_get_gui_width()/3-_LNG;
		
		draw_text_border(display_get_gui_width()/3,display_get_gui_height()-50,fnt_base,"TRY AGAIN", "RICOMINCIA");
		draw_text_border(2*display_get_gui_width()/3,display_get_gui_height()-50,fnt_base,"EXIT", "ABBANDONA");
		
		draw_set_color(c_red);
		draw_rectangle(_gopt,_gopty,_gopt+_LNG*2,_gopty+20,true);
	}
}

//debug_text($"{alarm[1]}",display_get_gui_width()/2,display_get_gui_height()/2);
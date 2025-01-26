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

//debug_text($"{global.language}",display_get_gui_width()/2,display_get_gui_height()/2);
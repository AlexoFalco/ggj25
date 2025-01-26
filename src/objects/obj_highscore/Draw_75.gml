/// @description Draw the highscores if available
if con.NumGiocatori = 1 //TEMPORANEO
{
	draw_set_colour(c_black);
	if (text1 == "Ready")
	{
		var yy = 30;
	    draw_set_halign(fa_center)
	    //draw_text_outline(__view_get( e__VW.WView, 0 )/2, __view_get( e__VW.HView, 0 )/15, string(global.l_leaderboard),c_white,2,0.5, 0)
	    draw_text_highscore(25, yy, string(text2), player_name, c_green);
	}
	else
	{
	    draw_set_color(c_white)
	    draw_text_border(display_get_gui_width()/2, display_get_gui_height()/2, fnt_base,text1);
	};
}

//draw_text(50,60,classifica_specifica);
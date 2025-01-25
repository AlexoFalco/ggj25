/// @description  @description  Draw the highscores if available
draw_set_colour(c_black);
if (text1 == "Ready")
{
	var yy;
	if room = rm_gioco
		yy = 170;
	else
		yy = 75;
    draw_set_halign(fa_center)
    //draw_text_outline(__view_get( e__VW.WView, 0 )/2, __view_get( e__VW.HView, 0 )/15, string(global.l_leaderboard),c_white,2,0.5, 0)
    draw_text_highscore(25, yy, string(text2), player_name, c_green);
}
else
{
    draw_set_color(c_white)
    draw_text(room_width/2, 150, text1);
};
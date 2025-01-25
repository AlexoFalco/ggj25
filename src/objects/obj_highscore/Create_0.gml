/// @description Initialise loading the online highscores
with obj_highscore
{
	if id != other.id
		instance_destroy();
}
con = obj_control;

depth = -1000;

player = con.NumGiocatori;
player_name = con.nome;
scr_get_scores(player_name);
if global.language = lang.eng
	text1 = "Loading..."
else if global.language = lang.ita
	text1 = "Caricamento...";
text2 = "";
alarm[1] = room_speed;


classifica_specifica = 0;
/// @description When the scores haven’t loaded, try again once per second
if (text2 == "")
{
    scr_get_scores(player_name);
    if global.language = lang.ita
				text1 = "Nessuna connessione ad Internet.";
			else if global.language = lang.eng
				text1 = "No Internet connection.";
    alarm[1] = room_speed;
}
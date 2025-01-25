/// @description  @description  When the scores haven’t loaded, try again once per second
if (text2 == "")
{
    scr_get_scores(player_name);
    text1 = "Nessuna connessione ad Internet.\nNo Internet connection";
    alarm[1] = room_speed;
}
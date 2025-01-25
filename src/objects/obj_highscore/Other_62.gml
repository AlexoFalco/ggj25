/// @description Receiving the result from Altervista
if (ds_map_find_value(async_load, "id") == get_highscores)
{
    if (ds_map_find_value(async_load, "status") == 0)
    {
        text2 = string(ds_map_find_value(async_load, "result"));
        //show_debug_message(text2);
        if (text2 == "")
        {
			if global.language = lang.ita
				text1 = "Nessuna connessione ad Internet.";
			else if global.language = lang.eng
				text1 = "No Internet connection.";
            text2 = "";
        }
        else if (text2 == "IOException")
        {
            text1 = "Nessuna connessione ad Internet.\nIOException";
            text2 = "";
        }
        else
        {
            text1 = "Ready";
            alarm[1] = -1;
        }
    }
}
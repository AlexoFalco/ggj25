/// @description  @description scr_get_scores(name,no_lines)
/// @param name
/// @param no_lines
/// @param name            name of the player
/// @param no_lines        the number of scores you want to display (generally 10 is fine)
function scr_get_scores(argument0) {
	//
	// Script:      Get the highscore list from the database in Altervista
	// Date:        2020-01-18
	// Copyright:   Appsurd

	var name = url_encode(base64_encode(string(argument0)));;
	var posizioni;
	if room = rm_game
		posizioni = 5;
	else
		posizioni = 10;
		
	var _ng, b;
	switch con.NumGiocatori
	{
		case 1: _ng = "&level=PSCA1"; b = "https://ftp.goldensun.altervista.org/PSCA1/display.php";  break;
		case 2: _ng = "&level=PSCA2"; b = "https://ftp.goldensun.altervista.org/PSCA2/display.php";  break;
		case 3: _ng = "&level=PSCA3"; b = "https://ftp.goldensun.altervista.org/PSCA3/display.php";  break;
		case 4: _ng = "&level=PSCA4"; b = "https://ftp.goldensun.altervista.org/PSCA4/display.php";  break;
	}
	
	var args = "name="+name+"&no_lines="+string(posizioni)+"&secret_key=t35vgvref565"+string(_ng);

	var map = ds_map_create();
	ds_map_add(map, "Content-Type", "application/x-www-form-urlencoded");

	get_highscores = http_request(b, "POST", map, args);

}

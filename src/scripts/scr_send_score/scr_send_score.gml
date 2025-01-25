function scr_send_score(name, sscore) {
	//
	// Script:      Sends the player’s score to the database in Altervista
	// Date:        2020-01-18
	// Copyright:   Appsurd

	var os;
	switch os_type
	{
		case os_android:
			os = "A";
			break;
		case os_windows:
			os = "W";
			break;
		default:
			os = "N";
			break;
	}
	var encname = url_encode(base64_encode(string(name)));
	var key = sha1_string_utf8(string(sscore)+","+string(os)+","+string("CBE")+"13244ff8");


	var args = "name="+encname+"&score="+string(sscore)+"&color="+string(os)+"&secret_key="+string(key)+"&level=CDTS";

	var b = "https://ftp.goldensun.altervista.org/CDTS/sendscore.php";
	var map = ds_map_create();
	ds_map_add(map, "Content-Type", "application/x-www-form-urlencoded");

	http_request(b, "POST", map, args);

}

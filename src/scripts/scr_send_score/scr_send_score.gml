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

	var _ng, b;
	 _ng = "&level=gnap"; b = "https://ftp.goldensun.altervista.org/gnap/sendscore.php";
	 
	var args = "name="+encname+"&score="+string(sscore)+"&color="+string(os)+"&secret_key="+string(key)+string(_ng);
	var map = ds_map_create();
	ds_map_add(map, "Content-Type", "application/x-www-form-urlencoded");

	http_request(b, "POST", map, args);

}

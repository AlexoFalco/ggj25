function scr_salva_volume()
{
	ini_open("gnap.sav");
	ini_write_string("Volume", "musica", global.sndvol);
	ini_write_string("Volume", "effetti sonori",global.sfxvol);
	ini_close();	
}

function scr_lingua(){
	ini_open("gnap.sav");
	ini_write_string("Altro", "lingua",global.language);
	ini_close();
}

function scr_salva_nome(){
	ini_open("gnap.sav");
	ini_write_string("Record", "nome",nome);
	ini_close();
}

function scr_record()
{
	ini_open("gnap.sav");
	ini_write_real("Record", "record1", record[1]);
	ini_write_real("Record", "record2", record[2]);
	ini_write_real("Record", "record3", record[3]);
	ini_write_real("Record", "record4", record[4]);
	ini_close();
}

function scr_carico(){
	if file_exists("gnap.sav")
	{
		var _lbase = lang.eng, _nbase = "Name" + string(notset);
		if versione = GM_version
		{
			_lbase = lang.ita;
			if test
				_nbase = "Zigoon";
			else
				_nbase = nome;
		}
			
		ini_open("gnap.sav");
		record[1] = ini_read_real("Record", "record1", 0);
		record[2] = ini_read_real("Record", "record2", 0);
		record[3] = ini_read_real("Record", "record3", 0);
		record[4] = ini_read_real("Record", "record4", 0);
		nome = ini_read_string("Record", "nome", _nbase);
		keyboard_string = nome;
		global.sndvol = ini_read_real("Volume","musica",1);
		global.sfxvol = ini_read_real("Volume","effetti sonori",1);
		global.language = ini_read_string("Altro","lingua",_lbase);
		ini_close();
		if nome = "Zigoon95"
			record[1] = 10000000;
		caricato = true;
	}
	else
	{
			
	}
}
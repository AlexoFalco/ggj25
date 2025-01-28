function lista_nomi_create(){
	if !file_exists("gnap.sav")
	{
		name_list = ds_list_create();
		record_list = ds_list_create();
	}
}

function nuovo_nome(){
	if !ds_list_find_index(name_list,$"{nome}")
	{
		ds_list_add(name_list,$"{nome}");
		ds_list_add(record_list,0);
		ini_open("gnap.sav");
		var nl = ds_list_write(name_list), rl = ds_list_write(record_list);
		ini_write_string("Lista nomi","nome",nl);
		ini_write_real("Lista record","record",rl);
		ini_close();
	}
}

function record_per_nome(){
	name_pos = ds_list_find_index(name_list,$"{nome}");
	rec_find = ds_list_find_index(record_list,name_pos);
	if punteggio > rec_find
	{
		ds_list_replace(record_list,name_pos,punteggio);
		scr_send_score(nome,punteggio);
		ini_open("gnap.sav");
		ini_write_real("Lista record","record",record_list);
		ini_close();
	}
}
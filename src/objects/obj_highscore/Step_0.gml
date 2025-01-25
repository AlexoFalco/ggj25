if room = rm_menu
{
	if con.sxPress
		classifica_specifica--;
	else if con.dxPress
		classifica_specifica++;
	
	classifica_specifica = (classifica_specifica+4) mod 4;
}
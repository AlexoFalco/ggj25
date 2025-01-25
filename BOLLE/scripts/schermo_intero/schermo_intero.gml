function schermo_intero(){
	if window_get_fullscreen()
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
}
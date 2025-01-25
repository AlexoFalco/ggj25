if room = rm_menu
{
	draw_text_border(display_get_gui_width()/2,display_get_gui_height()/2,fnt_base,"Press Enter to start", "Premi Invio per iniziare",c_white,c_black,,,,fa_center,fa_middle);
	disegna_musica(30,30);
}
else
{
	draw_text_border(display_get_gui_width()*15/16,display_get_gui_height()/16,fnt_base,$"Score\n{punteggio}", $"Punti\n{punteggio}")
	debug_text($"{gameover}",display_get_gui_width()/2,display_get_gui_height()/2);
}
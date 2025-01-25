if room = rm_menu
{
	draw_text_border(display_get_gui_width()/2,display_get_gui_height()/2,fnt_base,"Press Enter to start", "Premi Invio per iniziare",c_white,c_black,,,,fa_center,fa_middle);
	disegna_musica(30,30);
}
else
	debug_text($"{camera_get_view_x(view_camera[0])}, {camera_get_view_y(view_camera[0])}");
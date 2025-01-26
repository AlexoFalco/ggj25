
if (global.is_debug)
{
	draw_set_color(c_black)
	draw_line(x,y,x,y-200)
}
draw_self();

//debug_text($"{player}");

if con.pausato
	image_speed = 0;
else
	image_speed = 1;
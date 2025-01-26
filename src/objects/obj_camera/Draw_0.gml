if (global.is_debug == true)
{
	var h = 0;
	draw_set_color(c_white);
	draw_line(xmin, 0, xmin, 1000)
	draw_line(xmax, 0, xmax, 1000)
	
	draw_set_color(c_white)
	draw_line(0, global.soffitto, 10000, global.soffitto)
	draw_set_color(c_red)
	draw_line(0, global.soffitto+5, 10000, global.soffitto+5)
	draw_set_color(c_red)
	draw_line(xmin, 0, xmin, 10000)
	draw_line(xmax, 0, xmax, 10000)
}
draw_set_font(fnt_bubble);
draw_set_alpha(0.3);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(#9b6983);
//draw_text_transformed(x+1, y+1, text, 0.25, 0.25, 0);
//draw_text_transformed(x+1, y-1, text, 0.25, 0.25, 0);
//draw_text_transformed(x-1, y+1, text, 0.25, 0.25, 0);
//draw_text_transformed(x-1, y-1, text, 0.25, 0.25, 0);
draw_set_color(c_white);
draw_text_transformed(x, y, text, 0.25, 0.25, 0);
draw_set_alpha(1);
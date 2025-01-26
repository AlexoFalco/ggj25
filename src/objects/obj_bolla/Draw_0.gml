/// @description 
//draw_set_color(c_black)
//draw_set_circle_precision(64)
//draw_circle(x,y,raggio, true)
//draw_sprite_ext(sprite_index, image_index, x,y,image_xscale, image_yscale, image_angle, image_blend, 0.1)

//draw_self()
event_inherited();

var _instabilita = get_instbilita_bolla(n_figli, is_radice, is_first)
_tremolio = get_tremolio(_instabilita)

var _x = x + _tremolio
var _y = y;

//var color_dark = #c7d6ea
//var color_light = #ffffff
var color_shadow = #ffffff

color_fill_in[0] = #FFA3F5
color_fill_in[1] = #FFA3A3
color_fill_in[2] = #FF5E5E
color_fill_out[0] = #CCF9FF
color_fill_out[1] = #FFCECE
color_fill_out[2] = #FF9393

color_fill_in_current = color_fill_in[_instabilita]
color_fill_out_current = color_fill_out[_instabilita]

var raggio_to_draw = raggio

draw_set_alpha(0.3);
draw_circle_color(_x,_y,raggio_to_draw,color_fill_in_current,color_fill_out_current,false);
draw_set_alpha(1);

draw_set_alpha(0.1)
draw_set_color(color_shadow)
draw_circle(_x-1,_y-1,raggio_to_draw, 0)
draw_set_alpha(1)

//--| VECCHIO CODICE CHE RAPPRESENTA LA BOLLA COME DRAW_CIRCLE, SOSTITUITO DALLO SPRITE |--
//var surface_size = raggio*2+2
//if (surface_ref != noone and surface_exists(surface_ref) == true)
//{
//	surface_free(surface_ref)
//}
//surface_ref = surface_create(surface_size, surface_size)
//surface_set_target(surface_ref)

//draw_set_color(c_black)
//draw_set_circle_precision(64)
//draw_circle(raggio,raggio,raggio, true)


//gpu_set_blendmode_ext(bm_src_alpha, bm_one);
//gpu_set_blendequation_sepalpha(bm_add, bm_min);
//draw_rectangle_color(0, 0, surface_size, surface_size, color_dark, color_light, color_dark, color_dark, 0)

//gpu_set_blendmode(bm_normal)
																		 
//surface_reset_target()

//draw_surface(surface_ref, _x-raggio-1,_y-raggio-1)

if (raggio > 3)
{
	draw_sprite_ext(spr_bolla_riflesso, 0, _x+lengthdir_x(raggio_to_draw*0.8-3, 45), _y+lengthdir_y(raggio_to_draw*0.8-3, 45), 1, 1, 0, c_white, 0.5)
}
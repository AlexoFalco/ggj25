/// @description 
//draw_set_color(c_black)
//draw_set_circle_precision(64)
//draw_circle(x,y,raggio, true)
//draw_sprite_ext(sprite_index, image_index, x,y,image_xscale, image_yscale, image_angle, image_blend, 0.1)

var color_dark = #c7d6ea
var color_light = #ffffff
var color_fill = #ffffff

draw_set_alpha(0.1)
draw_set_color(color_fill)
draw_circle(x-1,y-1,raggio, 0)
draw_set_alpha(1)

var surface_size = raggio*2+2
if (surface_ref != noone and surface_exists(surface_ref) == true)
{
	surface_free(surface_ref)
}
surface_ref = surface_create(surface_size, surface_size)
surface_set_target(surface_ref)

draw_set_color(c_black)
draw_set_circle_precision(64)
draw_circle(raggio,raggio,raggio, true)


gpu_set_blendmode_ext(bm_src_alpha, bm_one);
gpu_set_blendequation_sepalpha(bm_add, bm_min);
draw_rectangle_color(0, 0, surface_size, surface_size, color_dark, color_light, color_dark, color_dark, 0)

gpu_set_blendmode(bm_normal)
																		 
surface_reset_target()

draw_surface(surface_ref, x-raggio-1,y-raggio-1)

draw_sprite_ext(spr_bolla_riflesso, 0, x+lengthdir_x(raggio*0.8-3, 45), y+lengthdir_y(raggio*0.8-3, 45), 1, 1, 0, c_white, 0.5)
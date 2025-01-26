if (image_index >= image_number-1)
	image_angle++;
draw_sprite_ext(spr_bee_wrap, 0, x, y, 1, 1, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, image_blend, image_alpha);
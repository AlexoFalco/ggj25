/// @description 

if (alberobolle = noone)
{
	alberobolle = instance_create_depth(mouse_x, mouse_y, depth, obj_bolla);
	alberobolle.is_radice = true
}
else
{
	var padrebolle = instance_nearest(mouse_x, mouse_y, obj_bolla)
	array_push(padrebolle.figli, instance_create_depth(mouse_x, mouse_y, depth, obj_bolla))
}
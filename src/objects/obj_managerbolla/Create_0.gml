/// @description 
alberobolle = noone;
window_set_size(640,360)


alberobolle = instance_create_depth(room_width/2, 80, 0, obj_bolla);
alberobolle.is_radice = true


create_bolla = function(_parent, _x, _y)
{
	var _new_depth = _parent.depth-1
	array_push(_parent.figli, instance_create_depth(_x, _y, _new_depth, obj_bolla))
}
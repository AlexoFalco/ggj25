/// @description 
alberobolle = noone;
window_set_size(640,360)

alberobolle = instance_create_depth(room_width/2, camera_get_view_y(view_camera[0])+80, 0, obj_bolla);
alberobolle.is_radice = true


create_bolla = function(_parent, _x, _y)
{
	var _new_depth = _parent.depth-1
	obj_control.punteggio += 100;
	var proiett = instance_create_depth(_x, _y, _new_depth, obj_bolla)
	alberobolle.set_shot_inpulse() 
	array_push(_parent.figli, proiett);
	return proiett;
}
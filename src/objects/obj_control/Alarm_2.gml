/// @description foglia
var _vX = camera_get_view_x(view_camera[0]), 
var _vY = camera_get_view_y(view_camera[0]), 
var startX = choose(_vX, _vX+30, _vX+60, _vX-30, _vX-60),
var startY = choose(_vY, _vY-20, _vY-40, _vY - 60)
_l = instance_create_depth(startX,startY,-50,obj_leaf);

with _l
{
	dir = choose(-1,1);
}

alarm[2] = 240;
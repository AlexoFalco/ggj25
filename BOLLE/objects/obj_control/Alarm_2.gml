/// @description foglia
var _vX = room_height/2, startX = choose(_vX, _vX+30, _vX+60, _vX-30, _vX-60),
startY = -30,
_l = instance_create_depth(startX,startY,-50,obj_leaf);

with _l
{
	dir = choose(-1,1);
}

alarm[2] = 240;
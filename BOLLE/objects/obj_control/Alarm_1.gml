/// @description ape
var startX = choose(obj_camera.xmin-30,obj_camera.xmax+30), _vY = obj_camera.ymin+obj_camera.nIngrandimento*3,
startY = choose(_vY+30, _vY+60,_vY+90),
b = instance_create_depth(startX,startY,-50,obj_bee);

with b
{
	if startX < room_width/2
		dir = 1;
	else
		dir = -1;
}

alarm[1] = 120;
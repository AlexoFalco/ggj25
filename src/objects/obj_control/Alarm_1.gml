/// @description ape
var startX = choose(obj_camera.xmin-30,obj_camera.xmax+30);
var startY = irandom_range(camera_get_view_y(view_camera[0])+20, global.terreno-60)
if !instance_exists(collision_line(startX-100, startY, startX+100, startY, obj_bolla,false,true))
{
	b = instance_create_depth(startX,startY,-50,obj_bee);

	with b
	{
		if startX < room_width/2
			dir = 1;
		else
			dir = -1;
	}
}

conta_api++;
alarm[1] = max(30,random_range(360 - (conta_api*2), 240 - (conta_api*2)));
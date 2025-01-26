if !instance_exists(obj_player)
	exit;


if !inizioPartita
{
	xmin-=150;
	xmax+=150;
	inizioPartita = true;
}
var raggiomax=0, ymin=global.terreno;
with obj_bolla
{
	if is_radice
	{
		if raggio > raggiomax
			raggiomax = raggio;
		if y-raggio < ymin
			ymin = y-raggio;
	}
}

	if raggiomax < 30
	{
		gosz = 320;
		if ymin > global.soffitto
			global.soffitto = min(ymin, camera_get_view_y(view_camera)+camera_get_view_height(view_camera)-180);
	}
	else
	{
		gosz = raggiomax * 6;
		global.soffitto = min(ymin, camera_get_view_y(view_camera)+camera_get_view_height(view_camera)-(gosz/180*320));
	}
		
		if ymin-20 < camera_get_view_y(view_camera)
		{
			gosz = max(gosz, (camera_get_view_y(view_camera)+camera_get_view_height(view_camera)-ymin)/180*320);
		}
		
	global.soffitto = max(global.soffitto, camera_get_view_y(view_camera));

//xmin = max(xmin, 320/2)
//xmax = min(xmax, room_width-320/2)


gosz = clamp(gosz, 320, 640);

xmax = room_width/2 + gosz/2-10;
xmin = room_width/2 - gosz/2+10;



if abs(sz-gosz)>1/20
{
	sz-= (sz - gosz) /20;
}
else
{
	sz = gosz;
}

szh = sz/320*180


x = (xmin+xmax)/2;

y = room_height;

x = min(room_width-sz/2, x)
y = min(room_height-szh/2, y)

x = max(sz/2, x)
y = max(szh/2, y)

camera_set_view_size(view_camera[0], sz, szh)
camera_set_view_pos(view_camera[0], x-sz/2, y-szh/2)
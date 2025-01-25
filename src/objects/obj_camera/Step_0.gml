if !instance_exists(obj_player)
	exit;


if !inizioPartita
{
	xmin-=150;
	xmax+=150;
	inizioPartita = true;
}

if instance_exists(obj_bolla)
{
	if obj_bolla.raggio < 60
		gosz = 320;
	else
		gosz = obj_bolla.raggio * 5;
}

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
if !instance_exists(obj_player)
	exit;



with obj_player
{
	if x > other.xmax || other.xmax =-1
		other.xmax = x;
	if x < other.xmin || other.xmin =-1
		other.xmin = x;
	if y > other.ymax || other.ymax =-1
		other.ymax = y;
	if y < other.ymin || other.ymin =-1
		other.ymin = y;
}

if !inizioPartita
{
	xmin-=150;
	xmax+=150;
	ymin-=120;
	ymax+=65;
	inizioPartita = true;
}

//xmin = max(xmin, 320/2)
//xmax = min(xmax, room_width-320/2)
//ymin = max(ymin, 180/2)
//ymax = min(ymax, room_height-180/2)

gosz = max(xmax-xmin, (ymax-ymin)/180*320);
gosz = clamp(gosz, 320, 640);


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
y = (ymin+ymax)/2;

x = min(room_width-sz/2, x)
y = min(room_height-szh/2, y)

x = max(sz/2, x)
y = max(szh/2, y)

camera_set_view_size(view_camera[0], sz, szh)
camera_set_view_pos(view_camera[0], x-sz/2, y-szh/2)
if !bollato
{
	hSp = 2*dir;
	vSp = 0;
}
else
{
	hSp = 0;
	vSp = -1;
}
x += hSp;
y += vSp;

if dir = -1
{
	if x < obj_camera.xmin-30
		instance_destroy();
}
else if dir = 1
{
	if x > obj_camera.xmax+30
		instance_destroy();
}

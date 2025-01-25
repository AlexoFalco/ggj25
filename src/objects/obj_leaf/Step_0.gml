if !bollato
{
vSp = grv;
hSp = 0.5*dir;
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
	if x < -30
		instance_destroy();
}
else if dir = 1
{
	if x > room_width + 30
		instance_destroy();
}

if y > room_height-30
	instance_destroy();
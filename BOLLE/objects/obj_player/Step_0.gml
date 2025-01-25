horMov = dxHold - sxHold;
hSp = horMov*4;
x += hSp;
with obj_camera
	other.x = clamp(other.x,xmin+10,xmax-10);


if confirmPress
{
	var b = instance_create_depth(x,y,depth,obj_projectile);
	with b
	{
		player = other.player;	
	}
}
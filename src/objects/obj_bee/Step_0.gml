if !con.pausato
{
	if !bollato
	{
		hSp = constant_move_speed*dir;
		vSp = 0;
	}
	else
	{
		hSp = 0;
		vSp = -1;
	}
	x += hSp;
	y += vSp;
	
	image_xscale = sign(hSp)

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
}

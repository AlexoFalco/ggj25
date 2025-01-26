if !con.pausato
{
	if (stop_wind)
	{
		speed_gravity = lerp(speed_gravity, 1, 0.05)
		y+=speed_gravity
		speed = lerp(speed, 0, 0.05)
		x-=dsin(stop_wind_count*(2+3*random(1)))
		stop_wind_count+=1
		image_alpha-=0.05
	}
	else
	{
		image_alpha+=0.05
	}
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

	if y > 630
		instance_destroy();
}
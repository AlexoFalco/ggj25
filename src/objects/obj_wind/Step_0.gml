with obj_parent
{
	if seMove
	{
		if other.alarm[0] > 0
		{
			x -= other.blowDirection*other.blowStrength;
		}
	}
}

if (alarm[0] > 0)
{
	var _rand= irandom(10)
	if (_rand == 0)
	{
		var _vX = camera_get_view_x(view_camera[0]) + (blowDirection == -1 ? camera_get_view_width(view_camera[0]) : 0);
		var _vY = camera_get_view_y(view_camera[0]), 
		var startX = _vX + choose(10, 20, 30, 40) * sign(blowDirection),
		var startY = _vY + choose(0,10,30,50)
		
		_l = instance_create_depth(startX,startY,-50,obj_leaf);

		_l.dir = blowDirection
	}
}
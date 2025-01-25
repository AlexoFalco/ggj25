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

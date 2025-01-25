with obj_wind
{
	other.hSp = blowDirection*0.5;
}

x += hSp;

if y > 0
	y -= vSp;
else
	instance_destroy();


with obj_enemy
{
	if place_meeting(x,y,other) && !bollato
	{
		bollato = true;
		instance_destroy(other);
	}
}
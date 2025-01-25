
if alarm[0] = -1 //se non sta sparando
{
	horMov = dxHold - sxHold;
	hSp = horMov*4;
	x += hSp;
	if hSp != 0
	{
		sprite_index = spr_player_walk;
		image_xscale = sign(hSp);
	}
	else
		sprite_index = spr_player;
}


with obj_camera
	other.x = clamp(other.x,xmin+10,xmax-10);


if confirmPress
{
	var b = instance_create_depth(x,y-30,depth,obj_player_proiettile);
	sprite_index = spr_player_fire;
	alarm[0] = 30;
	with b
	{
		player = other.player;	
	}
}
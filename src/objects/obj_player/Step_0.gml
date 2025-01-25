horMov = dxHold - sxHold;
inputDirection = point_direction(0,0,(horMov),0);
inputMagnitude = (horMov != 0);

script_execute(playerStato);


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
horMov = dxHold - sxHold;
inputDirection = point_direction(0,0,(horMov),0);
inputMagnitude = (horMov != 0);


//if (is_shot == false)
//{
//	if (dxHold)
//	{
//		horMov = 1
//		dir = 1
//	}
//	else if (sxHold)
//	{
//		horMov = -1
//		dir = -1
//	}
//	else
//	{
//		horMov = dir * lerp(abs(horMov), 0, 0.2)
//		if (abs(horMov) < 0.2)
//		{
//			horMov = 0
//			is_move = false
//		}
//	}
//}
	

//if (is_shot)
//{
//	horMov = dir * lerp(abs(horMov), 0, 0.2)
//}

//if (abs(horMov) > 0 and is_shot == false)
//{
//	is_move = true
//}

	
//hSp = horMov*constants_move;

////esecuzione fisica
//x += hSp;

////macchina a stati per le animazioni
//if (is_shot == false)
//{
//	if (is_move)
//	{
//		sprite_index = spr_player_walk;
//		image_xscale = sign(dir);
//	}
//	else
//	{
//		sprite_index = spr_player;
//	}
//}
if !con.pausato && !con.gameover
{
	script_execute(playerStato);
}
else
{
	image_index = spr_player
	image_speed = 0
}	


x = clamp(x, obj_camera.xmin, obj_camera.xmax);

//with obj_camera
//	other.x = clamp(other.x,xmin+10,xmax-10);


//if confirmPress
//{
//	var b = instance_create_depth(x,y-30,depth,obj_player_proiettile);
//	sprite_index = spr_player_fire;
//	image_index = 0
//	is_shot = true
//	is_move = false
//	with b
//	{
//		player = other.player;	
//	}
//}
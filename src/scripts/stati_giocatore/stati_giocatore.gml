function stateIdle(){

	sprite_index = spr_player;
	
	if (horMov != 0)
	{
		setWalk()
	}
	else if confirmPress
	{
		setShot()
	}

}

function stateSlide(){
	
	hSp = lengthdir_x(constant_slide_speed,direction);
	if horMov != 0
	{
		hdir = sign(hSp);
	}
	
	sprite_index = spr_player_slide;
	
	x += hSp; 
	
	if confirmPress
	{
		var b = instance_create_depth(x,y-30,depth,obj_player_proiettile);
		audio_play_sound(sfx_player_fire, 1, false, 1, 0, random_range(0.9, 1.1));
	}
	
}

function stateShot(){
}


function stateWalk(){
	
	if (dxHold)
	{
		state_move_player = 1
	}
	else if (sxHold)
	{
		state_move_player = -1
	}
	else
	{
		state_move_player = lerp(state_move_player, 0, 0.2)
		if (abs(state_move_player) < 0.2)
		{
			state_move_player = 0
			setIdle()
		}
		horMov = state_move_player
	}
	if horMov != 0
	{
		sprite_index = spr_player_walk;
		image_xscale = sign(horMov);
		
		var _ind = floor(image_index);
		if (_ind == 0 or _ind == floor(image_number/2))
		{
			if (!obj_player.snd_iswalking)
			{
				snd_iswalking = true;
				instance_create_layer(x, y, "Instances", obj_water_ripple);
				var _sprind = choose(spr_water_splash_1, spr_water_splash_2);
				instance_create_layer(x, y, "Instances", obj_water_splash,
				{
					sprite_index : _sprind
				});
				//codice di Mad
				//audio_play_sound(choose(sfx_player_walk_0, sfx_player_walk_1, sfx_player_walk_2, sfx_player_walk_3), 1, false);
				parte_audio(global.sfx,choose(sfx_player_walk_0, sfx_player_walk_1, sfx_player_walk_2, sfx_player_walk_3), 1, false);
			}
		}
		else snd_iswalking = false;
	}
			
	x += horMov * constant_move_speed;
	if inputMagnitude != 0
	{
		direction = inputDirection;
	}
	
	if backPress || downPress
	{
		moveDistanceRemaining = 60;
		instance_create_layer(x, y, "Instances", obj_water_ripple);
		instance_create_layer(x, y, "Instances", obj_water_splash);
		setSlide()
	}
	else if confirmPress
	{
		setShot()
	}
}
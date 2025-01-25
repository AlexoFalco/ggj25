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
	}
			
	x += horMov * constant_move_speed;
	if inputMagnitude != 0
	{
		direction = inputDirection;
	}
	
	if backPress || downPress
	{
		moveDistanceRemaining = 60;
		setSlide()
	}
	else if confirmPress
	{
		setShot()
	}
}
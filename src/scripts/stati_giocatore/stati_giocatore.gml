function stateIdle(){
	if alarm[0] = -1 //se non sta sparando
	{
		hSp = horMov*4;
		x += hSp;
		if hSp != 0
		{
			sprite_index = spr_player_walk;
			image_xscale = sign(hSp);
		}
		else
			sprite_index = spr_player;
			
		if inputMagnitude != 0
		{
			direction = inputDirection;
		}
		if horMov != 0
		{
			hdir = sign(hSp);
		}
			
		if backPress || downPress
		{
			moveDistanceRemaining = 60;
			playerStato = stateSlide;
		}
	}

}

function stateSlide(){
	var _vel = 4;
	
	hSp = lengthdir_x(_vel,direction);
	//vSp = lengthdir_y(_vel,direction);
	if horMov != 0
	{
		hdir = sign(hSp);
	}
	
	sprite_index = spr_player_slide;
	
	moveDistanceRemaining = max(0,moveDistanceRemaining-_vel);
	//show_message(moveDistanceRemaining);
	if moveDistanceRemaining <= 0
	{
		playerStato = stateIdle;
	}
	x += hSp;
	
}
con = obj_control;
//player = con.playerbirth;
horMov = 0;	
verMov = 0;
dir = 1


state_move_player = 0
constant_move_speed = 1.5
constant_slide_speed = 4

horMov = 0;	verMov = 0;

playerStato = stateIdle;

flag_first_state = false

enum PLAYERSTATE
{
	IDLE,
	SLIDE,
	WALK,
	SHOT
};

playerScript[PLAYERSTATE.IDLE] = stateIdle;
playerScript[PLAYERSTATE.SLIDE] = stateSlide;
playerScript[PLAYERSTATE.WALK] = stateWalk;
playerScript[PLAYERSTATE.SHOT] = stateShot;

setIdle = function()
{
	playerStato = stateIdle;
	image_index = 0
}

setSlide = function()
{
	audio_play_sound(sfx_player_slide, 1, false);
	playerStato = stateSlide;
	image_index = 0
}

setWalk = function()
{
	playerStato = stateWalk;
	image_index = 0
}

setShot = function()
{
	playerStato = stateShot;
	var b = instance_create_depth(x,y-30,depth,obj_player_proiettile);
	//codice di Mad
	//audio_play_sound(sfx_player_fire, 1, false, 1, 0, random_range(0.9, 1.1));
	parte_audio(global.sfx,sfx_player_fire, 1, false, random_range(0.9, 1.1),1,0);
	sprite_index = spr_player_fire;
	image_index = 0
	is_shot = true
	is_move = false
	with b
	{
		player = other.player;	
	}
}



snd_iswalking = false;

instance_create_depth(x, y, depth+1, obj_aim);
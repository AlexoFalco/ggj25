event_inherited();
//player = con.playerbirth;
horMov = 0;	verMov = 0;

playerStato = stateIdle;

enum PLAYERSTATE
{
	IDLE,
	SLIDE
};

playerScript[PLAYERSTATE.IDLE] = stateIdle;
playerScript[PLAYERSTATE.SLIDE] = stateSlide;
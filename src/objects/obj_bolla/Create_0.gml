/// @description 
con = obj_control;

raggio = 4;
figli = [];
n_figli = 0;
distanzadalcentro = 0;
rotazione = 0;

margine = 6

constant_bounce_strong = 0.2
constant_gravity = 0.1
constant_inpulse_shot = 0.8

state_vel_inpulse_shot = 0
state_angle_impulse_shot = 0
state_tremolio = 0

rotazione_vel = 0.3
raggio_incremento_passivo = 0.005
is_radice = false
is_first = false



bounce_strong = 0
surface_ref = noone

baricentro = noone
mediana_centro_figli = 0

uccididiscendenza = false;
_call = noone;

dest_count = 0;
waitinstab = 0;

set_random_bounce = function(_max)
{
	bounce_strong = random(_max) * choose(-1,1)
}

set_shot_inpulse = function()
{
	var parent = noone;
	with obj_bolla
	{
		if array_contains(figli, other.id)
		{
			parent = id;
		}
	}
	if parent = noone
		state_vel_inpulse_shot += constant_inpulse_shot
	else	
		parent.set_shot_inpulse();
}

get_instbilita_bolla = function(_n_figli, _is_radice, is_first)
{
	//0: stabile, nessun effetto (con figli pari a 1, 2)
	//1: poco stabile, lieve effetto (con figli pari a 3)
	//2: instabile prossima all'esplosione, effetto marcato(con figli pari a 0, 4)
	if (_n_figli == 0 and _is_radice and !is_first and waitinstab > 60) return 2
	var _k = _n_figli <=2 ? 0 : (_n_figli-2);
	return _k;
}
get_tremolio = function(_instabilita)
{	
	var _k = 0
	if (_instabilita == 1)
	_k = 1
	if (_instabilita == 2)
	_k = 3
	var _value = dsin(_k * current_time);
	if (_value > +0.3) _value = +1
	else if (_value < -0.3) _value = -1
	else _value = 0
	
	var _result =  _value
	//show_debug_message(_result)
	return _result
}

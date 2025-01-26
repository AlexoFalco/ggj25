/// @description 
con = obj_control;

raggio = 4;
figli = [];
distanzadalcentro = 0;
rotazione = 0;

margine = 6

constant_bounce_strong = 0.2
constant_gravity = 0.1
constant_inpulse_shot = 0.8

state_vel_inpulse_shot = 0
state_angle_impulse_shot = 0

rotazione_vel = 0.3
raggio_incremento_passivo = 0.005
is_radice = false

bounce_strong = 0
surface_ref = noone

baricentro = noone
mediana_centro_figli = 0

uccididiscendenza = false;
_call = noone;

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
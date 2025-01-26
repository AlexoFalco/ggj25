//obj_control.punteggio += id_score
parte_audio(global.sfx,sfx_bubble_pop,1,false);
parte_audio(global.sfx,sfx_bubble_add_wrong,1,false);

var _eff_ref = instance_create_depth(x,y,depth-1, obj_effect_bolla)
_eff_ref.raggio = raggio;

var n_figli = array_length(figli)
var i;
for (i = 0; i < n_figli; i+=1)
{
	figli[i].is_radice = true;
	figli[i].state_angle_impulse_shot = point_direction(other.x, other.y, x,y)
	figli[i].state_vel_inpulse_shot += constant_inpulse_shot;
}

if !is_radice
{
	with obj_bolla
	{	
		var numfiglio = array_get_index(figli, other.id)
		if numfiglio != -1
		{
			array_delete(figli, numfiglio, 1);
			instance_destroy();
		}
	}
}
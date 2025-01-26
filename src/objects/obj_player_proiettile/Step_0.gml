
if !con.pausato
{
	speed = 2;
	var is_coll = place_meeting(x, y, obj_bolla)
	if (is_coll and _best_bolla == noone)
	{
		var coll_count = collision_rectangle_list(x-1, y, x+1, y-1000, obj_bolla, true, true, list_collision, true)

		for(var i=0;i<coll_count;i+=1)
		{
			var _coll_item = ds_list_find_value(list_collision, i)
			var _item_distance = point_distance(x,y,_coll_item.x, _coll_item.y)
			if (_best_bolla == noone)
			{
				_best_bolla = _coll_item
			}
			else
			{
				var _best_distance = point_distance(x,y,_best_bolla.x, _best_bolla.y)
				if (_item_distance < _best_distance)
				{
					_best_bolla = _coll_item
				}
				else if (_item_distance == _best_distance)
				{
					if (_coll_item.raggio < _best_bolla.raggio)
					{
						_best_bolla = _coll_item
					}
				}
			}
		
		}
	}


	if instance_exists(_best_bolla)
	{
		move_towards_point(_best_bolla.x, _best_bolla.y, 2)
		if (point_distance(x,y,_best_bolla.x,_best_bolla.y) < _best_bolla.raggio*2)
		{
			obj_managerbolla.create_bolla(_best_bolla, x, y)
			var aa = point_direction(obj_player.x, obj_player.y, _best_bolla.x, _best_bolla.y)
			_best_bolla.state_angle_impulse_shot = aa*random(2)
			//codice di Mad
			//audio_play_sound(choose(sfx_bubble_hit_0, sfx_bubble_hit_1, sfx_bubble_hit_2), 1, false);
			//audio_play_sound(sfx_bubble_add, 1, false);
			//audio_play_sound(sfx_bubble_add_2, 1, false);
		
			parte_audio(global.sfx,choose(sfx_bubble_hit_0, sfx_bubble_hit_1, sfx_bubble_hit_2), 1, false);
			parte_audio(global.sfx,sfx_bubble_add, 1, false);
			parte_audio(global.sfx,sfx_bubble_add_2, 1, false);
			instance_destroy()
		}
	}
}


with obj_enemy
{
	if (place_meeting(x,y,other) and !bollato)
	{
		obj_control.punteggio += 500
		instance_create_depth(x,y,depth-1, obj_bolla_wrap)
		instance_destroy(other);
		instance_destroy();
	}
}

var is_coll = place_meeting(x, y, obj_bolla)

if (is_coll and _best_bolla == noone)
{
	var coll_count = collision_rectangle_list(x-4, y, x+4, y-1000, obj_bolla, true, true, list_collision, true)

	for(var i=0;i<coll_count;i+=1)
	{
		var _coll_item = ds_list_find_value(list_collision, i)
		var _has_figli = array_length(_coll_item.figli) > 0
		
		if (_best_bolla == noone)
		{
			_best_bolla = _coll_item;
			continue;
		}
		else
		{
			var _has_best_figli = array_length(_best_bolla.figli) > 0
			
			if (_has_best_figli and _has_figli)
			{
				if (_coll_item.raggio < _best_bolla.raggio )
				{
					_best_bolla = _coll_item
				}
				else
				{
					_best_bolla = list_collision[| 0]
				}
			}
			else if (_has_best_figli == false and _has_figli)
			{
				_best_bolla = _best_bolla
			}
			else if (_has_best_figli and _has_figli == false)
			{
				_best_bolla = _coll_item
			}
			else if (_has_best_figli == false and _has_figli == false)
			{
				if (_coll_item.raggio < _best_bolla.raggio )
				{
					_best_bolla = _coll_item
				}
				else
				{
					//_best_bolla = list_collision[| 0]
				}
			}
			
			
		}
	}
}

if (_best_bolla != noone)
{
	move_towards_point(_best_bolla.x, _best_bolla.y, 2)
	if (point_distance(x,y,_best_bolla.x,_best_bolla.y) < _best_bolla.raggio*2)
	{
		obj_managerbolla.create_bolla(_best_bolla, x, y)
		var aa = point_direction(obj_player.x, obj_player.y, _best_bolla.x, _best_bolla.y)
		obj_managerbolla.alberobolle.state_angle_impulse_shot = aa*random(2)
		audio_play_sound(choose(sfx_bubble_hit_0, sfx_bubble_hit_1, sfx_bubble_hit_2), 1, false);
		audio_play_sound(sfx_bubble_add, 1, false);
		audio_play_sound(sfx_bubble_add_2, 1, false);
		instance_destroy()
	}
}

return;

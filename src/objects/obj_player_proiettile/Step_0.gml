ds_list_clear(list_collision)
var is_coll = place_meeting(x, y, obj_bolla)

var _best_bolla = noone

if (is_coll)
{
	var coll_count = collision_line_list(x, y, x, y-100, obj_bolla, true, true, list_collision, true)
	
	if (coll_count == 1)
	{
		_best_bolla = ds_list_find_value(list_collision, 0)
	}
	else if (coll_count > 1)
	{
		for(var i = 0; i<coll_count;i+=1)
		{
			var _item = ds_list_find_value(list_collision, i)
			if (array_length(_item.figli) == 0)
			{
				if (_best_bolla == noone)
				{
					_best_bolla = _item
				}
				else
				{
					if (_item.y > _best_bolla.y)
					{
						_best_bolla = _item
					}
				}
			}
		}
	}
}
if (_best_bolla != noone)
{
	
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
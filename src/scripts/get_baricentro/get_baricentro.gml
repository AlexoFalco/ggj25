// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_baricentro(_array, _array_length){
	var _x = x
	var _y = y
	if (_array_length < 2)
	{
		return {
			x: _x,
			y: _y
		}
	}
	for(var i=0;i<_array_length;i+=1)
	{
		_x += _array[i].x
		_y += _array[i].y
	}
	return {
		x: _x/_array_length,
		y: _y/_array_length
	}
}
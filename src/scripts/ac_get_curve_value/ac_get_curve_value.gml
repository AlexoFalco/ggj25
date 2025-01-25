// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ac_get_curve_value(curve_id, value, _index = 0){
	var acRef = animcurve_get_channel(curve_id, _index)
	return animcurve_channel_evaluate(acRef,value)
}
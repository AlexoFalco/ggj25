scr_inizio_globale();
randomize();

global.terreno = 300
global.is_debug = false

alarm[8] = 10;

timer_foglie = 240;
timer_api = 120;
timer_vento = 300;


punteggio_add = function(_punteggio, xx = 0, yy = 0, low = true)
{
	instance_create_depth(xx, yy, depth-9999, obj_score_add,
	{
		text : _punteggio
	});
    punteggio += _punteggio
    parte_audio(global.sfx,low ? sfx_score_add_low : sfx_score_add_high, 1, false);
}


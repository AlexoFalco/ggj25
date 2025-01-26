scr_inizio_globale();

global.terreno = 300
global.is_debug = false

punteggio_add = function(_punteggio, low = true)
{
	punteggio += _punteggio
	parte_audio(global.sfx,low ? sfx_score_add_low : sfx_score_add_high, 1, false);
}
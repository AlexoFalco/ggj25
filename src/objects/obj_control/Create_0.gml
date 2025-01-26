scr_inizio_globale();

global.terreno = 300
global.is_debug = false

punteggio_add = function(_punteggio)
{
	punteggio += _punteggio
	parte_audio(global.sfx,sfx_score_add, 1, false);
}
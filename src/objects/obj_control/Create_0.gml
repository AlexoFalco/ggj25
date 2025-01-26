scr_inizio_globale();

global.terreno = 300
global.is_debug = false

alarm[8] = 10;

timer_foglie = 240;
timer_api = 120;
timer_vento = 300;


punteggio_add = function(_punteggio, low = true)
{
    punteggio += _punteggio
    parte_audio(global.sfx,low ? sfx_score_add_low : sfx_score_add_high, 1, false);
}
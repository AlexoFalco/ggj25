function partitaReset(){
gameover = false;
seleopzioni = 0;
selegameover = 0;
pausato = false;
punteggio = 0;
pp = 0;
giocatori_pronti = 0;
messaggio_eng = "";
messaggio_ita = "";
audio_stop_sound(tema_musicale);
tema_musicale = -1;
conta_api = 0;

{//allarmi in-game
	alarm[0] = 300; //vento
	alarm[1] = 120; //ape
	alarm[2] = 240; //foglia
}
}
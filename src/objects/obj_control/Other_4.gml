audio_stop_all()

if (room == rm_game)
{
	parte_audio(global.snd, ost_game, 1, true);
	parte_audio(global.sfx,choose(sfx_gnap_zig, sfx_gnap_1, sfx_gnap_2, sfx_gnap_3, sfx_gnap_0),1,false,,5);
}
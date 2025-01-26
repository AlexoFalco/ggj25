function scr_menu_pausa_step(){

if !impostazioni && pausePress && alarm[4] <= 0
	pausato = false;

if !impostazioni
{
{//cambio selezione
	if downPress
	{
		seleopzioni++;
		if seleopzioni > OPZIONIPAUSA.ESCI
			seleopzioni = OPZIONIPAUSA.CONTINUA;
	}
	else if upPress
	{
		seleopzioni--;
		if seleopzioni < OPZIONIPAUSA.CONTINUA
			seleopzioni = OPZIONIPAUSA.ESCI;
	}
	
	seleopzioni = seleopzioni+OPZIONIPAUSA.ESCI mod OPZIONIPAUSA.ESCI;
}

var _guix = display_get_gui_width(), _guiy = display_get_gui_height();

{//selezione fatta
	if confirmPress || mouse_check_button_pressed(mb_left)
	{
		parte_audio(global.sfx,sfx_bubble_pop,1,false);
		switch seleopzioni
		{
			case OPZIONIPAUSA.CONTINUA:
			{
				pausato = false;
				seleopzioni = 0;
			}
			break;
			case OPZIONIPAUSA.ESCI:
			{
				partita_iniziando = false;
				partitaReset();
				room_goto(rm_menu);
				impostazioni = false;
			}
			break;
			case OPZIONIPAUSA.RICOMINCIA:
			{
				partitaReset();
				room_restart();
				impostazioni = false;
			}
			break;
			case OPZIONIPAUSA.IMPOSTAZIONI:
			{
				impostazioni = true;	
			}
			break;
		}
	}
}
}
else if impostazioni
	scr_impostazioni_step();
}

function menu_pausa_draw(){
	var _guix = display_get_gui_width(), _guiy = display_get_gui_height(), 
	_colsel1 = c_white, _colsel2 = c_white, _colsel3 = c_white, _colsel0 = c_white,
	_buffini = 0, _rx = _guix/5, _ry = _guiy/4, _ingl, _itl;
	
	switch seleopzioni
	{
		case 0: {_colsel1 = c_white; _colsel2 = c_white; _colsel3 = c_white; _colsel0 = c_red;} break;
		case 1: {_colsel1 = c_red; _colsel2 = c_white; _colsel3 = c_white; _colsel0 = c_white;} break;
		case 2: {_colsel1 = c_white; _colsel2 = c_red; _colsel3 = c_white; _colsel0 = c_white;} break;
		case 3: {_colsel1 = c_white; _colsel2 = c_white; _colsel3 = c_red; _colsel0 = c_white;} break;
	}
	
	draw_set_alpha(0.7);
	draw_rectangle_color(_guix/2-100,_guiy/2-55,_guix/2+100,_guiy/2+115,#FFA3F5,#CCF9FF,#FFA3F5,#CCF9FF,false);
	draw_set_alpha(1);
	draw_rectangle_color(_guix/2-100,_guiy/2-55,_guix/2+100,_guiy/2+115,c_black,c_black,c_black,c_black,true);
	
	draw_text_border(_guix/2,	_guiy*3/8,	fnt_base,	"CONTINUE",	"CONTINUA",		_colsel0);
	draw_text_border(_guix/2,	_guiy*4/8,	fnt_base,	"RESTART",	"RICOMINCIA",	_colsel1);
	draw_text_border(_guix/2,	_guiy*5/8,	fnt_base,	"SETTINGS",	"IMPOSTAZIONI",	_colsel2);
	draw_text_border(_guix/2,	_guiy*6/8,	fnt_base,	"EXIT",		"ESCI",			_colsel3);
	
}

function scr_impostazioni_step()
{
	if regola_musica = false && regola_sfx = false && scrivendo = false
	{
		if upPress
		{
			selimpostazioni--;
			if selimpostazioni = IMPOST.NOME
				selimpostazioni--;
			if selimpostazioni < IMPOST.MUSICA
				selimpostazioni = IMPOST.FATTO;
		}
		else if downPress
		{
			selimpostazioni++;
			if selimpostazioni = IMPOST.NOME
				selimpostazioni++;
			if selimpostazioni > IMPOST.FATTO
				selimpostazioni = IMPOST.MUSICA;
		}
		else if dxPress
		{
			selimpostazioni++;
			if selimpostazioni = IMPOST.SFX
				selimpostazioni++;
			if selimpostazioni > IMPOST.FATTO
				selimpostazioni = IMPOST.MUSICA;
		}
		else if sxPress
		{
			selimpostazioni--;
			if selimpostazioni < IMPOST.MUSICA
				selimpostazioni = IMPOST.FATTO;
		}
		
		selimpostazioni = selimpostazioni+IMPOST.FATTO mod IMPOST.FATTO;
		
	
		if confirmPress
		{
			parte_audio(global.sfx,sfx_bubble_pop,1,false);
			switch selimpostazioni
			{
				case IMPOST.FATTO:
					impostazioni = false;
				break;
				case IMPOST.LINGUA:
				{
					if global.language = lang.eng
						global.language = lang.ita;
					else if global.language = lang.ita
						global.language = lang.eng;
					scr_lingua();
				}
				break;
				case IMPOST.MUSICA:
					regola_musica = true;
				break;
				case IMPOST.SFX:
					regola_sfx = true;
				break;
				case IMPOST.NOME:
				{
					scrivendo = true;
					keyboard_string = nome;
				}
				break;
				case IMPOST.FULLSCREEN:
				{
					if window_get_fullscreen()
						window_set_fullscreen(false);
					else
						window_set_fullscreen(true);
				}
				break;
			}
		}
		
		if backPress && !scrivendo && !regola_musica && !regola_sfx
			impostazioni = false;
	}
	else if scrivendo
	{
		scr_scrivinome();
	}
	else if regola_musica
	{
		if sxPress
			abbassa_musica();
		else if dxPress
			alza_musica();
		if confirmPress	
		{
			scr_salva_volume();
			regola_musica = false;
		}
	}
	else if regola_sfx
	{
		if sxPress
		{
			abbassa_effetti();
			parte_audio(global.sfx,sfx_bubble_pop,1,false);
		}
		else if dxPress
		{
			alza_effetti();
			parte_audio(global.sfx,sfx_bubble_pop,1,false);
		}
		if confirmPress
		{
			scr_salva_volume();
			regola_sfx = false;
		}
	}
}

function scr_impostazioni_draw()
{
	var _guix = display_get_gui_width(), _guiy = display_get_gui_height(),
	_sel1 = c_white, _sel2= c_white, _sel3= c_white, _sel4= c_white, _sel0 = c_white, _sel5= c_white, 
	_sel6= c_white, _sel7= c_white, bandiera, 
	_aiue, _aiui, _colai = c_green, _colnome = c_white, _fse, _fsi, _colfs = c_red;
	
	
	draw_set_alpha(0.5);
	draw_rectangle_color(90,20,_guix-90,_guiy-60,#FFA3F5,#CCF9FF,#FFA3F5,#CCF9FF,false);
	draw_set_alpha(1);
	draw_rectangle_color(90,20,_guix-90,_guiy-60,c_black,c_black,c_black,c_black,true);
	
	disegna_musica(_guix/3-90,70,130);
	
	switch selimpostazioni
	{
		case IMPOST.MUSICA:
		{
			_sel0 = c_red;	_sel1 = c_white; _sel2 = c_white; _sel3 = c_white; _sel4 = c_white;
			_sel5 = c_white; _sel6 = c_white; _sel7 = c_white;
		}
		break;
		case IMPOST.SFX:
		{
			_sel1 = c_red;	_sel0 = c_white; _sel2 = c_white; _sel3 = c_white; _sel4 = c_white;
			_sel5 = c_white; _sel6 = c_white; _sel7 = c_white;
		}
		break;
		case IMPOST.LINGUA:
		{
			_sel3 = c_red;	_sel1 = c_white; _sel0 = c_white; _sel2 = c_white; _sel4 = c_white;
			_sel5 = c_white; _sel6 = c_white; _sel7 = c_white;
		}
		break;
		case IMPOST.NOME:
		{
			_sel2 = c_red;	_sel1 = c_white; _sel3 = c_white; _sel0 = c_white; _sel4 = c_white;
			_sel5 = c_white; _sel6 = c_white; _sel7 = c_white;
		}
		break;
		case IMPOST.FULLSCREEN:
		{
			_sel5 = c_red;	_sel1 = c_white; _sel2 = c_white; _sel3 = c_white; _sel0 = c_white;
			_sel4 = c_white; _sel6 = c_white; _sel7 = c_white;
		}
		break;
		case IMPOST.FATTO:
		{
			_sel7 = c_red;	_sel1 = c_white; _sel2 = c_white; _sel3 = c_white; _sel0 = c_white;
			_sel5 = c_white; _sel6 = c_white; _sel4 = c_white;
		}
		break;
		
	}
	
	switch global.language
	{
		case lang.eng: bandiera = 0; break;
		case lang.ita: bandiera = 1; break;
	}
	draw_sprite_ext(spr_lingua,bandiera,_guix/2,200,0.25,0.25,0,c_white,1);
	
	
	if window_get_fullscreen()
	{
		_fse = "ON";
		_fsi = "ATTIVA";
		_colfs = c_green;
	}
	else
	{
		_fse = "OFF";
		_fsi = "DISATTIVA";
		_colfs = c_red;
	}
	
	
	
	draw_text_border(_guix/3,30,fnt_base,"Music", "Musica",_sel0);
	draw_text_border(_guix/3,90,fnt_base,"Sound effects", "Effetti sonori",_sel1);
	draw_text_border(2*_guix/3,30,fnt_base,"Name", "Nome",_sel2);
	draw_text_border(_guix/2,150,fnt_base,"Language", "Lingua",_sel3);
	draw_text_border(_guix/2,230,fnt_base,"Full screen mode", "Modalità schermo intero",_sel5);
	draw_text_border(_guix/2,280,fnt_base,"Done", "Fatto",_sel7);
	draw_text_border(_guix/2,250,fnt_base,_fse,_fsi,_colfs);
	
	
	if scrivendo
	{
		_colnome = c_green;
		draw_text_border(2*_guix/3,90,fnt_base,"Enter = Confirm", "Invio = Conferma",,,,,300);
		draw_text_border(2*_guix/3,120,fnt_base,"Max 15 characters", "Massimo 15 lettere",,,,,300);
	}
	draw_text_border(2*_guix/3,60,fnt_base,nome,,_colnome);
	
	{//debug
	//draw_text_border(30,30,fnt_base,$"{regola_musica},{regola_sfx}");
	}
	
	
	
	
}
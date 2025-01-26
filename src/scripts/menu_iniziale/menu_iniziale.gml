function scr_menuiniziale_step(){

if !menugiocatori && !impostazioni && !instance_exists(obj_highscore) && !riconoscimenti && !prima_registrazione && !tutorial
{
	if downPress
	{
		selemenu++;
		if selemenu > MENUINIZIALE.ESCI
			selemenu = MENUINIZIALE.GIOCA;
	}
	else if upPress
	{
		selemenu--;
		if selemenu < MENUINIZIALE.GIOCA
			selemenu = MENUINIZIALE.ESCI;
	}

	if confirmPress
	{
		parte_audio(global.sfx,sfx_bubble_pop,1,false);
		switch selemenu
		{
			case MENUINIZIALE.GIOCA:
			{
				if !file_exists("gnap.sav") || (file_exists("gnap.sav") && versione = "1.0.0.0")
				{
					prima_registrazione = true;
					scrivendo = true;
					keyboard_string = nome;
				}
				else
				{
					room_goto(rm_game);
					parte_audio(global.sfx,choose(sfx_gnap_zig, sfx_gnap_1, sfx_gnap_2, sfx_gnap_3, sfx_gnap_0),1,false,,5)
				}
			}
			break;
			case MENUINIZIALE.HOWTOPLAY:
				tutorial = true;
			break;
			case MENUINIZIALE.RECORD:
				instance_create_depth(0,0,0,obj_highscore);
			break;
			case MENUINIZIALE.IMPOSTAZIONI:
				impostazioni = true;
			break;
			case MENUINIZIALE.RICONOSCIMENTI:
				riconoscimenti = true;
			break;
			case MENUINIZIALE.ESCI:
				game_end();
		}
	}
}
else if impostazioni
	scr_impostazioni_step();
//else if menugiocatori
//{
//	menu_giocatori_step();
//}
else if riconoscimenti
{
	if (backPress || confirmPress || pausePress)
		riconoscimenti = false;
}
else if instance_exists(obj_highscore)
{
	if backPress || confirmPress
		instance_destroy(obj_highscore);
}
else if prima_registrazione
{
	{
		scr_scrivinome();
		
		if pausePress && keyboard_string != ""
		{
			scrivendo = false;
			parte_audio(global.sfx,choose(sfx_gnap_zig, sfx_gnap_1, sfx_gnap_2, sfx_gnap_3, sfx_gnap_0),1,false,,5)
			room_goto(rm_game);
			prima_registrazione = false;
		}
			
	}
}

else if tutorial
{
	if (backPress || confirmPress || pausePress)
		tutorial = false;
}

}

function scr_menuiniziale_draw(){
var _guix = display_get_gui_width(), _guiy = display_get_gui_height();
if !menugiocatori && !impostazioni && !instance_exists(obj_highscore) && !riconoscimenti && !prima_registrazione && !tutorial
{
	var _inmen1, _inmen2, _inmen3, _inmen4, _inmen5, _inmen0;
	switch selemenu
	{
		case MENUINIZIALE.GIOCA:
		{
			_inmen0 = c_red;	_inmen1 = c_white; _inmen2 = c_white; _inmen3 = c_white; _inmen4 = c_white; _inmen5 = c_white;
		}
		break;
		case MENUINIZIALE.RECORD:
		{
			_inmen1 = c_red;	_inmen0 = c_white; _inmen2 = c_white; _inmen3 = c_white; _inmen4 = c_white; _inmen5 = c_white;
		}
		break;
		case MENUINIZIALE.IMPOSTAZIONI:
		{
			_inmen2 = c_red;	_inmen1 = c_white; _inmen0 = c_white; _inmen3 = c_white; _inmen4 = c_white; _inmen5 = c_white;
		}
		break;
		case MENUINIZIALE.RICONOSCIMENTI:
		{
			_inmen3 = c_red;	_inmen1 = c_white; _inmen2 = c_white; _inmen0 = c_white; _inmen4 = c_white; _inmen5 = c_white;
		}
		break;
		case MENUINIZIALE.ESCI:
		{
			_inmen4 = c_red;	_inmen1 = c_white; _inmen2 = c_white; _inmen3 = c_white; _inmen0 = c_white; _inmen5 = c_white;
		}
		break;	
		case MENUINIZIALE.HOWTOPLAY:
		{
			_inmen4 = c_white;	_inmen1 = c_white; _inmen2 = c_white; _inmen3 = c_white; _inmen0 = c_white; _inmen5 = c_red;
		}
		break;
	}
	draw_text_border(_guix*15/16,90,fnt_base,"Play", "Gioca",_inmen0,,,,,fa_right);
	draw_text_border(_guix*15/16,120,fnt_base,"How to Play", "Come si gioca",_inmen5,,,,,fa_right);
	draw_text_border(_guix*15/16,150,fnt_base,"Leaderboard", "Classifica",_inmen1,,,,,fa_right);
	draw_text_border(_guix*15/16,180,fnt_base,"Settings", "Impostazioni",_inmen2,,,,,fa_right);
	draw_text_border(_guix*15/16,210,fnt_base,"Credits", "Riconoscimenti",_inmen3,,,,,fa_right);
	draw_text_border(_guix*15/16,240,fnt_base,"Exit game", "Esci dal gioco",_inmen4,,,,,fa_right);
}
else if riconoscimenti
{
	riconoscimenti_draw();
}
else if prima_registrazione
{
	registrazione_draw();
}
else if tutorial
{
	tutorial_draw();	
}

}

function tutorial_draw(){
	
	var _teng = @"Welcome to Gnàp!
There are some bubbles in the sky. Press Z to shoot at them with your own bubbles: by doing so, you will create other bubbles onto them, and if you aim for the center, you will make big bubbles, and with big bubbles come big points!
But watch out! There are bees that can pop your bubbles. Shoot them down... or up, with your bubbles. Bubbles can also pop if enough stress is put onto them, like having too many 'child' bubbles inside them.
The games end when no bubbles are left.
Also, you can press the down arrow to slide like a Blue Bomber.",
	_tita = @"Benvenuto in Gnàp!
Il cielo è popolato dalle bolle. Premi Z per sparare ad esse con le tue bolle: così facendo, creerai altre bolle al loro interno, e se miri al centro riuscirai a fare bolle grandi che danno punteggi alti! 
Ma attenzione! Ci sono anche delle api che possono far scoppiare le tue bolle. Puoi farle andare via sparandole contro. Inoltre, le bolle possono scoppiare anche quando sono sottoposte a stress, come avere troppe bolle 'figlie' al proprio interno.
Il gioco finisce quando tutte le bolle sono scoppiate.
Ah, puoi premere freccia giù per scivolare come un Blue Bomber.", 
	_guix = display_get_gui_width(), _guiy = display_get_gui_height();

	draw_text_border(_guix/2,_guiy*3/5,fnt_tutorial,_teng,_tita,,,,,500)
	
}

function registrazione_draw(){
	var _guix = display_get_gui_width(), _guiy = display_get_gui_height(), _colnome = c_white;
	draw_text_border(_guix/2, _guiy/3,fnt_base,"Write down your name, then press Enter to get in action!","Scrivi il tuo nome, poi premi Invio per entrare in azione!");
	if scrivendo
	{
		_colnome = c_green;
		draw_text_border(_guix/2,_guiy*2/3,fnt_base,"Enter = Confirm", "Invio = Conferma",,,,,300);
		draw_text_border(_guix/2,_guiy*2/3+30,fnt_base,"Max 15 characters", "Massimo 15 lettere",,,,,300);
	}
	draw_text_border(_guix/2,_guiy*2/3-30,fnt_base,nome,,_colnome);
}

function menu_giocatori_step()
{
	//if !numgioselez
	//{
	//	if upPress
	//	{
	//		numgio--;
	//		if numgio < 1
	//			numgio = 4;
	//	}
	//	else if downPress
	//	{
	//		numgio++;
	//		if numgio > 4
	//			numgio = 1;
	//	}
	//	if confirmPress
	//	{
	//		parte_audio(global.sfx,sfx_bubble_pop,1,false);
	//		NumGiocatori = numgio;
	//		var _pc2, _pc3, _pc4;
	//		if NumGiocatori = 4
	//		{
	//			playerbirth = 4;
	//			_pc4 = instance_create_depth(x,y,depth,obj_playercontrol);
	//			with _pc4
	//			{
	//				player = obj_control.playerbirth;
	//				scr_comandi();
	//			}
	//			playerbirth = noone;
	//		}
	//		if NumGiocatori >= 3
	//		{
	//			playerbirth = 3;
	//			_pc3 = instance_create_depth(x,y,depth,obj_playercontrol);
	//			with _pc3
	//			{
	//				player = obj_control.playerbirth;
	//				scr_comandi();
	//			}
	//			playerbirth = noone;
	//			if NumGiocatori = 3
	//			{
	//				with obj_playercontrol
	//				{
	//					if player > 3
	//					{
	//						instance_destroy();
	//					}
	//				}
	//			}
	//		}
	//		if NumGiocatori >= 2
	//		{
	//			playerbirth = 2;
	//			_pc2 = instance_create_depth(x,y,depth,obj_playercontrol);
	//			with _pc2
	//			{
	//				player = obj_control.playerbirth;
	//				scr_comandi();
	//			}
	//			playerbirth = noone;
	//			if NumGiocatori = 2
	//			{
	//				with obj_playercontrol
	//				{
	//					if player > 2
	//					{
	//						instance_destroy();
	//					}
	//				}
	//			}
	//		}
	//		if NumGiocatori = 1
	//		{
	//			with obj_playercontrol
	//			{
	//				if player > 1
	//				{
	//					instance_destroy();
	//				}
	//			}
	//		}
	//		numgioselez = true;
	//	}
	//	if backPress
	//		menugiocatori = false;
	//}
	//else
	//{
	//	if pausa
	//	{
	//		if !partita_iniziando && giocatori_pronti = NumGiocatori
	//		{
	//			partita_iniziando = true;
	//			parte_audio(global.sfx,sfx_inizio,1,false);
	//		}
	//	}
	//	if backPress
	//	{
	//		numgioselez = false;
	//		with obj_playercontrol
	//		{
	//			if player > 1
	//			{
	//				con.NumGiocatori--;
	//				instance_destroy();
	//			}
	//			else
	//			{	
	//				pg_selezionato = false;
	//			}
	//		}
	//		con.giocatori_pronti = 0;
	//	}
	//}
}

function riconoscimenti_draw(){
	var _guix = display_get_gui_width(), _guiy = display_get_gui_height();
	draw_text_border(_guix*15/16,_guiy/2,fnt_base,
	@"Developers: 
	MyMadnessWorks (Ivan Zanotti)
	AlexoFalco (Alessandro Falconi)
	Goldensun (Aurelio D'Amelio)
	Zigoon (Marco Luigi D'Amelio)
	
	Fonts:
	'Super Bubble' by fsuarez913
	'Power Red & Green'",,,,1,,1000,fa_right);
	
}
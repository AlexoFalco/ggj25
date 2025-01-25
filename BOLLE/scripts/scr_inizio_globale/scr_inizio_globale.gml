function scr_inizio_globale()
{
	randomize();
	test = false;
	versione = "0.0.0";
	con = obj_control;
	
	{//lingua
		enum lang 
		{
			eng,
			ita
		};
		global.language = lang.ita;
	}

	{//volume e mobile
		scr_volume_crea();
		smartphone = noone;
	}

	{//digitare il nome
		scrivendo = false;
	
		notset = irandom(100000);
		if !test
			keyboard_string = "Name" + string(notset);
		else
			keyboard_string = "Zigoon";
		nome = keyboard_string;
	}

	{//achievement
		//achievement_create();
	}

	{//impostazioni iniziali giocatore
	
		player = 0;
		if !instance_exists(obj_playercontrol)
		{
			playerbirth = 1;
			var _pc1 = instance_create_depth(x,y,depth,obj_playercontrol);
			with _pc1
			{
				player = other.playerbirth;
				scr_comandi();
			}
		}
		playerbirth = noone;
		NumGiocatori = 1;
		giocatori_pronti = 0;
	}

	{//salvataggio
		caricato = false;	
	}
		
	{//gameplay
		gameover = false;
		pausato = false;
		partita_iniziando = false;
		tema_musicale = -1;
		
		{//menu principale
			premuto_per_iniziare = false;
			selemenu = 0;
			menugiocatori = false;
			numgio = 1;
			numgioselez = false;
			riconoscimenti = false;
		}
		
		{//menu di pausa
			seleopzioni = 0;
			selegameover = 0;
			impostazioni = false;
			selimpostazioni = 0;
			regola_musica = false;
			regola_sfx = false;
		}
		
		{//punteggi e record
			punteggio = 0;
			record[1] = 0;
			record[2] = 0;
			record[3] = 0;
			record[4] = 0;	
		}
		

	}
}
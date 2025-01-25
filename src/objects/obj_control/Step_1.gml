switch(os_type)
{
	case os_windows: global.Config = 0; break;
	case os_android: global.Config = 1; break;
	case os_linux: global.Config = 2; break;
	case os_macosx: global.Config = 3; break;
	case os_ios: global.Config = 4; break;
	case os_winphone: global.Config = 5; break;	
}

scr_comandi();
scr_mobile();
//scr_volume_bstep();

if !caricato
	scr_carico();
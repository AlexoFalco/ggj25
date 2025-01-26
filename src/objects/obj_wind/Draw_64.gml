var _windeng, _windita, _direng, _dirita;

if blowDirection = -1
{
	_direng = "west";	_dirita = "ovest";
}
else
{
	_direng = "east";	_dirita = "est";
}

switch blowStrength
{
	case 1.2:
	{
		_windeng = "Weak";	_windita = "debole";
	}
	break;
	case 1.4:
	{
		_windeng = "Moderate";	_windita = "moderato";
	}
	break;
	case 1.6:
	{
		_windeng = "Strong";	_windita = "forte";
	}
	break;
	case 3:
	{
		_windeng = "Very strong";	_windita = "molto forte";
	}
	break;
	default:
	{
		_windeng ="Forza: "+string(blowStrength);	_windita = "Forza: "+string(blowStrength);
	}
	break;
}

//draw_text_border(display_get_gui_width()/2,display_get_gui_height()/8,fnt_base,$"{_windeng} wind from {_direng}", $"Vento {_windita} da {_dirita}",c_white);
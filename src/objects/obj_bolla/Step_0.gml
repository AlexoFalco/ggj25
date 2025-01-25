/// @description 
image_xscale = raggio/8;
image_yscale = raggio/8;
var n_figli = array_length(figli)
var i;

baricentro = {
	x : x,
	y : y
}

//in caso di collisioni tra bolle fratelle bisogna mettere delle distanze

distanzadalcentro = 0
mediana_centro_figli = 0
for (i = 0; i < n_figli; i+=1)
{
	if n_figli > 1
	{
		var figlio = figli[i];	
		var fratello1 = i > 1 ? figli[(i + 1) mod n_figli] : noone
		var fratello2 = i > 2 ? figli[(i + 2) mod n_figli] : noone
		
		with (figlio)
		{
			if place_meeting(other.baricentro.x,other.baricentro.y,fratello1)
			{
				distanzadalcentro+=1;
			}
			if place_meeting(other.baricentro.x,other.baricentro.y,fratello2)
			{
				distanzadalcentro+=1;
			}
			other.mediana_centro_figli+=raggio
		}
	}
}

mediana_centro_figli = mediana_centro_figli/n_figli

for (i = 0; i < n_figli; i+=1)
{
	var figlio = figli[i];	
	var fratello1 = i > 1 ? figli[(i + 1) mod n_figli] : noone
	var fratello2 = i > 2 ? figli[(i + 2) mod n_figli] : noone
	
	var distanzarandom_norm = rotazione/360
	var distanzarandom = (margine-1) * ac_get_curve_value(ac_bolla_raggiorandom, distanzarandom_norm)
		
	if n_figli = 1
	{
		figlio.x = x;
		figlio.y = y;
	}
	else
	{
		call_later(1, time_source_units_frames, method({padre: {baricentro: baricentro, n_figli: n_figli, rotazione: rotazione, distanzadalcentro: distanzadalcentro }, figlio: figlio, distanzarandom: distanzarandom, i: i}, function(){
			var raggionormalizzato = figlio.raggio
			var _target_x = padre.baricentro.x + lengthdir_x(raggionormalizzato + padre.distanzadalcentro + distanzarandom, 360/padre.n_figli* i + padre.rotazione);
			var _target_y = padre.baricentro.y + lengthdir_y(raggionormalizzato + padre.distanzadalcentro + distanzarandom, 360/padre.n_figli* i + padre.rotazione);
		
			figlio.x = lerp(figlio.x, _target_x, 0.05)
			figlio.y = lerp(figlio.y, _target_y, 0.05)
		}))
	}	
}

//calcolo raggio
var raggio_nuovo = 0
for (i = 0; i < n_figli; i+=1)
{
	var figlio = figli[i];	
	
	var distanzarandom_norm = rotazione/360
	var distanzarandom =0* (margine-1) * ac_get_curve_value(ac_bolla_raggiorandom, distanzarandom_norm)
	
	var margine_distanza = margine * ac_get_curve_value(ac_bolla_marginebydistanza, clamp(raggio/200, 0, 1))
	
	var raggio_dal_padre = point_distance(baricentro.x,baricentro.y,figlio.x, figlio.y)+figlio.raggio + margine_distanza;
	raggio_nuovo = max(raggio_nuovo, raggio_dal_padre)
}

if (n_figli > 0)
{
	raggio = lerp(raggio,raggio_nuovo, 0.05)
}
else
{
	raggio += raggio_incremento_passivo
}


if (is_radice)
{
	x +=sin(current_time/2000)/10
}

rotazione += rotazione_vel
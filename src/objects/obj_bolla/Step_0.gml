/// @description 
image_xscale = raggio/8;
image_yscale = raggio/8;
var n_figli = array_length(figli)
var i;

if (n_figli > 4)
{
	instance_destroy(figli[4]);
	for(var i=0;i<3;i+=1)
	{
		figli[i].set_random_bounce(2)
	}
	instance_destroy();
	return;
}

if (place_meeting(x,y,obj_player))
{
	uccididiscendenza = true
}
if y+raggio >= global.terreno
{
	uccididiscendenza = true;
}

if uccididiscendenza
{
	for (i = 0; i < n_figli; i+=1)
	{	
		figli[i].uccididiscendenza = true;
	}
	instance_destroy();

}


baricentro = {
	x : x,
	y : y
}
//baricentro = get_baricentro(figli, n_figli)

//in caso di collisioni tra bolle fratelle bisogna mettere delle distanze

var contatto = false;
	with obj_bolla
	{
		if other.is_radice && is_radice
		{
			if place_meeting(x,y,other)
			{
				other.speed = (raggio + other.raggio - point_distance(x,y,other.x, other.y))/10
				other.direction = point_direction(x,y,other.x, other.y)
				contatto = true;
			}
		}
	}
	if contatto = false
		speed = 0;

var minX = x, maxY = y, maxX = x, minY = y;
for (i = 0; i < n_figli; i+=1)
{	
	if figli[i].x - figli[i].raggio < minX
		minX = figli[i].x - figli[i].raggio;
		
	if figli[i].y - figli[i].raggio < minY
		minY = figli[i].y - figli[i].raggio;
		
	if figli[i].x + figli[i].raggio > maxX
		maxX = figli[i].x + figli[i].raggio;
		
	if figli[i].y + figli[i].raggio > maxY
		maxY = figli[i].y + figli[i].raggio;
}
var mediox = (maxX + minX)/2;
var medioy = (maxY + minY)/2;
var xdiff = mediox - x;
var ydiff = medioy - y;

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
		call_later(1, time_source_units_frames, method({padre: {baricentro: baricentro, n_figli: n_figli, rotazione: rotazione, distanzadalcentro: distanzadalcentro }, figlio: figlio, distanzarandom: distanzarandom, i: i, xdiff: xdiff, ydiff: ydiff}, function(){
			if instance_exists(figlio)
			{
				var raggionormalizzato = figlio.raggio
				var _target_x = padre.baricentro.x + lengthdir_x(raggionormalizzato + padre.distanzadalcentro + distanzarandom, 360/padre.n_figli* i + padre.rotazione);
				var _target_y = padre.baricentro.y + lengthdir_y(raggionormalizzato + padre.distanzadalcentro + distanzarandom, 360/padre.n_figli* i + padre.rotazione);
		
				figlio.x = lerp(figlio.x, _target_x, 0.05)-xdiff
				figlio.y = lerp(figlio.y, _target_y, 0.05)-ydiff
			}
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
	//raggio += raggio_incremento_passivo
}


if (is_radice)
{
	if (abs(bounce_strong))
	{
		bounce_strong = sign(bounce_strong) * lerp(abs(bounce_strong), 0, 0.05)
	}
	
	//var camera_ymin = camera_get_view_y(view_camera[0])
	if (x > obj_camera.xmax-20)
	{
		bounce_strong-=constant_bounce_strong
	}
	if (x < obj_camera.xmin+20)
	{
		bounce_strong+=constant_bounce_strong
	}
	if (y < global.soffitto+10)
	{
		state_vel_inpulse_shot = 0
	}
	
	y += constant_gravity - state_vel_inpulse_shot
	
	x += lengthdir_x(state_vel_inpulse_shot, state_angle_impulse_shot)
		 + sin(current_time/2000)/10 + bounce_strong
	
	y = clamp(y, global.soffitto + raggio, global.terreno - raggio)
	x = clamp(x, obj_camera.xmin, obj_camera.xmax)
	
}

rotazione += rotazione_vel * n_figli

state_vel_inpulse_shot = lerp(state_vel_inpulse_shot, 0, 0.02)

if instance_number(obj_bolla) > 1 && n_figli = 0 && is_radice
	dest_count++;
else
	dest_count = 0;

if dest_count > 300
	instance_destroy();
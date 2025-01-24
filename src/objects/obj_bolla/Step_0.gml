/// @description 
image_xscale = raggio/32;
image_yscale = raggio/32;
var n_figli = array_length(figli)
var i;
var minX = x;
var minY = y;
var maxX = x;
var maxY = y;
var distmax = raggio;
rotazione+=1;
for (i = 0; i < n_figli; i+=1)
{
	var figlio = figli[i];	
	var fratello;
	if i < n_figli-1
		fratello = figli[i+1];
	else
		fratello = figli[0];
		
	if n_figli = 1
	{
		figlio.x = x;
		figlio.y = y;
	}
	else
	{
		//angolo += 360*figlio.raggio/sommaraggi
		figlio.x = x+lengthdir_x(figlio.raggio+distanzadalcentro, 360/n_figli*i+rotazione);
		figlio.y = y+lengthdir_y(figlio.raggio+distanzadalcentro, 360/n_figli*i+rotazione);
		if n_figli > 1
		{
			with figlio
			{
				if place_meeting(x,y,fratello)
					other.distanzadalcentro+=1;
			}
		}
	}
	
	
	//if figli[i].x - figli[i].raggio < minX
	//	minX = figli[i].x - figli[i].raggio;
		
	//if figli[i].y - figli[i].raggio < minY
	//	minY = figli[i].y - figli[i].raggio;
		
	//if figli[i].x + figli[i].raggio > maxX
	//	maxX = figli[i].x + figli[i].raggio;
		
	//if figli[i].y + figli[i].raggio > maxY
	//	maxY = figli[i].y + figli[i].raggio;
	
	distmax = max(distmax, point_distance(x,y,figlio.x, figlio.y)+figlio.raggio+5)
	
}
if n_figli > 0
{
//x = round((maxX + minX) /2)
//y = round((maxY + minY) /2)
raggio = distmax //max((maxX - minX) /2, (maxY-minY)/2);
}
if n_figli = 0
raggio+=0.1
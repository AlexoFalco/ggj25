
///Questi script dovrebbero andare bene per tutti i giochi, se applicati nei giusti eventi di obj_control e se si ha cura di importante anche draw_text_border e spr_iconine

//Create
function scr_volume_crea(){
global.snd = false;
global.sfx = -1;
global.sfx2 = -1;
global.sndvol = 1;
global.sfxvol = 1;
global.tacchevol = 5;
}

//Begin Step
function scr_volume_bstep(){
audio_sound_gain(global.snd,global.sndvol,0);
audio_sound_gain(global.sfx,global.sfxvol,0);
audio_sound_gain(global.sfx2,global.sfxvol,0);
}

//Step
function musica_click(xx,yy,yy2){


if mouse_check_button_pressed(mb_left)
{
	if scr_clicca(xx,yy,16,16)
	{
		if global.sndvol < 1
			global.sndvol += 1/global.tacchevol;
		else
			global.sndvol = 0;
	}
	if scr_clicca(xx,yy2,16,16)
	{
		if global.sfxvol < 1
			global.sfxvol += 1/global.tacchevol;
		else
			global.sfxvol = 0;
	}
}
}

function abbassa_musica(){
if global.sndvol > 0
  {
    global.sndvol -= (1/global.tacchevol);  
  }
}

function abbassa_effetti(){
if global.sfxvol > 0
  {
    global.sfxvol -= (1/global.tacchevol);  
  }
}

function alza_musica(){
if global.sndvol < 1
  {
    global.sndvol+= (1/global.tacchevol);  
  }
}

function alza_effetti(){
if global.sfxvol < 1
  {
    global.sfxvol += 1/global.tacchevol;  
  }
}


function parte_audio(variabile,suono,priority,loops,pitch=1){//serve per sentire sia suoni che effetti sonori con il volume giusto, quindi a volume 0 non si sente niente per tutta la durata del brano
if variabile = global.snd
{
	global.snd = audio_play_sound(suono,priority,loops,,,pitch);
	audio_sound_gain(global.snd,global.sndvol,0);
}
else if variabile = global.sfx
{
	global.sfx = audio_play_sound(suono,priority,loops,,,pitch);
	audio_sound_gain(global.sfx,global.sfxvol,0);
}
}

//Draw
function disegna_musica(xx,yy,yy2=yy+30){
var w = c_white;		var r = c_red;		var gr = c_gray;
var v;	var col;


draw_set_font(fnt_base);
draw_set_halign(fa_left);
draw_set_color(c_teal);


var icow = sprite_get_width(spr_iconine)/2;
var iv;

for (iv = 0; iv < global.tacchevol + 1; iv+=1)
{
	if iv = 0
		sub = 0;
	else
		sub = 1;
	
	if iv < global.sndvol*(global.tacchevol + 1 )
	{
		col = w; 
	}
	else
		col = gr;
	
	draw_sprite_ext(spr_iconine,sub,xx,yy,1,1,0,col,1); //icone del volume della musica
	
	if iv < global.sfxvol*(global.tacchevol + 1 )
	{
		col = r; 
	}
	else
		col = gr;
	draw_sprite_ext(spr_iconine,sub,xx,yy2,1,1,0,col,1); //icone del volume degli effetti sonori
	
	
	if mouse_check_button_pressed(mb_left)
	{
		if scr_clicca(xx,yy,16,16)
		{
			global.sndvol = (iv)*0.2;
			global.sfx = audio_play_sound(sfx_bubble_pop,1,false);
			audio_sound_set_track_position(global.sfx,0.20);
			audio_sound_gain(global.sfx,global.sfxvol,0);
		}
		if scr_clicca(xx,yy2,16,16)
		{
			global.sfxvol = (iv)*0.2;
			global.sfx = audio_play_sound(sfx_bubble_pop,1,false);
			audio_sound_set_track_position(global.sfx,0.20);
			audio_sound_gain(global.sfx,global.sfxvol,0);
		}
	}
	xx += icow;
}


//draw_text_transformed(xx,yy,xeff,1,1,0);
}
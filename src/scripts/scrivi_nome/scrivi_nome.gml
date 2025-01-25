function scr_finenome_scrivendo(){
scrivendo = false;
nome = keyboard_string;
keyboard_string = nome;
scr_salva_nome();
}

function scr_finenome(){
scrivendo = false;
scr_salva_nome();
}

function scr_finenome_scelta(){
if scrivendo
	scr_finenome_scrivendo();
else
	scr_salva_nome();
}

function scr_scrivinome(){
	if scrivendo
		{
			if string_length(nome)<15
			{
				nome = keyboard_string;
			}
			else
			{
				if keyboard_check_pressed(vk_backspace)//|| string_length(keyboard_string) < 15
				{
					//keyboard_string = string_copy(nome, 1, 14);
					nome = string_copy(nome, 1, 13);
					keyboard_string = nome;
				}
				/*else
				{
					if keyboard_check_pressed(vk_anykey)
						keyboard_string = string_copy(nome,1,14);
				}*/
			}
			if keyboard_check_pressed(vk_enter)
			{
				scr_finenome();
				keyboard_virtual_hide();
			}
			
			var xnome = room_width/2;
			var ynome;
			if file_exists("gnap.sav")
			{
				if scrivendo && smartphone
					ynome = room_height/3+30;
				else
					ynome = 8*room_height/9;
			}
			else
			ynome = room_height/2;
			
			if sclick_sx
			{
				if scr_clicca(xnome+100,ynome,20,20)
				{
					scr_finenome();
				}
			}
			
		}
		else
		{
			keyboard_string = nome;
		}
	
}

function scr_casella_nome(){
var mr = #87480D;
var xnome = room_width/2;
var ynome;
if file_exists("gnap.sav")
	{
	if scrivendo && smartphone
		ynome = room_height/3+30;
	else
		ynome = 8*room_height/9;
}
else
	ynome = room_height/2;

draw_set_color(mr);
draw_rectangle(xnome-72,ynome-22,xnome+72,ynome+22,false);
draw_set_color(c_dkgray);
draw_rectangle(xnome-70,ynome-20,xnome+70,ynome+20,false);
draw_set_font(fnt_base);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_text_border(xnome-65,ynome,nome,mr);
draw_set_halign(fa_center);

draw_set_color(mr);
if scrivendo = true
{
	//if !smartphone
		//draw_text_outline(room_width/2,ynome-35,"Premi INVIO quando hai finito",c_teal,1,1,0);
	rettangolo_click(xnome+100,ynome,20,20,c_white,mr,mr,"OK");
}
else
{
	draw_set_font(global.fofont);
	var en, it;
		if smartphone
		 {
			en = "Click on the box to change your name!";
			it = "Clicca qui sotto per modificare il tuo nome!";
		 }
		else
		{
			en = "Click on the box or press [ENTER] to change your name!";
			it = "Clicca qui sotto o premi [INVIO] per modificare il tuo nome!";
		}
	if file_exists("gnap.sav")
		draw_text_border(room_width/2,ynome-40,fnt_base,en,it,c_white);
}
}

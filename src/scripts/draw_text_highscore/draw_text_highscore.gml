function draw_text_highscore(xx, yy, str, name, colour) {
	//
	// Script:      Draws a highscore with the player’s name coloured in green
	// Date:        2020-01-18
	// Copyright:   Appsurd
	var con = obj_control;
	
	draw_set_valign(fa_middle);
	draw_set_font(fnt_base);

	// Adjustable Parameters, if you need, you can change the values
	var sz = 2;
	// Initialise the drawing by splitting up the text
	
	var no_lines = string_count("|",str);
	var str2 = string_split("|",str,true);
	var str3,str3a,str3b,str3c,str3d,str3e;
	if global.language = lang.eng
		str3[0] = string("")+".--"+"Name"+"--"+"Score"+"--"+""+"--"+"Date";
	else if global.language = lang.ita
		str3[0] = string("")+".--"+"Nome"+"--"+"Punteggio"+"--"+""+"--"+"Data";
	for(var i=0; i<no_lines; i+=1)
	{
	    str3[i+1] = str2[i];
	}
	if room = rm_game
		str3[no_lines+1] = string("")+"--"+string(con.nome)+"--"+string(con.punteggio)+"--"+""+"--"+"Adesso";
	else
		str3[no_lines+1] = string("")+"--"+string(con.nome)+"--"+string(con.record[con.NumGiocatori])+"--"+""+"--"+"";
	
	// Splitting up the text into a part with the number (str3a), the name (str3b) and the score (str3c)
	// The output from the database is given by (Nr.-Name-Score)
	for(var i=0; i<=no_lines+1; i+=1)
	{
	    var str4 = string_split("--",str3[i],false);
	    str3a[i] = str4[0];
	    str3b[i] = str4[1];
	    str3c[i] = str4[2];
	    str3d[i] = str4[3];
	    str3e[i] = str4[4];
  
	    // Decode the name so we can use it (but do not decode the header containing "name" since it's not encoded!)
	    if (i != 0) && (i != no_lines+1)
	    {
	        str3b[i] = base64_decode(str3b[i]);
	        if str3c[i] = str3c[i-1] && str3c[i-1] != ""
	        {
	            str3a[i] = str3a[i-1];
	        }
	    }
  
	    // Assure that if a player has a \n in his name, then escape
	    str3b[i] = string_replace_all(str3b[i],"\\n","\\\\n");
  
	    // Adjust the width such that the text doesn't overlap
	    /*
	    max_la = max(string_width(str3a[i]),max_la);
	    max_lb = max(string_width(str3b[i]),max_lb);
	    max_lc = max(string_width(str3c[i]),max_lc);
	    */
	}

	str3a[0] = "";

	// The actual drawing of the highscores
	var height = 0;
	var gia = false;
	for(var i=0; i<=no_lines+1; i+=1)
	{
		if i = no_lines+1 && gia
			exit;
		if str3b[i] = con.nome && (str3c[i] == con.punteggio) || (str3c[i] == con.record[con.NumGiocatori])
		{
			gia = true;
		}
		
	    var h = string_height(string_hash_to_newline(str3[i]))*sz
	    draw_set_alpha(0.7)
	    if (name == str3b[i])
	    {
	        draw_set_colour($5B65CC);
	    }
	    else
	    {
	        draw_set_colour($C9FF9E);
	    }
	    draw_rectangle(40, yy+height-(h/2)-2,display_get_gui_width()-40, yy+height+(h/2)-4, false)
		
		
	    draw_set_alpha(1);
		draw_set_color(c_black);
	    if i > 0 
	    {
	        col = c_white;
	        //}
	    }
	    else
	    {
	        col = c_orange;
	    }
	    // Draw the numbers (1. 2. etc)
	    draw_set_halign(fa_right);
	        draw_text(display_get_gui_height()/2 - 100 - 10,yy+height,str3a[i]);
  
	    // Draw the name
	    draw_set_halign(fa_left);
	        draw_text(display_get_gui_height()/2 - 100, yy+height,str3b[i]);
			
	    // Draw the score
			draw_set_halign(fa_center);
	        draw_text(display_get_gui_height()/2 + 150, yy+height,string(str3c[i]));
    
	    // Draw the time
	    draw_text(display_get_gui_height()/2 + 325,yy+height,str3e[i]);
		
		if keyboard_check(vk_alt) && keyboard_check(vk_control) && keyboard_check(ord("P"))
			draw_text(display_get_gui_height()/2 + 275,yy+height,str3d[i]);
		
  
	    // Increment height
	    height += string_height(string_hash_to_newline(str3[i]))//*sz;
	}
}

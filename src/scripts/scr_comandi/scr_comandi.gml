function scr_comandi(){

	var tastoA, tastoB, tastoX, tastoY, tastoL1, tastoR1, tastoL2, tastoR2, tastoStart, tastoSelect,
	tastoAh, tastoBh, tastoXh, tastoYh, tastoL1h, tastoR1h, tastoL2h, tastoR2h, tastoStarth, tastoSelecth;

	switch player
	{
		case 0:
		case 1:
		default:
		{
			tastoAh = keyboard_check(ord("Z"));
			tastoBh = keyboard_check(ord("X"));
			tastoXh = keyboard_check(ord("C"));
			tastoYh = keyboard_check(ord("V"));
			tastoL1h = keyboard_check(ord("S"));
			tastoL2h = keyboard_check(ord("A"));
			tastoR1h = keyboard_check(ord("D"));
			tastoR2h = keyboard_check(ord("F"));
			tastoStarth = keyboard_check(vk_enter);
			tastoSelecth = keyboard_check(vk_space);
			tastoA = keyboard_check_pressed(ord("Z"));
			tastoB = keyboard_check_pressed(ord("X"));
			tastoX = keyboard_check_pressed(ord("C"));
			tastoY = keyboard_check_pressed(ord("V"));
			tastoL1 = keyboard_check_pressed(ord("S"));
			tastoL2 = keyboard_check_pressed(ord("A"));
			tastoR1 = keyboard_check_pressed(ord("D"));
			tastoR2 = keyboard_check_pressed(ord("F"));
			tastoStart = keyboard_check_pressed(vk_enter);
			tastoSelect = keyboard_check_pressed(vk_space);
		}
		break;
	}

	GP = gamepad_is_supported();
	gamepad_set_axis_deadzone(0,0.5)
	haxis = gamepad_axis_value(0, gp_axislh);
	vaxis = gamepad_axis_value(0, gp_axislv);
	
	dhaxis = gamepad_axis_value(0,gp_axisrh);
	dvaxis = gamepad_axis_value(0,gp_axisrv);

	sxHold = keyboard_check(vk_left) || gamepad_button_check(0,gp_padl)
	dxHold = keyboard_check(vk_right) || gamepad_button_check(0,gp_padr)
	sxPress = keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0,gp_padl)
	dxPress = keyboard_check_pressed(vk_right) || gamepad_button_check_pressed (0,gp_padr)

	downHold = keyboard_check(vk_down) || gamepad_button_check(0,gp_padd)
	upHold = keyboard_check(vk_up) || gamepad_button_check(0,gp_padu)
	downPress = keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0,gp_padd)
	upPress = keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0,gp_padu)
	
	triggerL = tastoL1 || gamepad_button_check_pressed(0,gp_shoulderlb)
	triggerR = tastoR1 || gamepad_button_check_pressed(0,gp_shoulderrb)
	triggerZ = tastoR1 || tastoR2 || gamepad_button_check_pressed(0,gp_shoulderr) || gamepad_button_check_pressed(0,gp_shoulderl);

	pausePress = tastoStart || gamepad_button_check_pressed(0,gp_face4) || gamepad_button_check_pressed (0,gp_start)
	pauseHold = tastoStarth || gamepad_button_check(0,gp_face4) || gamepad_button_check (0,gp_start)
	backPress = tastoB || gamepad_button_check_pressed(0,gp_face2) 
	backHold = tastoBh || gamepad_button_check(0,gp_face2)
	confirmPress = tastoA || gamepad_button_check_pressed(0,gp_face1) 
	confirmHold = tastoAh || gamepad_button_check(0,gp_face1)
	selectPress = tastoSelect || gamepad_button_check_pressed(0,gp_select)
	//magicoatt = keyboard_check_pressed(ord("C")) || gamepad_button_check_pressed(0,gp_face3);

	
	downRelease = keyboard_check_released(vk_down) || gamepad_button_check_released(0,gp_padd)
	confirmRelease = keyboard_check_released(vk_space) || gamepad_button_check_released(0,gp_face1)
	
	click_sx = mouse_check_button_pressed(mb_left);
	if obj_control.smartphone
		sclick_sx = mouse_check_button_released(mb_left);
	else
		sclick_sx = mouse_check_button_pressed(mb_left);

}
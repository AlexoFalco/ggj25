con = obj_control;

	
sz = 320;
gosz = sz;
szh = sz/320*180;
gox = x; goy= y;

	cam = camera_create_view(x-sz/2,y-szh/2,320,180);
	view_camera[0] = cam;
	
	
camera_set_view_size(view_camera[0], sz, szh)
camera_set_view_pos(view_camera[0], x-sz/2, y-szh/2)


inizioPartita = false;
xmin =-1; xmax = -1; 
y = room_height;

nIngrandimento = 0;
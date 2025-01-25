event_inherited();
dir = 0;
grv = 0.33;

stop_wind = false
stop_wind_count = 0
image_alpha = 0

speed_gravity = 0

call_later(1, time_source_units_frames, function(){
	speed = 1+random(1)
	direction = dir == 1 ? 190 + random(30) : 350-random(30)
})

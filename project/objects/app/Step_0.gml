if instance_number(lazers) == 2 {
	if !audio_is_playing(snd_laser) audio_play_sound(snd_laser, 0, true)	
} else if instance_number(lazers) == 1 {
	if audio_is_playing(snd_laser) audio_stop_sound(snd_laser)	
}

if input.controlledUnit > -1 {
	x = lerp(x,input.controlledUnit.x,0.3)
	y = lerp(y,input.controlledUnit.y,0.3)
}

audio_falloff_set_model(audio_falloff_linear_distance)
audio_listener_orientation(0,1,0, 0,0,1)
audio_listener_position(x,y,0)

#region		Camera Zoom

//zoom_level = clamp((zoom_level + (mouse_wheel_down()-mouse_wheel_up())*0.1),0.25,1.0)

camera_set_view_pos(camera,
		clamp( camera_get_view_x(camera), 0, room_width - camera_get_view_width(camera) ),
		clamp( camera_get_view_y(camera), 0, room_height - camera_get_view_height(camera) ));

var view_w = camera_get_view_width(camera)
var view_h = camera_get_view_height(camera)

var rate = 0.2

var new_w = round(lerp(view_w, zoom_level *  default_zoom_width, rate))
var new_h = round(lerp(view_h, zoom_level * default_zoom_height, rate))
			
if new_w & 1 {
	new_w++	
}
if new_h & 1 {
	new_h++	
}

camera_set_view_size(camera, new_w, new_h)

//	Realignment
var shift_x = camera_get_view_x(camera) - (new_w - view_w) * 0.5
var shift_y = camera_get_view_y(camera) - (new_h - view_h) * 0.5

camera_set_view_pos(camera,shift_x, shift_y)


////	Clamp app x,y within room
var edgeX = camera_get_view_width(camera)/2
var edgeY = camera_get_view_height(camera)/2
x = clamp(x,0+edgeX,room_width-edgeX)
y = clamp(y,0+edgeY,room_height-edgeY)

#endregion
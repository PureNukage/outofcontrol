var centerX = display_get_gui_width()/2
var centerY = display_get_gui_height()/2 - 256

if newText > 0 and room == Room1 {
	var scale = 3
	draw_set_halign(fa_center)
	draw_set_color(c_black)
	draw_text_transformed(centerX,centerY,"Left Click to hack",scale,scale,0)	
	newText--
	if newText == 0 {
		newText = -1
	}
	zoom_level = .65
}

if room == Room2 {
	var scale = 5
	draw_set_halign(fa_center)
	draw_set_color(c_black)	
	var scale2 = 2
	
	draw_text_transformed(centerX+500,centerY+150,"Press <Space> to start game",scale2,scale2,0)
	
	draw_set_color(c_yellow)
	
	draw_text_transformed(centerX,centerY-200,"Out of Control",scale,scale,0)
	
	zoom_level = 1
	
	if keyboard_check_pressed(vk_space) {
		instance_destroy()
		room_goto(Room1)
	}
	
	draw_set_color(c_white)
	draw_set_halign(fa_left)
	var scale = 2
	var xx = 300
	var yy = display_get_gui_height()-200
	draw_text_transformed(xx,yy,"Created by " + string(creator),scale,scale,0)  yy += 45
	draw_text_transformed(xx,yy, "Music by Kei",scale,scale,0) yy += 45
	draw_text_transformed(xx,yy, "Sounds by @WormholeOracle",scale,scale,0)  yy += 45
	draw_text_transformed(xx,yy, "Additional art by @Brutalise",scale,scale,0) yy += 45
}
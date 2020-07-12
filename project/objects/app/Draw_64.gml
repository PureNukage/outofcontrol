var centerX = display_get_gui_width()/2
var centerY = display_get_gui_height()/2 - 256

if newText > 0 {
	var scale = 3
	draw_set_halign(fa_center)
	draw_set_color(c_black)
	draw_text_transformed(centerX,centerY,"Left Click to hack",scale,scale,0)	
	newText--
	if newText == 0 {
		newText = -1
	}
}
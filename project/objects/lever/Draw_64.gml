var centerX = display_get_gui_width()/2
var centerY = display_get_gui_height()/2

if input.controlledUnit > -1 and abs(point_distance(x,y,input.controlledUnit.x,input.controlledUnit.y)) < 20 {
	var scale = 6
	draw_set_color(c_yellow)
	draw_text_transformed(centerX,centerY-256,"Press E to interact",scale,scale,0)
	
	if input.keyInteract {
		closed = !closed
		sound.playEffect(snd_boink)
		//	The lever is now set to "open"
		if !closed {
			if pairedObject > -1 {
				pairedObject.open()	
			}
		}
		//	The lever is now set to "closed"
		else {
			if pairedObject > -1 {
				pairedObject.close()	
			}
		}
	}
}
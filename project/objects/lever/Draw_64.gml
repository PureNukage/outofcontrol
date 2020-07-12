var centerX = display_get_gui_width()/2
var centerY = display_get_gui_height()/2

if input.controlledUnit > -1 and 
(input.controlledUnit.object_index == player or input.controlledUnit.object_index == keeper)
and abs(point_distance(x,y-20,input.controlledUnit.x,input.controlledUnit.y)) < 50 {
	var scale = 6
	draw_set_color(c_yellow)
	draw_set_halign(fa_center)
	draw_text_transformed(centerX,centerY-256,"Press <Space> to interact",scale,scale,0)
	
	if input.keyInteractPress {
		closed = !closed
		sound.playEffect(snd_door)
		//	The lever is now set to "open"
		if !closed {
			if pairedObject > -1 {
				var disableMyself = false
				if pairedObject.object_index == stop {
					var disableMyself = true
					app.previouslyFollowing = input.controlledUnit
					input.controlledUnit.inControl = false
					input.controlledUnit = -1
					app.ballFollow = true
				}
				pairedObject.open()
				if disableMyself pairedObject = -1
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
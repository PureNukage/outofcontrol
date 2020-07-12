if closed {
	image_speed = 0
	image_index = 0
	obstacle = true
} else {
	if animation_end {
		image_speed = 0
		image_index = image_number - 1
		obstacle = false
	} else {
		image_speed = 1	
	}
}

event_inherited()

if place_meeting(x,y,class_obstacle) {
	var Col = instance_place(x,y,class_obstacle)
	if closed and Col.onGround {
		switch(Col.object_index)
		{
			case box:
				open()
			break
		}
	}
}

else {
	if !closed close()	
}
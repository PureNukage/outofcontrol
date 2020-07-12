if !game.paused {

	switch(states)
	{
		case states.free:
	
			speed = 0
	
			if !barrelClamp.closed closeClamp()
		
			if idleWalkTimer == -1 {
				idleWalkTimer = irandom_range(120, 180)
			
			
			}
		
		break
		case states.move:
		
			if point_distance(x,y,x_goto,y_goto) < 4 {
				if ++pos == path_get_number(path) {
					states = states.free
				
					if mustCloseClamp with lever if pairedObject.object_index == barrelClamp {
						pairedObject.close()
						closed = true
						other.movespeed = 3
						other.mustCloseClamp = false
					}
				}
		
				else {
					x_goto = path_get_point_x(path, pos)
					y_goto = path_get_point_y(path, pos)
				
					//if !barrelClamp.closed and !mustCloseClamp closeClamp()
				}
			} else {			
				move_towards_point(x_goto,y_goto,movespeed)	
			}
		
		break
	}

	applyMovementAndCollisionCheck()

	event_inherited()

}

else {
	speed = 0	
}

depth = -y
if !game.paused {
	
	if !inControl {
		switch(states)
	{
		case states.free:
	
			//speed = 0
	
			if !barrelClamp.closed closeClamp()
			
			if idleWalkTimer > 0 {
				idleWalkTimer--
				if idleWalkTimer == 0 {
					idleWalkTimer = -1	
				}
			} else if idleWalkTimer == -1 {
				idleWalkTimer = irandom_range(120, 180)
				idleWalk()
			
			}
		
		break
		case states.move:
		
			if x_goto > x image_xscale = 1
			else image_xscale = -1
		
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
				
					if !barrelClamp.closed and !mustCloseClamp closeClamp()
				}
			} else {
				if mustCloseClamp {
					 with lever if pairedObject.object_index == barrelClamp {
						if closed {
							other.states = states.free
							other.mustCloseClamp = false
							other.movespeed = 3
						}
					 }	
				}
				if !barrelClamp.closed and !mustCloseClamp closeClamp()
				debug.log("Moving towards my point")
			}
			move_towards_point(x_goto,y_goto,movespeed)	
			var Direction = point_direction(x,y,x_goto,y_goto)
			applyForce(Direction, movespeed)
		
		break
	}
	}
	
	else {
		//speed = 0
		movespeed = 5
		playerMovement()	
	}
	
	if !onGround {
		var oldMask = mask_index
		mask_index = s_person_collision
		while instance_position(x,y,box) {
			var Box = instance_position(x,y,box)
			debug.log("SLIDING OFF BOX")
			var Direction = point_direction(Box.x,Box.y-32, x,y)
			//thrust = 0
			
			x += lengthdir_x(25, Direction)
			y += lengthdir_y(25, Direction)
		}
		mask_index = oldMask
	}
	
	applyMovementAndCollisionCheck()

	event_inherited()

}

else {
	//speed = 0	
}

depth = -y
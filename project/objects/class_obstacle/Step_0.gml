if onGround {
	obstacle = true
	groundY = y
	z = y
} else {
	obstacle = false
	//	I am visually in the air!
	y = z
	
	if !hover {
		if object_index == keeper {
			states = states.free
			pos = 0
			idleWalkTimer = irandom_range(30,60)
			speed = 0
		}
		
		thrust = thrust + grav
		
		z += thrust
		
		//	Check for landing
		if y >= groundY {
			onGround = true
			thrust = 0
			sound.playEffect(snd_drop)
			
			if object_index == keeper {
				states = states.free
				pos = 0
				idleWalkTimer = irandom_range(30,60)
				speed = 0
			}
		}
	} 
}

groundX = x
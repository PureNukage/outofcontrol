if onGround {
	obstacle = true
	groundY = y
	z = y
} else {
	obstacle = false
	//	I am visually in the air!
	y = z
	
	if !hover {
		thrust = thrust + grav
		
		z += thrust
		
		//	Check for landing
		if y >= groundY {
			onGround = true
			thrust = 0	
		}
	} 
}

groundX = x
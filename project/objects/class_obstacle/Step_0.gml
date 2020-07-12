if onGround {
	groundY = y
	z = y
} else {
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
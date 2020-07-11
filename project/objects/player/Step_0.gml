if !game.paused {
	if inControl { 
		hspd = input.keyRight - input.keyLeft
		vspd = input.keyDown - input.keyUp

		if hspd != 0 or vspd != 0 {
	
			var Direction = point_direction(0,0,hspd,vspd)
			
			if hspd > 0 image_xscale = 1
			else if hspd < 0 image_xscale = -1
	
			xx += lengthdir_x(movespeed, Direction)
			yy += lengthdir_y(movespeed, Direction)
	
		}

	}

	else {

	}

	beltMovement()

	applyMovementAndCollisionCheck()

	depth = -y
}
event_inherited()

function playerMovement() {
	if inControl { 
		hspd = input.keyRight - input.keyLeft
		vspd = input.keyDown - input.keyUp

		if hspd != 0 or vspd != 0 {
	
			var Direction = point_direction(0,0,hspd,vspd)
			
			if hspd > 0 image_xscale = 1
			else if hspd < 0 image_xscale = -1
	
			applyForce(Direction, movespeed)
	
		}
	}	
}
if !game.paused {
	
	image_speed = 1

	playerMovement()

	applyMovementAndCollisionCheck()
	
	event_inherited()
	
	//	Check for boxes underneath
	//if pickingUp > -1 {
	//	if input.keyInteract {
	//		pickingUp.dronePickup()	
	//	} else {
	//		pickingUp.pickupState = 0
	//		pickingUp = -1
	//	}
	//} else if place_meeting(x,y+z, class_obstacle) {
	//	var Collision = instance_place(x,y+z, class_obstacle)
			
	//	if Collision.object_index == player {
	//		if input.keyInteract {
	//			Collision.onGround = false
	//			Collision.thrust = -4
	//			pickingUp = Collision
	//			Collision.dronePickup()
	//		}
	//	}
	//}
} else {
	image_speed = 0	
}

depth = -y + -z
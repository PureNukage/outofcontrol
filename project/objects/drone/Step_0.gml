if !game.paused {
	
	//if inControl if !audio_is_playing(snd_drone_loop) sound.playEffect(snd_drone_loop)
	
	image_speed = 1

	playerMovement()
	
	if (xx != 0 or yy != 0) and pickingUp > -1 {
		pickingUp.xx += xx
		pickingUp.yy += yy
	}

	applyMovementAndCollisionCheck()
	
	event_inherited()
	
	//	Check for boxes underneath
	if pickingUp > -1 {
		if input.keyInteract {
			pickingUp.dronePickup()	
		} else {
			pickingUp.hover = false
			pickingUp.pickupState = 0
			pickingUp = -1
		}
	} else if place_meeting(x,groundY, class_obstacle) {
		var Collision = instance_place(x,groundY, class_obstacle)
			
		if Collision.object_index == player or Collision.object_index == box {
			if input.keyInteract {
				Collision.onGround = false
				Collision.hover = true
				pickingUp = Collision
				Collision.dronePickup()
			}
		}
	}
} else {
	image_speed = 0	
}

depth = -y + -z
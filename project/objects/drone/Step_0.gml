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
	
	var list = ds_list_create()
	//	Check for boxes underneath
	if pickingUp > -1 {
		if input.keyInteract {
			pickingUp.dronePickup()	
		} else {
			pickingUp.hover = false
			pickingUp.pickupState = 0
			pickingUp = -1
		}
	} else if instance_place_list(x,groundY, class_obstacle, list,true) {
		for(var c=0;c<ds_list_size(list);c++) {
			var Collision = list[| c]
			//var Collision = instance_place(x,groundY, class_obstacle)
			
			if Collision.object_index == player or Collision.object_index == box {
				if input.keyInteract and pickingUp == -1 {
					Collision.onGround = false
					Collision.hover = true
					pickingUp = Collision
					Collision.dronePickup()
				}
			}
		}
	}
	ds_list_destroy(list)
} else {
	image_speed = 0	
}

depth = -y + -z
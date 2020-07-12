if !game.paused {
	
	playerMovement()

	beltMovement()

	applyMovementAndCollisionCheck()
	
	event_inherited()

}

depth = -y
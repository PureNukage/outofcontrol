if !game.paused {
	beltMovement()

	applyMovementAndCollisionCheck()
	
	event_inherited()
}

depth = -y
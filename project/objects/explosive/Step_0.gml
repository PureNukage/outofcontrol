if !game.paused {
	beltMovement()

	applyMovementAndCollisionCheck()
	
	event_inherited()
}

depth = -groundY - abs(z - y)
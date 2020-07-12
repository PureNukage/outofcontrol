if !game.paused {
	beltMovement()

	applyMovementAndCollisionCheck()
	
	event_inherited()
	
}

if onGround != onGroundPrevious {
	if onGround groundHit()
	if !onGround groundLift()
	onGroundPrevious = onGround
}	

depth = -groundY - abs(z - y)

checkForDeletion()
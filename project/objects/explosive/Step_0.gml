if !game.paused {
	beltMovement()

	applyMovementAndCollisionCheck()
	
	event_inherited()
}

if sprite_index == s_explosion {
	depth = -10000
	blowingUp()
}
else depth = -groundY - abs(z - y)

checkForDeletion()
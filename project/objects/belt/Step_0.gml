if game.paused {
	image_speed = 0
} else {
	image_speed = 1	
}

if Direction == up or Direction == down {
	sprite_index = s_conveyorVertical
} else {
	sprite_index = s_conveyorHorizontal
}
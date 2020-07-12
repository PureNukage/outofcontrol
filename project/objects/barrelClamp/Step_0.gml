if closed {
	sprite_index = s_clamp_closed
	
	if item > -1 {
		item.x = x
		item.y = y
		item.clamped = true
	}
} else {
	sprite_index = s_clamp_open	
}

depth = -1
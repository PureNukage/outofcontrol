if closed and image_index == 0 {
	image_speed = 0
	image_index = 0
	obstacle = true
} else if !closed and animation_end {
	image_speed = 0
	image_index = image_number - 1
	obstacle = false
}
	

if closed and image_index == 0 {
	image_speed = 0
	image_index = 0
	obstacle = true
	mp_grid_add_rectangle(grid.mpGrid, bbox_left,bbox_top, bbox_right,bbox_bottom)
} else if !closed and animation_end {
	image_speed = 0
	image_index = image_number - 1
	obstacle = false
	mp_grid_clear_rectangle(grid.mpGrid, bbox_left,bbox_top, bbox_right,bbox_bottom)
}
	

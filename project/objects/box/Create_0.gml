event_inherited()

shadow.width = sprite_get_width(sprite_index)
shadow.height = sprite_get_height(sprite_index) / 2

onGroundPrevious = false

function groundHit() {
	debug.log("Ground has been hit!")
	var Width = sprite_get_width(sprite_index) / 2
	var Height = sprite_get_height(sprite_index)
	mp_grid_add_rectangle(grid.mpGrid, bbox_left,y-Height, bbox_right,y)
	
	//sound.playEffect(snd_drop)
}

function groundLift() {
	debug.log("Ground has been lifted off!")
	var Width = sprite_get_width(sprite_index) / 2
	var Height = sprite_get_height(sprite_index)
	mp_grid_clear_rectangle(grid.mpGrid, bbox_left,y-Height, bbox_right,y)
}
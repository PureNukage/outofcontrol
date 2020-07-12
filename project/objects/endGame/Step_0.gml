if place_meeting(x,y,class_player) {
	var playa = instance_place(x,y,class_player)
	if input.controlledUnit == playa {
		game_end()	
	}
}
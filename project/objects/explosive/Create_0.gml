event_inherited()

shadow.width = sprite_get_width(sprite_index)
shadow.height = sprite_get_height(sprite_index) / 2

function blowUp() {
	sprite_index = s_explosion
	image_index = 0
	image_speed = 1
	sound.playEffect(snd_explosion)
}

function blowingUp() {
	if animation_end {
		instance_destroy()	
	}	
}
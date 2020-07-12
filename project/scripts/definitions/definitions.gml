enum states {
	free,
	move,
}

#macro bodyparts_enum 0 
#macro bodyparts_id 1
#macro bodyparts_struct 2

enum bodyParts {
	torso,
	head,
	
	rightArmUpper,
	rightArmLower,
	rightArmHand,
	
	leftArmUpper,
	leftArmLower,
	leftArmHand,
	
	rightLegUpper,
	rightLegLower,
	
	leftLegUpper,
	leftLegLower,
}

#macro up 0
#macro down 1
#macro left 2 
#macro right 3

#macro animation_end (image_index > image_number - 1)
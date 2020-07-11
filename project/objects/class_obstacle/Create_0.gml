obstacle = true
hackable = false

hspd = 0
vspd = 0
xx = 0
yy = 0
z = 0
width = sprite_get_width(sprite_index)
height = sprite_get_height(sprite_index)

function beltMovement() {
	if place_meeting(x,y,belt) {
		var Belt = instance_place(x,y,belt)
		var xDirection = 0
		var yDirection = 0
		if Belt.Direction == left or Belt.Direction == right {
			if Belt.Direction == left xDirection = -1
			else xx += xDirection = 1
		} else {
			if Belt.Direction == up yDirection = -1
			else yDirection = 1
		}
		xx += xDirection * Belt.Speed
		yy += yDirection * Belt.Speed
	}
}

function applyMovementAndCollisionCheck() {
	//	Collision Check and move object
	if xx != 0 or yy != 0 {
	
		for(var _XX=0;_XX<abs(xx);_XX++) {
		
			if !place_meeting(x+sign(xx),y+z,class_obstacle) x += sign(xx)
			else {
				var Collision = instance_place(x+sign(xx),y+z,class_obstacle)
				if !Collision.obstacle x += sign(xx)
				else if z > (Collision.z + Collision.height) x += sign(xx)
			}
		
		}
	
		for(var _YY=0;_YY<abs(yy);_YY++) {
		
			if !place_meeting(x,y+sign(yy)+z,class_obstacle) y += sign(yy)
			else {
				var Collision = instance_place(x,y+sign(yy)+z,class_obstacle)
				if !Collision.obstacle y += sign(yy)
				else if z > (Collision.z + Collision.height) y += sign(yy)
			}
		}
	
		xx = 0
		yy = 0 
	}	
}
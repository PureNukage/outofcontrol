obstacle = true
hackable = false

mask_index = sprite_index

hspd = 0
vspd = 0
xx = 0
yy = 0
air = 0
z = y
thrust = 0
grav = 1
fric = 1
force = 0
accel = 0
onGround = true
groundX = x
groundY = y

hover = false

pickupState = 0

width = sprite_get_width(sprite_index)
height = sprite_get_height(sprite_index)

shadow = {
	width: 36,
	height: 12,
	alpha: .6,
	draw: function(rectangle) {
		var oldDepth = other.depth
		other.depth = 1
		draw_set_color(c_black)
		draw_set_alpha(alpha)
		var x1 = other.groundX - width/2 - 1
		var y1 = other.groundY - height/2
		var x2 = other.groundX + width/2
		var y2 = other.groundY + height/2
		if !rectangle draw_ellipse(x1,y1, x2,y2, false)
		else draw_rectangle(x1,y1, x2,y2, false)
		other.depth = oldDepth
		draw_set_alpha(1)
	}
}

function beltMovement() {
	if place_meeting(x,y,belt) {
		var Belt = instance_place(x,y,belt)
		var xDirection = 0
		var yDirection = 0
		if Belt.Direction == left or Belt.Direction == right {
			if Belt.Direction == left xDirection = -1
			else xDirection = 1
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
	if (xx != 0 or yy != 0) {

		if onGround {
			for(var _XX=0;_XX<abs(floor(xx));_XX++) {
		
				if !place_meeting(x+sign(xx),y,class_obstacle) x += sign(xx)
				else {
					var Collision = instance_place(x+sign(xx),y,class_obstacle)
					if inControl debug.log("Colliding with object " + string_upper(object_get_name(Collision.object_index)))
					if inControl debug.log(string_upper(object_get_name(Collision.object_index)) + "'s z is " + string(Collision.z))
					if !Collision.obstacle x += sign(xx)
					else if z < (Collision.z + Collision.height) x += sign(xx)
				}
		
			}
			
			for(var _YY=0;_YY<abs(floor(yy));_YY++) {

				if !place_meeting(x,y+sign(yy),class_obstacle) y += sign(yy)
				else {
					var Collision = instance_place(x,y+sign(yy),class_obstacle)
					if inControl debug.log("Colliding with object " + string_upper(object_get_name(Collision.object_index)))
					if inControl debug.log(string_upper(object_get_name(Collision.object_index)) + "'s z is " + string(Collision.z))
					if !Collision.obstacle y += sign(yy)
					else if z < (Collision.z + Collision.height) y += sign(yy)
				}
			}
		} else {
			for(var _XX=0;_XX<abs(floor(xx));_XX++) {
		
				if !place_meeting(x+sign(xx),groundY,class_obstacle) x += sign(xx)
				else {
					var Collision = instance_place(x+sign(xx),groundY,class_obstacle)
					if inControl debug.log("Colliding with object " + string_upper(object_get_name(Collision.object_index)))
					if inControl debug.log(string_upper(object_get_name(Collision.object_index)) + "'s z is " + string(Collision.z))
					if !Collision.obstacle x += sign(xx)
					else if z < (Collision.z - Collision.height) x += sign(xx)
				}
		
			}
			
			for(var _YY=0;_YY<abs(floor(yy));_YY++) {
	
				if !place_meeting(x,groundY+sign(yy),class_obstacle) {
					groundY += sign(yy)
					z += sign(yy)
				} else {
					var Collision = instance_place(x,groundY+sign(yy),class_obstacle)
					if inControl debug.log("Colliding with object " + string_upper(object_get_name(Collision.object_index)))
					if inControl debug.log(string_upper(object_get_name(Collision.object_index)) + "'s z is " + string(Collision.z))
					if !Collision.obstacle {
						groundY += sign(yy)
						z += sign(yy)
					} else if z < (Collision.z - Collision.height) {
						groundY += sign(yy)
						z += sign(yy)	
					}
				}
			}		
		}
	
		xx = 0
		yy = 0 
	}	
}
	
function dronePickup() {
	var Height = sprite_get_height(sprite_index)
	var fullyGrabbedY = other.y + Height - 14
	x = other.x
	
	switch(pickupState)
	{
		case 0:
			if y > fullyGrabbedY {
				yy -= 2
				air += 2
				z += 2
			} else {
				y = fullyGrabbedY
				pickupState = 1
			}
		break
		case 1:
			y = fullyGrabbedY
		break
	}

}
	
function applyForce(Direction, Force) {
	xx += lengthdir_x(Force, Direction)
	yy += lengthdir_y(Force, Direction)
}
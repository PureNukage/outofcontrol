obstacle = true
hackable = false

mask_index = sprite_index

hspd = 0
vspd = 0
xx = 0
yy = 0
air = 0
z = y
grav = 1
thrust = 0
onGround = true
groundX = x
groundY = y
clamped = false

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
	var oldMask = mask_index
	mask_index = s_person_collision
	if instance_position(x,y,belt) {
		var Belt = instance_position(x,y,belt)
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
	mask_index = oldMask
}

function applyMovementAndCollisionCheck() {
	//	Collision Check and move object
	if (xx != 0 or yy != 0) {
	
		if onGround {
			var list = ds_list_create()
			
			for(var _XX=0;_XX<abs(floor(xx));_XX++) {
				
				if !instance_place_list(x+sign(xx),y,class_obstacle,list,true) x += sign(xx)
				else {
					var collided = false
					for(var c=0;c<ds_list_size(list);c++) {
						var Collision = list[| c]
						if Collision.object_index == lazers {
							if object_index == explosive {
								if Collision.sprite_index == s_lazers {
									if sprite_index != s_explosion blowUp()
									instance_destroy(Collision)	
								}
							} else if object_index == box {
									
							} else collided = true
						} else if Collision.object_index == hole {
							if object_index != box collided = true
						} else if Collision.object_index == explosive {
							
						} else if Collision.obstacle collided = true
						//if !Collision.onGround collided = false
						//else if !Collision.onGround and (Collision.air > air) collided = true
					}
					if !collided x += sign(xx)
				}
		
			}
			
			for(var _YY=0;_YY<abs(floor(yy));_YY++) {
				
				if !instance_place_list(x,y+sign(yy),class_obstacle,list,true) y += sign(yy)
				else {
					var collided = false
					for(var c=0;c<ds_list_size(list);c++) {
						var Collision = list[| c]
						if Collision.object_index == lazers {
							if object_index == explosive {
								Collision.blowUp()
							} else if object_index == box {
									
							} else collided = true
						} else if Collision.object_index == hole {
							if object_index != box collided = true
						} else if Collision.object_index == explosive {
							
						} else if Collision.obstacle collided = true
						//if !Collision.onGround collided = false
						//else if !Collision.onGround and (Collision.air > air) collided = true
					}
					if !collided y += sign(yy)
				}
			}
			
			ds_list_destroy(list)
		} 
		
		else {
			for(var _XX=0;_XX<abs(floor(xx));_XX++) {
		
				if !place_meeting(x+sign(xx),groundY,class_obstacle) x += sign(xx)
				else {
					var Collision = instance_place(x+sign(xx),groundY,class_obstacle)
					//if inControl debug.log("Colliding with object " + string_upper(object_get_name(Collision.object_index)))
					//if inControl debug.log(string_upper(object_get_name(Collision.object_index)) + "'s z is " + string(Collision.z))
					if !Collision.obstacle x += sign(xx)
					else if Collision.onGround and (Collision.height < air) x += sign(xx)
					else if !Collision.onGround x += sign(xx)
				}
		
			}
			
			for(var _YY=0;_YY<abs(floor(yy));_YY++) {
	
				if !place_meeting(x,groundY+sign(yy),class_obstacle) {
					groundY += sign(yy)
					z += sign(yy)
				} else {
					var Collision = instance_place(x,groundY+sign(yy),class_obstacle)
					//if inControl debug.log("Colliding with object " + string_upper(object_get_name(Collision.object_index)))
					//if inControl debug.log(string_upper(object_get_name(Collision.object_index)) + "'s z is " + string(Collision.z))
					if !Collision.obstacle {
						groundY += sign(yy)
						z += sign(yy)
					} else if Collision.onGround and (Collision.height < air) {
						groundY += sign(yy)
						z += sign(yy)	
					} else if !Collision.onGround {
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
	var fullyGrabbedY = other.y + Height + 40
	//x = other.x
	groundY = other.groundY
	
	switch(pickupState)
	{
		case 0:
			if y > fullyGrabbedY {
				x = lerp(x,other.x,0.1)
				z -= 2
				if time.seconds_switch debug.log("I am being picked up!")
				
				if object_index == keeper {
					idleWalkTimer = irandom_range(30,60)
					pos = 0
					states = states.free
					speed = 0
				}
			} else {
				z = fullyGrabbedY
				pickupState = 1
				debug.log("Fully grabbed!")
				sound.playEffect(snd_pickup)
			}
		break
		case 1:
			z = fullyGrabbedY
			x = other.x
		break
	}

}
	
function applyForce(Direction, Force) {
	xx += lengthdir_x(Force, Direction)
	yy += lengthdir_y(Force, Direction)
}
	
function checkForDeletion() {
	if place_meeting(x,y,deleteStuff) {
		instance_destroy()
	}
}
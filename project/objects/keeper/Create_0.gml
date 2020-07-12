event_inherited()

states = states.free

x_goto = -1
y_goto = -1
pos = 0
path = path_add()
movespeed = 3

idleWalkTimer = -1

mustCloseClamp = false

function openDoor() {
	with lever if pairedObject.object_index == door {
		var X = x
		var Y = y + 36
	}
	if pathfind(path, x,y, X,Y) {
		debug.log("I can make it to the switch to open the door!")
		
		pos = 0
		x_goto = path_get_point_x(path,pos)
		y_goto = path_get_point_y(path,pos)
		states = states.move
		movespeed = 7
	}
}

function idleWalk() {
	with lever if pairedObject.object_index == barrelClamp {
		var X = x + irandom_range(-240,240)
		var Y = y + irandom_range(60,360)
	}
	if pathfind(path, x,y, X,Y) {
		debug.log("I am idlewalking!")	
	}
	//	I can't get back to the switch!
	else {
		openDoor()
	}
	
	
}	

function closeClamp() {
	debug.log("I MUST CLOSE THE CLAMP")
	mustCloseClamp = true
	movespeed = 7
	with lever if pairedObject.object_index == barrelClamp {
		var X = x
		var Y = y + 36
	}
	if pathfind(path, x,y, X,Y) {
		pos = 0
		x_goto = path_get_point_x(path, pos)
		y_goto = path_get_point_y(path, pos)
		states = states.move	
	}
}

function pathfind(path, X, Y, goalX, goalY) {
		
	if mp_grid_path(grid.mpGrid,path, X,Y, goalX,goalY, true) {
		
		
		return true	
	} else {
		debug.log("Cannot pathfind here!")
		
		return false
	}
}
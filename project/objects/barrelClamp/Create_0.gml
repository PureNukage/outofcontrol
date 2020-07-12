event_inherited()

closed = true

item = instance_create_layer(x,y-8,"Instances",explosive)
item.clamped = true

function open() {
	closed = false
	
	if item > -1 {
		debug.log("Unclamping object " + string_upper(object_get_name(item.object_index)))
		item.clamped = false
		item = -1
	}
	
}

function close() {
	closed = true
	
	if item > -1 {
		item.clamped = true
		debug.log("Clamping object " + string_upper(object_get_name(item.object_index)))
	} else {
		if place_meeting(x,y,explosive) {
			item = instance_place(x,y,explosive)
			item.clamped = true
			debug.log("Clamping object " + string_upper(object_get_name(item.object_index)))
		}
	}
}
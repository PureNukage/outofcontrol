event_inherited()

closed = true
image_speed = 0

function open() {
	closed = false
	image_speed = 1
}

function close() {
	closed = true
	image_speed = -1
	obstacle = true
}
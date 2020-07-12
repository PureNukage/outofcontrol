event_inherited()

pairedObject = -1

closed = true
image_speed = 0

function open() {
	closed = false
	image_speed = 1
	
	if pairedObject > -1 pairedObject.open()
}

function close() {
	closed = true
	image_speed = -1
	obstacle = true
	
	if pairedObject > -1 pairedObject.close()
}
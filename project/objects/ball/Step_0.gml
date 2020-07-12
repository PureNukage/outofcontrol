if x >= 4200 and app.ballFollow {
	app.ballFollow = false
	debug.log("Done following the ball")
}

if x <= 3371 and !instance_exists(stop) {
	physics_apply_torque(999999999)
	debug.log("Applying -2000 newtons of torque!")	
}
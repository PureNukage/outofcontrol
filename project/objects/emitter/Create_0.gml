delay = 2
lastSpawn = -1
on = false

function open() {
	on = true
	
	lastSpawn = time.seconds_stream
}

function close() {
	on = false
	
}

//soundEmitter = audio_emitter_create()
//audio_emitter_position(soundEmitter,x,y,0)
//audio_emitter_falloff(soundEmitter, 100, 1000, 1)
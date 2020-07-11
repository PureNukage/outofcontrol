if time.seconds_stream >= lastSpawn + delay {
	lastSpawn = time.seconds_stream
	
	var Unit = instance_create_layer(x-24,y-16,"Instances",box)
	Unit.inControl = false
	debug.log("Creating a new unit " + string_upper(object_get_name(Unit.object_index)))
	sound.playEffect(snd_belt)
}

depth = -y
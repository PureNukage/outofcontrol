effectVolume = .6

musicVolume = .4

function playEffect(index) {
	
	audio_play_sound(index, 0, false)
	audio_sound_gain(index, effectVolume, 0)
	
	debug.log("Playing sound " + string_upper(audio_get_name(index)) )
	
}

audio_play_sound(snd_music_track1, 0, true)
audio_sound_gain(snd_music_track1, musicVolume, 0)
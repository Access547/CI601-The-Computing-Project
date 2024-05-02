extends AudioStreamPlayer

func PlaySound(sound: AudioStreamWAV) -> void:
	stream = sound
	volume_db = -15
	play(0.0)

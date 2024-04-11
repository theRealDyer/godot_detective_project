extends Node

var music_stream = preload("res://sounds/main_menu_jazz.mp3")  # Adjust the path to your music file
var audio_player = null

func _ready():
	audio_player = AudioStreamPlayer.new()
	audio_player.stream = music_stream
	add_child(audio_player)

func start_music():
	if not audio_player.playing:
		audio_player.play()

func stop_music():
	if audio_player.playing:
		audio_player.stop()

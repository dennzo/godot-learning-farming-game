extends Timer

@export var audio_stream_player_2d: AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_timeout() -> void:
	audio_stream_player_2d.play()

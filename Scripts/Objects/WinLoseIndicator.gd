extends Node2D
@onready var fuck: AudioStreamPlayer = $Fuck
@onready var ding: AudioStreamPlayer = $Ding
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func win():
	animation_player.play("Win")
	ding.play()
	
func lose():
	animation_player.play("Lose")
	fuck.play()

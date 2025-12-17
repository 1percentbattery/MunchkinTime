extends Node2D
@onready var ObjectiveText: Label = $Node2D/ObjectiveText
@onready var Sound: AudioStreamPlayer = $Sound
@onready var Fuck: AudioStreamPlayer = $Node2D/Fuck
@onready var Ding: AudioStreamPlayer = $Node2D/Ding

@export var Objective: String 

func _ready() -> void:
	ObjectiveText.text = str(Objective)
	
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if get_parent().has_method("start"):
		get_parent().start()

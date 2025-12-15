extends Node2D
@onready var ObjectiveText: Label = $Node2D/ObjectiveText

@export var Objective: String 

func _ready() -> void:
	ObjectiveText.text = str(Objective)
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if get_parent().has_method("start"):
		get_parent().start()

extends Node3D
@onready var Winlose: Node2D = $WinloseIndicator
var chicken = false
var beef = false
@onready var Chicken: MeshInstance3D = $MeshInstance3D
@onready var Beef: MeshInstance3D = $MeshInstance3D2
@onready var Steve: CharacterBody3D = $Steve

var choice = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if beef == true:
		if beef != null:
			Beef.global_position = lerp(Beef.global_position,Steve.global_position,delta * 7)
			await get_tree().create_timer(0.3).timeout
			Beef.hide()

	if chicken == true:
		if chicken != null:
			Chicken.global_position = lerp(Chicken.global_position,Steve.global_position,delta * 7)
			await get_tree().create_timer(0.3).timeout
			Chicken.hide()

func _on_chicken_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:
		if choice == false:
			Winlose.lose()
			chicken = true
			choice = true
			await get_tree().create_timer(2.0).timeout
			G.lostGame()
func _on_beef_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:
		if choice == false:
			Winlose.win()
			beef = true
			choice = true
			await get_tree().create_timer(2.0).timeout
			G.wonGame()

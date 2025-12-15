extends floatingBody

@export var whereToSendLose : Node
var dissovleState = 0.0
var lsot = false
func hit(from,damage):
	whereToSendLose.lose()
	lsot = true
func _process(delta: float) -> void:
	if lsot:
		dissovleState += delta/3
		material.set_shader_parameter("dissovleState",dissovleState)

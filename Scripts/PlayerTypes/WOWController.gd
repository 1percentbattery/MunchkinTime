extends floatingBody

var dissovleState = 0.0
var lsot = false
func _ready():
	material = material.duplicate(true)
func hit(from,damage):
	get_parent().lose()
	lsot = true
func _process(delta: float) -> void:
	if lsot:
		dissovleState += delta/3
		material.set_shader_parameter("dissovleState",dissovleState)

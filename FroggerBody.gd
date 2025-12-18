extends CharacterBody2D
@export var on = false
@export var spaceSize :=  75.0
@export var timeBetweenJumps := 0.1
var MovementLerpSpeed := 10.0
var jumpTimer = .5
var directions = {
	"Left" : Vector2(-1,0),
	"Right" : Vector2(1,0),
	"Up" : Vector2(0,-1),
	"Down" : Vector2(0,1)
}
func _process(delta: float) -> void:
	if !on:
		return
	jumpTimer -= delta
	if Input.is_action_just_pressed("Left"):
		if !Input.is_action_just_pressed("Right"):
			jump(directions["Left"])
	elif Input.is_action_just_pressed("Right"):
		jump(directions["Right"])
	if Input.is_action_just_pressed("Up"):
		if !Input.is_action_just_pressed("Down"):
			jump(directions["Up"])
	elif Input.is_action_just_pressed("Down"):
		jump(directions["Down"])
func jump(dir : Vector2):
	$JumpSound.play()
	if jumpTimer <= 0.0:
		jumpTimer = timeBetweenJumps
	else:
		return
	position += dir * spaceSize
func hit(from,damage):
	get_parent().lose()

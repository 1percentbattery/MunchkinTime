extends CharacterBody2D

var speed = 900
var startingvelocity = Vector2.ZERO
const EXPLOSION = preload("uid://bcqqfvfhfsqe8")



func _ready() -> void:
	startingvelocity.x = randi_range(-speed,speed)
	startingvelocity.y = randi_range(-speed,speed)
	velocity = startingvelocity
func _process(delta: float) -> void:
	var collision = move_and_collide(velocity*delta, true)
	
	
	if collision:
		print(collision)
		velocity = velocity.bounce(collision.get_normal())
		
	move_and_slide()


func _on_button_pressed() -> void:
	var splosion = EXPLOSION.instantiate()
	get_parent().add_child(splosion)
	splosion.bartsound = true
	splosion.global_position = self.global_position
	splosion.scale.x = 2
	splosion.scale.y = 2
	queue_free()

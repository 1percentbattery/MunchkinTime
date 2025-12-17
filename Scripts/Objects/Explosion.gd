extends Sprite2D
@onready var explosion: AudioStreamPlayer = $Explosion
@onready var bart: AudioStreamPlayer = $Bart

@onready var bartsound = false

func _ready() -> void:
	if bartsound == true:
		bart.play()
	else:
		explosion.play()

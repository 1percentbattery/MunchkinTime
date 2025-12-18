extends Area2D
@onready var hit: AudioStreamPlayer = $Hit
@onready var gib: AudioStreamPlayer = $Gib
@onready var scream: AudioStreamPlayer = $Scream

var bloody = false
@onready var Blood: Sprite2D = $RealisticBloodStainOnTransparentSurfaceDepictingADramaticSceneOfPotentialInjuryOrViolenceRealBloodStainOnTransparentBackgroundFreePng

func _process(delta: float) -> void:
	if bloody == true:
		$Sprite2D2.show()
		Blood.show()

func sound():
	hit.play()
	if bloody:
		gib.play()
		scream.play()

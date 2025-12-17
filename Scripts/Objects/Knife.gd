extends Area2D

var bloody = false
@onready var Blood: Sprite2D = $RealisticBloodStainOnTransparentSurfaceDepictingADramaticSceneOfPotentialInjuryOrViolenceRealBloodStainOnTransparentBackgroundFreePng

func _process(delta: float) -> void:
	if bloody == true:
		$Sprite2D2.show()
		Blood.show()

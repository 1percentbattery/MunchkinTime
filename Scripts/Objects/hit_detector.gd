extends CharacterBody2D
func hit(from,damage):
	print(from)
	get_tree().root.lose()
	

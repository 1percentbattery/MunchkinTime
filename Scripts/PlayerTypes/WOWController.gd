extends floatingBody

@export var whereToSendLose : Node
func hit(from,damage):
	whereToSendLose.lose()

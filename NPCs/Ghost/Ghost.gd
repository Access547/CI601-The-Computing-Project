extends Enemy


var nextAction: int


func _ready():
	super()
	nextAction = 0
	
func SetNextAttack():
	if TurnOrder.turn > 5:
		nextAction = 1
	else:
		nextAction = 0


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Death":
		queue_free()

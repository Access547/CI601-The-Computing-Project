extends Enemy


var nextAction: int


func _ready():
	super()
	nextAction = randi_range(1, enemyActions.size() -1)
	
func SetNextAttack():
	if TurnOrder.turn > 2:
		print("dwa")
		nextAction = 0
	else:
		nextAction = randi_range(1, enemyActions.size() -1)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Death":
		queue_free()

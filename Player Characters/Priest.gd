extends Character





func _ready() -> void:
	health = maxHealth
	actions.append(massTeleport)
	actions.append(heal)
	actions.append(purgeUndead)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Death":
		queue_free()

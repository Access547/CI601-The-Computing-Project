extends Sprite2D

@onready var combat_level: CombatManager = $".."

@onready var animPlayer: AnimationPlayer = $AnimationPlayer
const damageNumber = preload("res://GUI/damage_number.tscn")







func PlayAnim(anim: String):
	visible = true
	animPlayer.play(anim)
	




func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	visible = false

extends Area2D

@export var pos: int
@export var floater: RichTextLabel


func _on_mouse_entered() -> void:
	floater.visible = true


func _on_mouse_exited() -> void:
	floater.visible = false

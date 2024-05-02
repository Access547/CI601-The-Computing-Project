extends Control

var page: int
@export var pages: Array[Texture]
@onready var image: TextureRect = $TextureRect


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://Main Menu.tscn")

func _on_left_pressed() -> void:
	page = clamp(page - 1, 0, 3)
	Update()

func _on_right_pressed() -> void:
	page = clamp(page + 1, 0, 3)
	Update()


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Main Menu.tscn")


func Update() -> void:
	image.texture = pages[page]
	var children = get_children()
	for i in children.size():
		if children[i] is RichTextLabel:
			if children[i].is_in_group(str(page + 1)):
				children[i].visible = true
			else:
				children[i].visible = false

extends Control
class_name Menu


@export var combat: CombatManager
@onready var infoLabel: RichTextLabel = $"Back Panel/Sub2/InfoLabel"
@onready var label: PackedScene = preload("res://GUI/info_label.tscn")
@onready var subOptions: VBoxContainer = $"Back Panel/Sub/Options"
const textTheme = preload("res://GUI/text.tres")
var count: int = 0


func makeNewLabel(named: String) -> void:
	count += 1
	var newLabel: RichTextLabel = label.instantiate()
	newLabel.menu = self
	newLabel.info = combat.turnOrder.front().actions[count - 1].description
	newLabel.name = named
	newLabel.text = str(count, ". ", named)
	newLabel.theme = textTheme
	newLabel.fit_content = true
	subOptions.add_child(newLabel)

func DeleteLabels() -> void:
	var children = subOptions.get_children()
	count = 0
	for i in children.size():
		children[i].queue_free()


func SetInfoLabel(text: String) -> void:
	infoLabel.text = text
	

func DeleteInfoLabel() -> void:
	infoLabel.text = ""



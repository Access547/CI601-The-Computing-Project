extends RichTextLabel


var info: String
var menu: Control


func _on_mouse_entered() -> void:
	menu.infoLabel.text = info


func _on_mouse_exited() -> void:
	menu.infoLabel.text = ""

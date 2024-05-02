extends Character
class_name Enemy


@export var enemyActions: Array[Resource]


func _ready() -> void:
	super()
	GotSelected.connect(Attack)
	$Character.flip_h = true


func Attack() -> void:
	animPlayer.play("Basic Attack")
	animPlayer.queue("idle")

	

func AnimFinished() -> void:
	FinishedAttacking.emit(self)

extends AnimatableBody2D

@export var range_y: float = 385.0
@export var duration: float = 5.0

var position_base_y: float
var tween: Tween

func _ready() -> void:
	position_base_y = position.y
	var start = position_base_y
	var end = position_base_y - range_y
	
	tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_loops() # boucle infinie
	
	# On fait monter puis descendre dans la même séquence
	tween.tween_property(self, "position:y", end, duration)
	tween.tween_property(self, "position:y", start, duration)

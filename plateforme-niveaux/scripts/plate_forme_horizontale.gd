extends AnimatableBody2D

@export var range_x: float = 192.0
@export var duration: float = 3.0

var position_base_x
var tween

func _ready() -> void:
	position_base_x = position.x
	var start = position_base_x
	var end = position_base_x - range_x
	tween = self.create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_loops()
	tween.tween_property(self, "position:x", end, duration).from(start)
	tween.tween_property(self, "position:x", start, duration).from(end)

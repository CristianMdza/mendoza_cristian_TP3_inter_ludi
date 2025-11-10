extends AnimatableBody2D

@export var range_y: float = 275.0 # Distance verticale de déplacement.
@export var duration: float = 5.0  # Durée du déplacement.

var position_base_y  # Position de départ.
var tween            # Tween pour animer le mouvement.

func _ready() -> void:
	position_base_y = position.y
	var start = position_base_y
	var end = position_base_y - range_y
	
	# Crée et configure le Tween.
	tween = self.create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)  # Mouvement fluide.
	tween.set_loops()                   # Boucle infinie.
	
	# Animation de va-et-vient vertical.
	tween.tween_property(self, "position:y", end, duration).from(start)
	tween.tween_property(self, "position:y", start, duration).from(end)

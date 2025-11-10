extends AnimatableBody2D

@export var range_y: float = 385.0  # Distance verticale.
@export var duration: float = 5.0   # Durée du déplacement.

var position_base_y: float  # Position de départ.
var tween: Tween            # Tween pour l’animation.

func _ready() -> void:
	position_base_y = position.y
	var start = position_base_y
	var end = position_base_y - range_y
	
	# Crée et configure le Tween.
	tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE)  # Transition sinus pour mouvement fluide.
	tween.set_ease(Tween.EASE_IN_OUT)  # Accélère/décélère naturellement.
	tween.set_loops()                  # boucle infinie.
	
	# Animation de va-et-vient vertical.
	tween.tween_property(self, "position:y", end, duration)
	tween.tween_property(self, "position:y", start, duration)

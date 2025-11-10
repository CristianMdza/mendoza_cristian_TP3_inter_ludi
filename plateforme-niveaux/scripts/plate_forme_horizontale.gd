extends AnimatableBody2D

@export var range_x: float = 192.0  # 6 cases de 32px (6 * 32) : Distance horizontale que la plateforme parcourt.
@export var duration: float = 3.0   # Temps pour parcourir cette distane (secondes).

var position_base_x   # Position de départ en X.
var tween             # Tween pour l'animation.

func _ready() -> void:
	position_base_x = position.x          # Sauvegarde la position de départ.
	var start = position_base_x
	var end = position_base_x - range_x   # Calcule la position finale.
	tween = self.create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)    # Type de transition cubic : mouvement fluide (accélère puis décélère).
	tween.set_loops()                     # Boucle infinie.
	
	# Anime la plateforme : aller-retour horizontal.
	tween.tween_property(self, "position:x", end, duration).from(start)
	tween.tween_property(self, "position:x", start, duration).from(end)

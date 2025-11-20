extends Area2D

@export var jump_force: float = -800.0   # Force du saut du joueur.

func _ready():
	# État initial du trampoline.
	$CollisionShape2D_immobile.disabled = false
	$CollisionShape2D_ouvert.disabled = true
	$AnimatedSprite2D.play("trampoline_immobile")

	# Connexions des signaux
	if not is_connected("body_entered", Callable(self, "_on_body_entered")):
		connect("body_entered", Callable(self, "_on_body_entered"))
	if not is_connected("body_exited", Callable(self, "_on_body_exited")):
		connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	if body.is_in_group("joueur"):
		# Active le trampoline + saut en différé : On utilise call_deferred pour reporter l'action à la prochaine frame.
		call_deferred("_trigger_trampoline", body)

func _trigger_trampoline(body):
	$AnimatedSprite2D.play("trampoline_ouvert")   # Animation ouverte.
	$CollisionShape2D_immobile.disabled = true
	$CollisionShape2D_ouvert.disabled = false     # Collision ouverte.
	body.velocity.y = jump_force                  # Applique la force de saut du joueur.
	$SonTrampoline.play()                         # Son du trampoline.

func _on_body_exited(body):
	if body.is_in_group("joueur"):
		call_deferred("_reset_trampoline")        # Remet trampoline fermé.

func _reset_trampoline():
	$AnimatedSprite2D.play("trampoline_immobile") # Animation fermée.
	$CollisionShape2D_immobile.disabled = false
	$CollisionShape2D_ouvert.disabled = true      # Collision fermée.

# Dans un noued Porte basé sur un Area2D
extends Area2D

@export var nouvelle_scene:PackedScene  # La scène à charger quand le joueur passe la porte.

func _on_body_entered(body: Node2D) -> void:
	# Vérifie si c'est le joueur qui entre dans la porte.
	if body is Joueur:
		Main.changer_scene(nouvelle_scene)

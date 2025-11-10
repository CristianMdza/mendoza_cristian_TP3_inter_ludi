## Montre un message quand le joueur est proche.
class_name PanneauMessage extends Area2D

@export var message := "Un message défaut."  # Texte du message à afficher.


func _ready() -> void:
	# Cache le message au démarrage.
	$Message.hide()


func show_message(_body):
	$Timer.start()                          # Démarre le timer.
	$Message.show()                         # Affiche le panneau.
	$Message/Fond/Etiquette.text = message  # Met à jour le texte.
	await $Timer.timeout                    # Attend la fin du timer.
	$Message.hide()                         # Cache le panneau après le timer.


func hide_message(_body) -> void:
	$Timer.stop()     # Arrête le timer.
	$Message.hide()   # Cache le panneau.

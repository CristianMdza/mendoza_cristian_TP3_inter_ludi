extends CanvasLayer

func _ready() -> void:
	# Affiche le nombre initial de monnaies.
	%MonnaiesLabel.text = str(Main.monnaies)
	# Connecte le signal de collecte de monnaie à la fonction de mise à jour.
	Main.monnaie_collectee.connect(retroaction_monnaie)	

func retroaction_monnaie(valeur_monnaies):
	# Met à jour le label et joue le son quand une monnaie est collectée.
	%MonnaiesLabel.text = str(valeur_monnaies)
	# On joue un "son" associé à la collecte de monnaie.
	%MonnaiesSFX.play()

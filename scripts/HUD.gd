extends Control

@onready var score_label = $Score
@onready var pickups = $pickups


func _ready():
	score_label.text = "Gold: "+ str(GameManager.score)
	#SignalManager.connect("coin_collected", _on_coin_collected)
	SignalManager.connect("update_HUD_manager_values", update_HUD_manager_values)

#func _on_coin_collected():
	#score_label.text = "Gold: "+ str(GameManager.score)

func update_HUD_manager_values():
	score_label.text = "Gold: "+ str(GameManager.score)
	pickups.text = "Früchte: "+ str(GameManager.pickup_amount)
	

extends Control

@onready var score_label = $Score
@onready var pickups = $pickups


func _ready():
	score_label.text = "Gold: "+ str(GameManager.score)
	#SignalManager.connect("coin_collected", _on_coin_collected)
	SignalManager.connect("update_HUD_manager_values", update_HUD_manager_values)

#func _on_coin_collected():
	#score_label.text = "Gold: "+ str(GameManager.score)

func update_HUD_manager_values(score, pickup_amount):
	score_label.text = "Gold: "+ str(score)
	pickups.text = "Früchte: "+ str(pickup_amount)
	

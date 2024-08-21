extends Node

#Signal manager is an Interface for GameScenes and the GameManager. It helps by:
# 	* giving an overview over Signals relevant to the GameManager
#	* giving the GameManager an easy way to connect to Signals even if an Instance/scene is created later in Game
#	* separating emmiting the Signal and catching the Signal to different files for clarity

signal player_death
signal coin_collected(amount)
signal add_pickup(amount)
signal update_HUD_manager_values(score, pickup_amount)
signal change_level(current_level_name)

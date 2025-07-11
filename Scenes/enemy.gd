extends AnimatedSprite2D

signal enemy_attack()

func attack() -> void:
	var tween =  get_tree().create_tween()
	tween.tween_property(self,"global_position",position + Vector2(-10, 10),0.2)
	tween.tween_property(self,"global_position",position + Vector2(10, -10),0.2)
	


func _on_end_turn_button_end_player_turn() -> void:
	attack()
	enemy_attack.emit()
	#SPAGHETTI ALERT
	# I probably should create a global turn manager for this
	# for now, we are gonna have the enemy end enemy turn
	DragAndDrop.player_turn = true

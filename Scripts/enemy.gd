extends AnimatedSprite2D

signal enemy_attack()
signal enemy_dead()


func _ready() -> void:
	pass

func attack() -> void:
	var atk = get_tree().create_tween()
	var old_position = position
	atk.tween_property(self,"global_position", position + Vector2(-10, 10), 0.2)
	atk.tween_property(self,"global_position", old_position, 0.2)
	atk.connect("finished", on_tween_finished)
	enemy_attack.emit()




func _on_end_turn_button_end_player_turn() -> void:
	attack()

func on_tween_finished() -> void:
	DragAndDrop.player_turn = true

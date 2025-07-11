extends Area2D

signal end_player_turn()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click") and DragAndDrop.player_turn:
		end_player_turn.emit()



func _on_end_player_turn() -> void:
	DragAndDrop.player_turn = false

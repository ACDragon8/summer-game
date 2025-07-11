extends Area2D

signal end_player_turn()

var selectable : bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (selectable and DragAndDrop.player_turn):
		if Input.is_action_just_pressed("left_click") and DragAndDrop.player_turn:
			DragAndDrop.player_turn = false
			end_player_turn.emit()


func _on_mouse_entered() -> void:
	selectable = true


func _on_mouse_exited() -> void:
	selectable = false

extends Area2D

@export var return_position : Marker2D

signal play_card(card)
var selected
var card_name


# Called when the node enters the scene tree for the first time.
func _ready():
	card_name = "attack"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(selected):
		if Input.is_action_just_pressed("left_click"):
			DragAndDrop.is_dragging = true
		if(DragAndDrop.is_dragging):
			position =	get_viewport().get_mouse_position()
		if(Input.is_action_pressed("right_click")):
			selected = false
			scale = Vector2(1,1)
			var tween =  get_tree().create_tween()
			tween.tween_property(self,"global_position",return_position.position,0.2).set_ease(Tween.EASE_OUT)
		if(Input.is_action_just_released("left_click")):
			play_card.emit(card_name)
			selected = false
			DragAndDrop.is_dragging = false
			var tween =  get_tree().create_tween()
			tween.tween_property(self,"global_position",return_position.position,0.2).set_ease(Tween.EASE_OUT)
	else:
		if DragAndDrop.is_dragging and Input.is_action_just_released("left_click"):
			DragAndDrop.is_dragging = false



func _on_mouse_entered():
	if not DragAndDrop.is_dragging:
		selected = true
		scale = Vector2(1.1,1.1)


func _on_mouse_exited():
	if not DragAndDrop.is_dragging:
		selected = false
		scale = Vector2(1,1)

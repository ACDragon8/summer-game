extends Area2D

@export var return_position : Marker2D

signal play_card(name)
var selected
var card_name


# Called when the node enters the scene tree for the first time.
func _ready():
	card_name = "attack"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(selected):
		if(Input.is_action_pressed("left_click")):
			position =	get_viewport().get_mouse_position()
		if(Input.is_action_pressed("right_click")):
			position = return_position.position
		if(Input.is_action_just_released("left_click")):
			play_card.emit(card_name)
			position = return_position.position



func _on_mouse_entered():
	selected = true
	scale = Vector2(1.1,1.1)
	print("select")


func _on_mouse_exited():
	selected = false
	scale = Vector2(1,1)
	position = return_position.position
	

	print("deselect")

extends Node2D

var draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2
var initialPos: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("left_click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			DragAndDrop.is_dragging = true
		if Input.is_action_pressed("left_click"):
			
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("left_click"):
			DragAndDrop.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_dropable:
				tween.tween_property(self,"position",body_ref.position,0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self,"global_position",initialPos,0.2).set_ease(Tween.EASE_OUT)

func _on_area_2d_mouse_entered():
	if not DragAndDrop.is_dragging:
		draggable = true
		scale = Vector2(1.1,1.1)

func _on_area_2d_mouse_exited():
	if not DragAndDrop.is_dragging:
		draggable = false
		scale = Vector2(1,1)

func _on_area_2d_body_entered(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = true
		body.modulate = Color(Color.REBECCA_PURPLE,1)
		body_ref = body


func _on_area_2d_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group('dropable'):
		is_inside_dropable = false
		body.modulate = Color(Color.MEDIUM_PURPLE,0.7)

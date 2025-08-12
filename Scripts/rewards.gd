extends Window

var card_list : Array

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	card_list = ["Attack", "Defend", "Charge and Cover"]
	

extends CharacterBody2D

var player 
var speed = 25

func _ready():
	player = get_tree().get_first_node_in_group("player")
	
func _physics_process(delta):
	move(delta)
	
func move(delta):
	if player.global_position.x <= self.global_position.x:
		global_position.x -= speed * delta
	else: global_position.x += speed * delta
	
	if player.global_position.y <= self.global_position.y:
		global_position.y -= speed * delta
	else: global_position.y += speed * delta
	move_and_slide()
	


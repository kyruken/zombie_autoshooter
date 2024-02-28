extends Node2D

var damage = 1
var target
var speed = 10
var direction = Vector2.ZERO

func _physics_process(delta):
	var velocity = direction * speed
	
	global_position += velocity

func set_direction(target_direction):
	direction = target_direction


func _on_area_2d_body_entered(body):
	if body.has_node("Health"):
		var health_node = body.get_node("Health")
		print(health_node)
		health_node.take_damage(damage)

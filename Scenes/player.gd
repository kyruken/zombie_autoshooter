extends CharacterBody2D

signal player_fired_bullet

var current_target = false
var can_shoot = true

@export var bullet : PackedScene
@export var speed = 100
@export var money = 0

#Need to create a targetting system that handles multiple targets

func _ready():
	pass
	
func _physics_process(delta):
	get_input(delta)
	if current_target:
		auto_shoot(current_target)
	else:
		current_target = false

func get_input(delta):
	if Input.get_action_strength("ui_up"):
		self.position.y -= speed * delta
	
	if Input.get_action_strength("ui_down"):
		self.position.y += speed * delta
		
	if Input.get_action_strength("ui_left"):
		self.position.x -= speed * delta
		
	if Input.get_action_strength("ui_right"):
		self.position.x += speed * delta
		
func auto_shoot(target):
	if can_shoot:
		var new_bullet = bullet.instantiate()
		new_bullet.global_position = self.global_position
		
		if (current_target):
			var direction_of_target = $Firepoint.global_position.direction_to(current_target.global_position).normalized()
			emit_signal("player_fired_bullet", new_bullet, self.global_position, direction_of_target)
			can_shoot = false
		
	
func _on_area_2d_body_entered(body):
	if body != self:
		current_target = body

func _on_shoot_timer_timeout():
	can_shoot = true


func _on_area_2d_body_exited(body):
	current_target = false

#Public functions
func add_money(amount):
	money += amount
	$Control/MoneyAmount.update_money(money)

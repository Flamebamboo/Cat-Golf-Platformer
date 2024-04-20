extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0
var start_position = Vector2(160, 92)
@onready var anim = $Sprite2D
var push_force= 90.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")



func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if abs(velocity.x) > 10:
			anim.play("running")
		else:
			anim.play("idle")

	if velocity.x < 0:
		anim.flip_h = true
	else:
		anim.flip_h = false

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("jumping")

	# Get the input direction and handle movement/deceleration.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
			
func _on_area_2d_body_entered(body):
	

	
		
	if position.y > 200:
		position = start_position










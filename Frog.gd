extends RigidBody2D


var startMousePos
var endMousePos
var gravity = 98
var charging = false

export var maxDistance = 300
export var jumpPower = 1.5
export var rotateMod= 1500
export var rotateOffset = 0.1

onready var on_ground = $OnGround
onready var anim = $Sprite/AnimationPlayer
onready var sprite = $Sprite

func _ready():
	anim.play("InAir")
	pass

func _input(event):
	
	if event.is_action_pressed("Jump") and on_ground.is_colliding():
		startMousePos = get_global_mouse_position()
		charging = true
		pass
	if event.is_action_released("Jump") and charging:
		endMousePos = get_global_mouse_position()
		set_axis_velocity(getImpulse())
		startMousePos = null
		endMousePos = null
		charging = false
		anim.play("Jump")
		update()
		pass
	pass

func _process(delta):
	
	# Apply sprite flip
	if Input.is_action_pressed("Jump") and charging:
		update()
		sprite.flip_h = getImpulse().x > 0
	else:
		if abs(linear_velocity.x) > 2:
			sprite.flip_h = linear_velocity.x > 2
			
	# Apply rotation
	if on_ground.is_colliding():
		sprite.rotation = 0
	else:
		if sprite.flip_h:
			sprite.rotation = linear_velocity.y / rotateMod-rotateOffset
		else:
			sprite.rotation = -linear_velocity.y / rotateMod-rotateOffset
	
	# if landing change to Land animation
	if on_ground.is_colliding() :
		if get_node("Sprite").frame == 3:
			anim.play("Land")
		pass
	pass

func _draw():
	if charging:
	#	draw_line(Vector2(0,0),get_global_mouse_position()-startMousePos,Color(1,1,1))
		for t in range(0, 11):
			draw_circle(getFuturePos(getImpulse(),(t/14.0)),5,Color(1,0,0))
			pass
	pass

func getFuturePos(impulseVec,time):
	var final_pos = Vector2()
	final_pos.x = impulseVec.x*time
	final_pos.y = impulseVec.y*time+(gravity*gravity_scale*time*time/2)
	return final_pos
	pass

func toNumber(n):
	var numb = 0.0
	for i in range (1,floor(n)):
		numb += i
	#if (n%1.0) >(0.0):
	numb += n
	return numb

func getImpulse():
	var aim = Vector2()
	aim= startMousePos-get_global_mouse_position()
	if Vector2().distance_to(aim) > maxDistance:
		aim = aim.normalized()*maxDistance
	
	return aim*jumpPower
	pass

func _on_AnimationPlayer_animation_finished( anim_name ):
	if anim_name == "Land":
		anim.play("idle")
	if anim_name == "Jump":
		anim.play("InAir")
	pass # replace with function body
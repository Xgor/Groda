extends StaticBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#var (float) currFrame
var frogFriction = 0.8
var movingObject =null
export var speed = 30

onready var sprite = $Sprite
var currFrame = 0.0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	
	if not movingObject == null:
		if movingObject.linear_velocity.x > -speed:
			#movingObject.linear_velocity.x = -speed
		#	movingObject.friction = frogFriction
	#		pass
	#	else:
		#	movingObject.friction = 0
			
			pass
		
	
	currFrame = currFrame + delta*speed
	if sprite.vframes*sprite.hframes < currFrame:
		currFrame = 0
	#currFrame = currFrame % (sprite.vframes*sprite.hframes*1.0)
	
	sprite.frame = floor(currFrame)
	pass


func _on_Area2D_body_entered( body ):
	if body.name == "Frog":
		movingObject = body
		frogFriction = body.friction
		body.friction = 0
		
		body.linear_velocity.x = -speed
	pass # replace with function body


func _on_Area2D_body_exited( body ):
	if body.name == "Frog":
		movingObject = null
		body.friction = frogFriction
	pass # replace with function body

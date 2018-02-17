var TargetHeight = 0.0
var Height = 0.0
var Speed = 0.0

func update(dampening,tention):
	var x = TargetHeight-Height
	Speed += tension * x - Speed * dampening
	Height += Speed
extends Camera

onready var Player = get_parent()

export var mouse_sensitivity = 500

func _enter_tree():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _process(delta):
	if Input.is_action_just_pressed("esc"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _input(event):
	if event is InputEventMouseMotion:
		return mouse(event)
		
		


func mouse(event):
	Player.set_rotation(look_left_right(-event.relative.x / mouse_sensitivity))
	set_rotation(look_up_down(-event.relative.y / mouse_sensitivity))



func look_left_right(rot):
	return Player.get_rotation() +Vector3(0, rot, 0)  

func look_up_down(rot):
	var new_rot = get_rotation() +Vector3(rot, 0, 0) 
	new_rot.x = clamp(new_rot.x, PI/-2 , PI/2)
	return new_rot
	


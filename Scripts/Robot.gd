extends "res://Scripts/character.gd"

signal remove_enemy

func _ready():
	character_type = CHARACTER_TYPES.npc
	var gamestate = get_parent().get_parent()
	connect("remove_enemy", gamestate, "remove_enemy")

func _physics_process(delta):
	if $RayCast.is_colliding() and can_fire:
		fire()
		can_fire = false
		$CanFire.start()
		
func update_lives():
	if lives >= 0 :
		var heart = $Lives.get_child(0)
		heart.get_child(0).play("lose_life")

func die():
	emit_signal("remove_enemy")
	queue_free()

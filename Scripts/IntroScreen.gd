extends Control



func _on_PlayButton_pressed():
	get_tree().change_scene("res://Scenes/Customisation/CharacterCostumisaton.tscn")


func _on_QuitButton2_pressed():
	get_tree().quit()

extends Node2D


func _on_Takistused_body_entered(body):
	if body is Player:
		body.hit()

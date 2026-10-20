extends StaticBody2D

@onready var interaction_area: Area2D = $Area2D
var player_nearby: Node2D = null  # Stores the actual player object

func _ready() -> void:
	interaction_area.body_entered.connect(_on_body_entered)
	interaction_area.body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_nearby = body

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_nearby = null

func _unhandled_input(event: InputEvent) -> void:
	if player_nearby != null and event.is_action_pressed("interact"):
		give_key()

func give_key() -> void:
	if not player_nearby.has_key:
		player_nearby.has_key = true
		print("NPC: Here is the key to the tree gate!")
	else:
		print("NPC: You already have the key, go unlock the gate!")

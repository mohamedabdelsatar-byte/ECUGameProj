extends StaticBody2D

@onready var interaction_area: Area2D = $Area2D
var current_player: Node2D = null
var is_open: bool = false

func _ready() -> void:
	interaction_area.body_entered.connect(_on_body_entered)
	interaction_area.body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		current_player = body

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		current_player = null

func _unhandled_input(event: InputEvent) -> void:
	if current_player != null and event.is_action_pressed("interact") and not is_open:
		check_key_and_open()

func check_key_and_open() -> void:
	if current_player.has_key:
		print("Gate: Gate unlocked.")
		open_gate()
	else:
		print("Gate: It's locked. You need a key.")

func open_gate() -> void:
	is_open = true
	$CollisionShape2D.set_deferred("disabled", true)
	$Sprite2D.modulate.a = 0.3

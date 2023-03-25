extends Sprite2D

func _ready() -> void:
	Events.add_listener(KeyClickEvent, change_color)
	Events.add_listener(KeyClickEvent, change_color2)

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		Events.invoke(KeyClickEvent.new(event))

func change_color(event: KeyClickEvent) -> void:
	if event.click.is_action_pressed("ui_accept"):
		var tween = create_tween().tween_property(self, "modulate", Color.RED, 1.0)
		await tween.finished

func change_color2(event: KeyClickEvent) -> void:
	if event.click.is_action_pressed("ui_accept"):
		var tween = create_tween().tween_property(self, "modulate", Color.GREEN, 1.0)
		await tween.finished
		Events.remove_listener(KeyClickEvent, change_color2)


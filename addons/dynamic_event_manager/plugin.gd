@tool
extends EditorPlugin

const AUTOLOAD_NAME = "Events"

func _enter_tree() -> void:
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/dynamic_event_manager/src/event_manager.gd")

func _exit_tree() -> void:
	remove_autoload_singleton(AUTOLOAD_NAME)

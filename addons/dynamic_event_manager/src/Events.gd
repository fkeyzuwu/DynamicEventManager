extends Node

var events := {}

func add_listener(event_class: GDScript, method: Callable) -> void:
	if !events.has(event_class):
		events[event_class] = []
	
	events[event_class].push_front(method)
	
func remove_listener(event_class: GDScript, method: Callable) -> void:
	if !events.has(event_class):
		return
		
	if events[event_class].has(method):
		events[event_class].erase(method)
		
func invoke(event: Event) -> void:
	var event_class = event.get_script()
	
	if !events.has(event_class):
		return
	
	var listeners = events[event_class]
	for i in range(listeners.size() - 1, -1, -1):
		await listeners[i].call(event)

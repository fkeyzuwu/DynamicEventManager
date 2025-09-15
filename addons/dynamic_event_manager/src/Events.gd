extends Node

var events := {}

func add_listener(event_class: GDScript, method: Callable) -> void:
	if !events.has(event_class):
		events[event_class] = []
	
	events[event_class].push_front(method)
	
func remove_listener(event_class: GDScript, method: Callable) -> void:
	if !events.has(event_class):
		return
		
	if _events[event_type].has(function):
		_events[event_type].erase(function)
		if _events[event_type].size() == 0:
			_events.erase(event_type)
		
func invoke(event: Event) -> void:
	var event_class = event.get_script()
	
	if !events.has(event_class):
		return
	
	for i in range(listeners.size() - 1, -1, -1):
		var func = listeners[i] as Callable
		if func.is_null() or !func.is_valid():
			listeners.remove_at(i)
		else:
			await func.call(event)

##A Dynamic Event Manager Singleton that allows you to easily add and remove 
##listener functions to specific event types, and invoke them.
##
##This singleton is made to be an easy way to connect many parts of your codebase
##easily, with minimal coupling. you can add listeners to an event using [method add_listener], 
##remove them using [method remove_listener], and invoking an event using the [method invoke] method.[br][br]
##[b]note:[/b] This class_name is different than the singleton name so that the documentation could be generated.
##When calling the singleton in your scripts you should use [code]Events[/code].

class_name EventManager extends Node

var _events := {}

## Add a listener function to a specific event type. 
## event_type should be the class_name of a script that inherites from the [Event] class.
##[br]For example:
##[codeblock]
##		Events.add_listener(TestClass, function_name)
##[/codeblock]
##[br][b]Using scripts that do not inherit from the [Event] class will cause unexpected behaviour.[/b]
func add_listener(event_type: GDScript, function: Callable) -> void:
	if !_events.has(event_type):
		_events[event_type] = []
	
	_events[event_type].push_front(function)

## Remove a previously added listener function from a specific event type. 
func remove_listener(event_type: GDScript, function: Callable) -> void:
	if !_events.has(event_type):
		return
		
	if _events[event_type].has(function):
		_events[event_type].erase(function)
		if _events[event_type].size() == 0:
			_events.erase(event_type)

## Invoke an event by passing an instance of a class that inherites from [Event].
## This method supports await calls, meaning you can pause execution between events, 
## in order to do animations or other time based operations. 
## This method also supports removing the listeners of this event type while invoking, using [method remove_listener].
func invoke(event: Event) -> void:
	var event_type = event.get_script()
	
	if !_events.has(event_type):
		return
	
	var listeners = _events[event_type]
	for i in range(listeners.size() - 1, -1, -1):
		await listeners[i].call(event)

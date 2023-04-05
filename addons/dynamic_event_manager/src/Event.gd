##An abstract event class that works in conjunction with the [Events] singleton.
##
##This class should be inherited for specific use cases in your game.
##In case you need to pass in arguments for the event,
##you can include them inside the event itself as properties,
##and for ease of use you can also use the built-in [method Object._init] method.
##Example:
##[codeblock]
##		class_name ExampleEvent extends Event
##		
##		var str: String
##		
##		func _init(_str: String) -> void:
##		    str = _str
##[/codeblock]
class_name Event extends RefCounted


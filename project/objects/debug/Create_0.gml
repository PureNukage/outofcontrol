on = false

depth = -10000

function log(String) {
	
	var Time = "[" + string(time.stream) + "] " 
	
	var Object = string_upper(object_get_name(other.object_index))
	
	var fullString = Time + " " + Object + " " + String
	
	show_debug_message(fullString)
	
}
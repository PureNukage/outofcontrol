event_inherited()

shadow = {
	width: 36,
	height: 12,
	z: 0,
	alpha: .6,
	draw: function() {
		var oldDepth = other.depth
		other.depth = 1
		draw_set_color(c_black)
		draw_set_alpha(alpha)
		var x1 = other.x - width/2 - 1
		var y1 = other.y-height/2 + z
		var x2 = other.x+width/2
		var y2 = other.y+height/2 + z
		draw_ellipse(x1,y1, x2,y2,false)
		other.depth = oldDepth
		draw_set_alpha(1)
	}
}
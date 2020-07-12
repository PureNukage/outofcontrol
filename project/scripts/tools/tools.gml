function draw_miami(X,Y, width, height) {
	
	var palette = ds_list_create()
	
	palette[| 0] = make_color_rgb(255,211,25)
	palette[| 1] = make_color_rgb(255,144,31)
	palette[| 2] = make_color_rgb(255,41,117)
	palette[| 3] = make_color_rgb(242,34,255)
	palette[| 4] = make_color_rgb(140,30,255)
	
	if colorNext > 0 and colorNext < 5 var previousColor = palette[| colorNext-1]
	else if colorNext == 0 var previousColor = palette[| 4]
	var nextColor = palette[| colorNext]
	
	var color_red = color_get_red(color)
	var color_green = color_get_green(color)
	var color_blue = color_get_blue(color)
	
	var next_color_red = color_get_red(nextColor)
	var next_color_green = color_get_green(nextColor)
	var next_color_blue = color_get_blue(nextColor)
	
	var Lerp = 0.03
	lerpValue = lerp(lerpValue, 1, Lerp)
	color = merge_color(previousColor, nextColor, lerpValue)
	
	//debug.log("color_red: " + string(color_red))
	//debug.log("color_green: " + string(color_green))
	//debug.log("color_blue: " + string(color_blue))
	
	var totalDifference = abs(color_red - next_color_red) + abs(color_green - next_color_green) + abs(color_blue - next_color_blue)
	
	if totalDifference < 10 {
		color = nextColor
		colorNext++
		lerpValue = 0
		if colorNext >= ds_list_size(palette) colorNext = 0
	}
	
	draw_set_color(color)
	
	draw_rectangle(X,Y, X+width, Y+height, false)
	
	ds_list_destroy(palette)
	
}
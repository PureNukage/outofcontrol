shadow.draw()
//draw_set_color(c_black)
//var XX = x-16
//var YY = y
//var XX2 = x+16
//draw_ellipse(XX,YY, XX2,YY,false)


if !inControl {
	draw_self()	
} else {
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_aqua,image_alpha)	
}
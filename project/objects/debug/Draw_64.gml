if on {
	
	var XX = 30
	var YY = 200
	if input.controlledUnit > -1 with input.controlledUnit {
		draw_set_color(c_black)
		draw_text(XX,YY, "hspd: "+string(hspd))  YY += 15 
		draw_text(XX,YY, "vspd: "+string(vspd)) YY += 15 
		draw_text(XX,YY, "x: "+string(x)) YY += 15
		draw_text(XX,YY, "y: "+string(y)) YY += 15
		draw_text(XX,YY, "z: "+string(z)) YY += 15 
		draw_text(XX,YY, "groundX: "+string(groundX)) YY += 15 
		draw_text(XX,YY, "groundY: "+string(groundY)) YY += 15 
		draw_text(XX,YY, "hover: "+string(hover)) YY += 15 
	}
	
	var scale = 3
	draw_set_color(c_black)
	var xx = 15
	var yy = 0 
	draw_set_halign(fa_left)
	draw_text_transformed(xx,yy,"DEBUG: ON",scale,scale,0)	
}
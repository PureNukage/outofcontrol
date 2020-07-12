if on {
	
	var XX = 30
	var YY = 200
	draw_set_color(c_black)
	
	draw_text(XX,YY, "distance to emitter: "+string(point_distance(app.x,app.y, emitter.x,emitter.y))) YY += 15
	
	with input {
		draw_text(XX,YY, "controlledUnit: " + string(controlledUnit)) YY += 15	
	}
	
	if input.controlledUnit > -1 with input.controlledUnit {
		draw_text(XX,YY, "hspd: "+string(hspd))  YY += 15 
		draw_text(XX,YY, "vspd: "+string(vspd)) YY += 15 
		draw_text(XX,YY, "x: "+string(x)) YY += 15
		draw_text(XX,YY, "y: "+string(y)) YY += 15
		draw_text(XX,YY, "z: "+string(z)) YY += 15 
		draw_text(XX,YY, "groundX: "+string(groundX)) YY += 15 
		draw_text(XX,YY, "groundY: "+string(groundY)) YY += 15 
		draw_text(XX,YY, "hover: "+string(hover)) YY += 15 
		
		if input.controlledUnit.object_index == drone and input.controlledUnit.pickingUp > -1 {
			var p = input.controlledUnit.pickingUp
			YY += 15 
			draw_text(XX,YY, "pickedUp x: " +string(p.x)) YY += 15 
			draw_text(XX,YY, "pickedUp y: " + string(p.y)) YY += 15
			draw_text(XX,YY, "pickedUp z: " + string(p.z))	YY += 15
			draw_text(XX,YY, "pickedUp onGround: " + string(p.onGround)) YY += 15
			draw_text(XX,YY, "pickedUp groundX: "+string(p.groundX)) YY += 15
			draw_text(XX,YY, "pickedUp groundY: "+string(p.groundY)) YY += 15
			draw_text(XX,YY, "pickedUp hover: "+string(p.hover)) YY += 15
			draw_text(XX,YY, "pickedUp air: "+string(p.air)) YY += 15
		}
	}
	
	var scale = 3
	draw_set_color(c_black)
	var xx = 15
	var yy = 0 
	draw_set_halign(fa_left)
	draw_text_transformed(xx,yy,"DEBUG: ON",scale,scale,0)	
}
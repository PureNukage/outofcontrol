hackingStage = -1
hackingUnit = -1
hackingCharX = -1
hackingCharY = -1
hackingChar = -1
hackingSolvedTime = -1
hacking = false

function startHacking(ID) {
	hacking = true
	hackingUnit = ID
	game.paused = true
	hackingCharX = display_get_gui_width()/2 + 256
	hackingCharY = display_get_gui_height()/2 - 192
	hackingNumber = irandom_range(000,999)
	hackingCharIndex = 0
	hackingChar = string_char_at(string(hackingNumber),hackingCharIndex)
}

function endHacking() {
	
	hacking = false
	hackingUnit = -1
	game.paused = false
	hackingCharX = -1
	hackingCharY = -1
	hackingNumber = -1
	hackingCharIndex = -1
	hackingChar = -1
	hackingStage = -1
	hackingSolvedTime = -1
}

function drawHacking() {
	
	var centerX = display_get_gui_width()/2
	var centerY = display_get_gui_height()/2
	
	switch(hackingStage) 
	{
		//	Init
		case -1:
			hackingStage++
			debug.log("Starting to hack unit " + string(hackingUnit))
		break;	
		//	Hacking 
		case 0:
			
			var lineX = centerX - 128
			var lineY = centerY - 128
			var lineWidth = 48
			var lineHeight = 96
			
			if input.mouseRightPress {
				debug.log("Hacking was a success!")
				hackingStage = 1
				hackingSolvedTime = 120
				hackingUnit.inControl = true
				if input.controlledUnit > -1 {
					input.controlledUnit.inControl = false	
				}
				input.controlledUnit = hackingUnit
				keyboard_string = ""
				sound.playEffect(snd_assimilated)
			}
			
			if point_in_rectangle(hackingCharX,hackingCharY,lineX-lineWidth,lineY-lineHeight,lineX,lineY) {
				draw_set_color(c_yellow)		
			} else {
				draw_set_color(c_green)	
			}
			draw_rectangle(lineX-lineWidth,lineY-lineHeight,lineX,lineY,false)
			
			draw_set_halign(fa_center)
			
			var scale = 4
			draw_set_color(c_black)
			draw_text_transformed(hackingCharX,hackingCharY, string(hackingChar), scale, scale, 0)
			
			if point_in_rectangle(hackingCharX,hackingCharY,lineX-lineWidth,lineY-lineHeight,lineX,lineY) {
				hackingCharX -= 3
				debug.log("Hacking TIME TO PRESS")
				
				//debug.log("last char on keyboard_string: "+string_char_at(keyboard_string,string_length(keyboard_string)))
				
				if string_char_at(keyboard_string,string_length(keyboard_string)) == string(hackingChar) {
					if hackingCharIndex != string_length(string(hackingNumber)) {
						hackingCharIndex++
						hackingChar = string_char_at(string(hackingNumber),hackingCharIndex)
						hackingCharX = display_get_gui_width()/2 + 256
						hackingCharY = display_get_gui_height()/2 - 192
						debug.log("Hacking, solved one!")
						keyboard_string = ""
					} else {
						debug.log("Hacking was a success!")
						hackingStage = 1
						hackingSolvedTime = 120
						hackingUnit.inControl = true
						if input.controlledUnit > -1 {
							input.controlledUnit.inControl = false	
						}
						input.controlledUnit = hackingUnit
						keyboard_string = ""
						sound.playEffect(snd_assimilated)
					}
				}
			} else {
				hackingCharX -= 8
			}
			
			if hackingCharX < lineX-lineWidth - 96 {
				hackingSolvedTime = 120
				hackingStage = 2
				debug.log("Hacking failed")
				keyboard_string = ""
			}
			
		break
		//	Success hacking!
		case 1:
			
			var scale = 8
			draw_set_halign(fa_center)
			draw_set_color(c_green)
			draw_text_transformed(centerX,centerY-256,"CONTROL ASSIMILATED",scale,scale,0)
			
			if hackingSolvedTime-- == -1 gui.endHacking()
		break
		//	Failed hacking!
		case 2:
			
			var scale = 8
			draw_set_halign(fa_center)
			draw_set_color(c_red)
			draw_text_transformed(centerX,centerY-256,"CONTROL FAILED",scale,scale,0)
			
			if hackingSolvedTime-- == -1 gui.endHacking()
		break
	}
	
	
}
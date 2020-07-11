keyUp = keyboard_check(ord("W"))
keyDown = keyboard_check(ord("S"))
keyRight = keyboard_check(ord("D"))
keyLeft = keyboard_check(ord("A"))

mouseLeftPress = mouse_check_button_pressed(mb_left)

mouseRightPress = mouse_check_button_pressed(mb_right)

keySpacePress = keyboard_check_pressed(vk_space)

keyInteract = keyboard_check_pressed(ord("E"))

if keySpacePress game.paused = !game.paused

with class_player mask_index = s_person_collision
if instance_position(mouse_x,mouse_y,class_player) {
	var Instance = instance_position(mouse_x,mouse_y,class_player)
	
	//if Instance.object_index == class_player {//and !Instance.inControl {
		if input.mouseLeftPress gui.startHacking(Instance)
	//}
}
with class_player mask_index = s_person
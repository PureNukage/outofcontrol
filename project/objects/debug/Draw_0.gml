if on {
	
	if instance_exists(class_player) with class_player {
		draw_set_color(c_yellow)
		draw_circle(x,y,4,false)	
	}
	
	if instance_exists(class_obstacle) with class_obstacle {
		draw_sprite_ext(mask_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_aqua,.6)
		
		draw_set_alpha(.6)
		draw_rectangle_color(bbox_left,bbox_top+air,bbox_right,bbox_bottom+air,c_orange,c_orange,c_orange,c_orange,false)
		draw_set_alpha(1)
	}
	
	if instance_exists(ball) with ball {
		draw_set_color(c_red)
		physics_draw_debug()	
	}
	
	//draw_set_alpha(.5)
	//mp_grid_draw(grid.mpGrid)
	//draw_set_alpha(1)
	
}
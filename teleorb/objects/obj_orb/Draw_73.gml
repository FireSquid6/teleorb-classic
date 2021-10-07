if DEVELOPER_MODE && global.debug_mode
{
	//set draw
	draw_reset()
	draw_set_halign(fa_middle)
	
	//draw text
	draw_text(x,y-32,"HSPD: "+string(hspd))
	draw_text(x,y-42,"VSPD: "+string(vspd))
	
	//draw points
	draw_set_color(c_red)
	var width = 1
	draw_circle(point_top.x, point_top.y, width, false)
	draw_circle(point_right.x, point_right.y, width, false)
	draw_circle(point_left.x, point_left.y, width, false)
	draw_circle(point_bottom.x, point_bottom.y, width, false)
}
if paused
{
	draw_reset()
	draw_set_color(c_black)
	draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false)
	
	draw_reset()
	canvas.draw()
}
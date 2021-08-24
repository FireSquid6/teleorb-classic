if paused
{
	draw_reset()
	draw_set_color(c_black)
	draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false)
	
	draw_reset()
	
	var xx,yy
	xx=display_get_gui_width()*0.5
	yy=padding+(display_get_height()*0.12)
	paused_text.draw(xx,yy)
	canvas.draw()
}
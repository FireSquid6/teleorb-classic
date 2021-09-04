draw_reset()
draw_set_font(fnt_lcd)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black)
draw_rectangle(0,0,120,50,false)

draw_set_color(c_white)
var currentTime=string_format(minutes,2,0)+":"+string_format(seconds,2,0)+"."+string_format(frames,2,0)
currentTime=string_replace_all(currentTime," ","0")
draw_text(5,5,currentTime)

if hasBestTime
{
	draw_set_color(c_yellow)
	var bestTime=string_format(best_minutes,2,0)+":"+string_format(best_seconds,2,0)+"."+string_format(best_frames,2,0)
	bestTime=string_replace_all(bestTime," ","0")
	draw_text(5,20,bestTime)
}

if paused
{
	draw_reset()
	draw_set_color(c_black)
	draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false)
	
	draw_reset()
	
	var xx,yy
	xx=display_get_gui_width()*0.5
	yy=padding+(display_get_height()*0.08)
	paused_text.draw(xx,yy)
	canvas.draw()
}
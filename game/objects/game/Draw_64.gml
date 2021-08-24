if global.debug_mode
{
	draw_reset()
	draw_text(padding,padding,"MUSIC: "+ string(global.music_modifier) + "     IS PLAYING: "+string(audio_is_playing(mus_spacetrivia)))
	draw_text(padding,padding*2,"SOUND: "+ string(global.game_modifier))
	draw_text(padding,padding*3,"AMBIENT: "+ string(global.ambient_modifier))
}

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
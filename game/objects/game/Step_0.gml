//dev mode options
if DEVELOPER_MODE
{
	//delete save file
	if keyboard_check_pressed(vk_backspace)
	{
		if file_exists("file.savedgame") file_delete("file.savedgame")
		if file_exists("besttime.savedgame") file_delete("besttime.savedgame")
		show_debug_message("*****************")
		show_debug_message("GAME SAVE DELETED")
		show_debug_message("*****************")
	}
	
	//keys
	if keyboard_check(vk_lalt) room_speed=4 else room_speed=60
	
	//debug mode
	if keyboard_check_pressed(vk_enter)
	{
		global.debug_mode=!global.debug_mode
		var layid=layer_get_id("ts_collision")
		layer_set_visible(layid,global.debug_mode)
		layid=layer_get_id("lay_collision")
		layer_set_visible(layid,global.debug_mode)
		global.modui_debug=global.debug_mode
	}
	
	//reset
	if keyboard_check_pressed(ord("R"))
	{
		reset_game()
	}
}

//make sure music is playing
if !audio_is_playing(music_index) audio_play_sound(music_index,25,true)

//mute switch
//if DEVELOPER_MODE
//{
//	if keyboard_check_pressed(ord("M"))
//	{
//		muted=!muted
//		global.master_volume=muted
//		set_audio_volumes()
//	}
//}

//pause switch
if keyboard_check_pressed(vk_escape)
{
	audio_play_sound(sfx_pause,50,false)
	paused=!paused
	if paused
	{
		instance_deactivate_all(true)
	}
	else
	{
		instance_activate_all()
	}
}

if paused
{
	canvas.update(display_mouse_get_x(),display_mouse_get_y(),mouse_check_button_pressed(mb_left))
}

//timer
if !paused
{
	frames++
	if frames==60
	{
		frames=0
		seconds++
		if seconds==60
		{
			seconds=0
			minutes++
			minutes=clamp(minutes,0,99)
		}
	}
}
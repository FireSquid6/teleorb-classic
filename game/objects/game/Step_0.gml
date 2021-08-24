//dev mode options
if DEVELOPER_MODE
{
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
}

//pause switch
if keyboard_check_pressed(vk_escape)
{
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
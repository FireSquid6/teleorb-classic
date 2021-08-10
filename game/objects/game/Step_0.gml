//dev mode options
if DEVELOPER_MODE
{
	//keys
	if keyboard_check(vk_lalt) room_speed=2 else room_speed=60
	if keyboard_check_pressed(vk_escape) game_end()
	if keyboard_check_pressed(vk_tab) game_restart()
	
	//debug mode
	if keyboard_check_pressed(vk_enter)
	{
		global.debug_mode=!global.debug_mode
		layer_set_visible("ts_collision",global.debug_mode)
		layer_set_visible("lay_collision",global.debug_mode)
	}
}
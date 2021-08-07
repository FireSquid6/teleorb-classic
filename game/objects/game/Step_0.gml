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
		var layid=layer_get_id("ts_collision")
		layer_set_visible(layid,global.debug_mode)
	}
}
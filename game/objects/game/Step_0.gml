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
		layid=layer_get_id("lay_collision")
		layer_set_visible(layid,global.debug_mode)
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
	canvas.update()
}

//volume
if keyboard_check_pressed(ord("M"))
{
	muted=!muted
	if muted global.master_volume=0 else global.master_volume=1
	set_audio_volumes()
}
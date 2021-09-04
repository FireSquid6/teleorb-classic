function start_new_game()
{
	room=room_next(room_first)
	
	//set default vars
	global.spawnpoint=0
	global.slideUnlocked=false
	global.dashUnlocked=false
	global.orbUnlocked=true
	global.currentBranch=1
	global.currentLevel=1
	global.currentRoom=1
	global.game_modifier=0
	global.music_modifier=0
	
	if DEVELOPER_MODE
	{
		global.music_modifier=1
	}
}

function continue_game()
{
	room=room_get_index(global.currentLevel,global.currentBranch,global.currentRoom)
}

function play_click()
{
	audio_play_sound(sfx_click,50,false)
}

function draw_scribble_end_draw()
{
	if wasselected 
	{
		draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)
	}
	if variable_struct_exists(self,"scribble_element")
	{
		scribble_element.draw(scrib_x,scrib_y)
	}
}

function store_selected()
{
	wasselected=selected
}

function unpause()
{
	with game
	{
		paused=false
		instance_activate_all()
	}
}

function reset_game()
{
	unpause()
	file_delete("file.savedgame")
	audio_stop_all()
	room=rm_init
	instance_destroy(game)
}

function sound_settings_on_init()
{
	if sprite_index=spr_music
	{
		sound_off=global.music_modifier
	}
	else
	{
		sound_off=global.game_modifier
	}
	if sound_off current_image=2 else current_image=0
}

function sound_settings_on_update()
{
	image_index=current_image
	if selected image_index++
	
	if selected && pressed
	{
		sound_off=!sound_off 
		if sprite_index==spr_music
		{
			global.music_modifier=!global.music_modifier
		}
		else
		{
			global.game_modifier=!global.game_modifier
		}
		
		if sound_off
		{
			current_image=2
		}
		else
		{
			current_image=0
		}
		set_audio_volumes()
	}
}
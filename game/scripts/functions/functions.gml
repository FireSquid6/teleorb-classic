//requires you to set the following variables with the modui element
//scribble_element - the scribble data stuff
//scrib_x - draw x position
//scrib_y - draw y position

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
		enabled=global.music_modifier
	}
	else
	{
		enabled=global.game_modifier
	}
	if enabled current_image=2 else current_image=0
}

function sound_settings_on_update()
{
	image_index=current_image
	if selected image_index++
	
	if selected && pressed
	{
		enabled=!enabled 
		if sprite_index==spr_music
		{
			global.music_modifier=!global.music_modifier
		}
		else
		{
			global.game_modifier=!global.game_modifier
		}
		
		if enabled
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
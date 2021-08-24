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
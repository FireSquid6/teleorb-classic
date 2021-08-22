function sound_settings_on_init()
{
	enabled=true
	current_image=0
}

function sound_settings_on_update()
{
	image_index=current_image
	if selected image_index++
	
	if selected && pressed
	{
		enabled=!enabled 
		if enabled
		{
			if sprite_index==spr_music
			{
				global.music_modifier=1
				global.ambient_modifier=1
			}
			else
			{
				global.game_modifier=1
			}
			current_image=0
		}
		else
		{
			if sprite_index==spr_music
			{
				global.music_modifier=0
				global.ambient_modifier=0
			}
			else
			{
				global.game_modifier=0
			}
			current_image=2
		}
		set_audio_volumes()
	}
}
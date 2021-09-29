#region SOUND
global.master_volume=1
global.music_modifier=0
global.game_modifier=0

function set_audio_volumes()
{
	var i=0
	var name,volume
	while audio_exists(i)
	{
		name=audio_get_name(i)
		switch string_char_at(name,0)
		{
			case "a":
				volume=global.master_volume-global.music_modifier
				break
			case "m":
				volume=global.master_volume-global.music_modifier
				break
			case "s":
				volume=global.master_volume-global.game_modifier
				break
		}
		audio_sound_gain(i,volume,0)
		i++
	}
}

set_audio_volumes()

#endregion
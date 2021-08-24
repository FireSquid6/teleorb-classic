#region FONTS
scribble_font_add("fnt_lcd")

#endregion

#region PARTICLES
//wallslide trail
var p=part_type_create()
part_type_shape(p,pt_shape_pixel)
part_type_size(p,5,5,-0.2,0)
part_type_color2(p,c_white,make_color_rgb(200,200,200))
part_type_direction(p,90,90,0,0)
part_type_speed(p,4,4,0,0)

#endregion

#region SOUND
global.master_volume=1
global.music_modifier=0
global.game_modifier=0
global.ambient_modifier=0

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
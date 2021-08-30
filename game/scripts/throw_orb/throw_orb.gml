function throw_orb()
{
	mask_index=spr_orb
	var inorbwall=place_meeting(x,y,obj_orbwall)
	mask_index=spr_player_idle
	if (!thrown_orb) && canOrb && orb && !inorbwall
	{
		audio_play_sound(sfx_orb_throw,50,false)
		instance_create_layer(x, y,"lay_orb", obj_orb)
		canOrb=false
		thrown_orb=true
	}
}
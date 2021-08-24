function throw_orb()
{
	if (!thrown_orb) && canOrb && orb 
	{
		audio_play_sound(sfx_orb_throw,50,false)
		instance_create_layer(x, y-(sprite_height*0.33) ,"lay_orb", obj_orb)
		canOrb=false
		thrown_orb=true
	}
}
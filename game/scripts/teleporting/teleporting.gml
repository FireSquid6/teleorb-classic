function state_teleport()
{
	image_index-=0.3
	other_image_index+=0.3
	if image_index<=0
	{
		hspd=prev_hspd
		vspd=prev_vspd
		
		moveto_fall()
	}
}
function moveto_teleport()
{
	audio_play_sound(sfx_orb_throw,50,false)
	
	//state
	state=playerStates.teleporting
	
	//sprite
	image_speed=0
	sprite_index=spr_player_teleporting
	other_image_index=0
	image_index=image_number
	
	otherx=x
	othery=y
	
	//speed
	prev_hspd=hspd
	prev_vspd=vspd
	hspd=0
	vspd=0
}
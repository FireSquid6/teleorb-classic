function state_teleport()
{
	image_index+=0.3
	other_image_index-=0.3
	if image_index>=image_number
	{
		hspd=prev_hspd
		vspd=prev_vspd
		
		moveto_fall()
	}
}
function moveto_teleport()
{	
	//state
	state=playerStates.teleporting
	
	//sprite
	image_speed=0
	sprite_index=spr_player_teleporting
	other_image_index=image_number
	image_index=0
	
	otherx=x
	othery=y
	
	//speed
	prev_hspd=hspd
	prev_vspd=vspd
	hspd=0
	vspd=0
}
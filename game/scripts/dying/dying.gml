function state_die()
{
	canOrb=false
	onFloor=false
	image_xscale=prevxscale
	image_index+=0.2
	if image_index>=image_number room_restart()
}

function moveto_die()
{
	state=playerStates.dying
	hspd=0
	vspd=0
	canOrb=false
	
	prevxscale=image_xscale
	sprite_index=spr_player_dead
	image_index=0
	image_speed=0
}
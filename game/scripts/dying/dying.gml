function state_die()
{
	canOrb=false
	onFloor=false
	image_xscale=prevxscale
	image_index+=0.4
	if image_index>=image_number room_restart()
}

function moveto_die()
{
	state=playerStates.dying
	hspd=0
	vspd=0
	canOrb=false
	audio_play_sound(sfx_dead,50,false)
	
	prevxscale=image_xscale
	sprite_index=spr_player_dead
	image_index=0
	image_speed=0
}
function state_jump()
{		
	//handle air friction
	if lastState!=playerStates.wallriding air_friction()
	cyoteFrames=0
	
	//remove jump frames
	jumpFrames--
	
	//MOVE
	if onFloor moveto_move()
}

function moveto_jump()
{
	image_index=1
	sprite_index=spr_player_midair
	lastState=state
	state = playerStates.jumping
	vspd -= jumpSpd
	jumpFrames = maxJumpFrames
	cyoteFrames=0
}
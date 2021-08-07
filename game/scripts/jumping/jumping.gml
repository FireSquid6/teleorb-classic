function state_jump()
{		
	//handle air friction
	if lastState!=playerStates.wallriding air_friction()
	cyoteFrames=0
	
	//remove jump frames
	jumpFrames--
	
	//if jump frames = 0 or the player has stopped pressing jump, move to falling
	if !jump || jumpFrames == 0
	{
		moveto_fall()
	}
	
	//MOVE
	if onFloor moveto_move()
}

function moveto_jump()
{
	image_index=0
	image_speed=0
	sprite_index=spr_player_midair
	lastState=state
	state = playerStates.jumping
	vspd -= jumpSpd
	jumpFrames = maxJumpFrames
	cyoteFrames=0
}
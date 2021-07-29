function state_jump()
{
	//orb function again
	throw_orb()
	
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
	lastState=state
	state = playerStates.jumping
	vspd -= jumpSpd
	jumpFrames = maxJumpFrames
	cyoteFrames=0
}
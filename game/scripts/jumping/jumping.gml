function state_jump()
{
	//orb function again
	throw_orb()
	
	//handle air friction
	if airFrictionCancelFrames<1 air_friction() else airFrictionCancelFrames--
	
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
	state = playerStates.jumping
	vspd -= jumpSpd
	jumpFrames = maxJumpFrames
}
function state_jump()
{
	//orb function again
	throw_orb()
	
	
	
	//remove jump frames
	jumpFrames--
	
	//if jump frames = 0 or the player has stopped pressing jump, move to falling
	if !jump || jumpFrames == 0
	{
		moveto_fall()
	}
}

function moveto_jump()
{
	state = playerStates.jumping
	vspd -= jumpSpd
	jumpFrames = maxJumpFrames
}
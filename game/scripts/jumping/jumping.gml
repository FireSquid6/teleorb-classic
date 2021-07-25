function state_jump()
{
	//orb function again
	throw_orb()
	
	//handle air friction
	air_friction()
	
	//remove jump frames
	jumpFrames--
	
	//if jump frames = 0 or the player has stopped pressing jump, move to falling
	if !jump || jumpFrames == 0
	{
		moveto_fall()
	}
	
	//MOVE
	if onFloor moveto_move()
	
	//WALLRIDE
	if check_wallride() moveto_wallride()
	
	//DASH
	if check_dash() moveto_dash()
}

function moveto_jump()
{
	state = playerStates.jumping
	vspd -= jumpSpd
	jumpFrames = maxJumpFrames
}
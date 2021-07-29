function state_fall()
{
	throw_orb()
	
	//handle air friction
	air_friction()
	
	//walljump buffer
	if lastState==playerStates.wallriding
	{
		if walljumpBufferFrames>0 && jump_pressed walljump()
		walljumpBufferFrames--
		walljumpBufferFrames=clamp(walljumpBufferFrames,0,maxWalljumpBufferFrames)
	}
	
	//gravity
	vspd+=GRAVITY_SPD*global.gravityDir
	
	//cyote frames
	if cyoteFrames>0 && jump moveto_jump() 
	cyoteFrames--
	cyoteFrames=clamp(cyoteFrames,0,maxCyoteFrames)
	
	//MOVE
	if onFloor moveto_move()
	
	//WALLRIDE
	if check_wallride() moveto_wallride()
}

function moveto_fall()
{
	lastState=state
	state=playerStates.falling
}
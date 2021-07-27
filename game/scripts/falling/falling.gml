function state_fall()
{
	throw_orb()
	
	//handle air friction
	air_friction()
	
	//gravity
	vspd+=GRAVITY_SPD
	
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
	state=playerStates.falling
}
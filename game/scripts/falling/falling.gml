function state_fall()
{
	//handle air friction
	air_friction()
	
	//gravity
	vspd+=GRAVITY_SPD
	
	//cyote frames
	//if cyoteFrames>0 && jump moveto_jump() else cyoteFrames--
	
	//MOVE
	if onFloor moveto_move()
	
	//WALLRIDE
	if check_wallride() moveto_wallride()
}

function moveto_fall()
{
	state=playerStates.falling
	cyoteFrames=maxCyoteFrames
}
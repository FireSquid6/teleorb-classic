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
	var grav=GRAVITY_SPD
	if lastState=playerStates.jumping && vspd<0 grav*=0.5
	vspd+=grav*global.gravityDir
	vspd=clamp(vspd,-25,terminalVelocity)
	
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
	image_index=1
	sprite_index=spr_player_midair
	lastState=state
	state=playerStates.falling
}
function state_wallride()
{
	//orb
	throw_orb()
	
	//wallriding
	air_friction()
	vspd+=wallrideGrv
	
	//FALL
	if !check_wallride() moveto_fall()
	
	//JUMP
	if jump_pressed
	{
		airFrictionCancelFrames=maxAirFrctionCancelFrames
		hspd=wallrideJumpSpd*wallrideDir
		moveto_jump()
	}
	
	//MOVE
	if onFloor moveto_move()
}

function moveto_wallride()
{
	state=playerStates.wallriding
	if vspd>0 vspd=0
	cyoteFrames=0
}

function check_wallride()
{
	var i=sign(hspd)
	if place_meeting(x+i,y,obj_wall) && move!=0
	{
		wallrideDir=i
		return true
	}
	
	return false
}
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
	vspd=0
}

function check_wallride()
{
	if (tilemap_get_at_pixel(global.collisionMap,bbox_left-1,bbox_top) || tilemap_get_at_pixel(global.collisionMap,bbox_left-1,bbox_bottom))
	{
		wallrideDir=-1
		return true
	}
	if (tilemap_get_at_pixel(global.collisionMap,bbox_right+1,bbox_top) || tilemap_get_at_pixel(global.collisionMap,bbox_right+1,bbox_bottom))
	{
		wallrideDir=1
		return true
	}
	
	return false
}
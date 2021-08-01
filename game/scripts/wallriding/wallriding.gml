function state_wallride()
{
	//orb
	throw_orb()
	
	//wallriding
	vspd+=wallrideGrv
	air_friction()
	
	//FALL
	if !check_wallride() 
	{
		moveto_fall()
		walljumpBufferFrames=maxWalljumpBufferFrames
	}
	
	//JUMP
	if jump_pressed
	{
		walljump()
	}
	
	//MOVE
	if onFloor moveto_move()
}

function moveto_wallride()
{
	image_index=1
	sprite_index=spr_player_wallsliding
	lastState=state
	state=playerStates.wallriding
	if vspd>0 vspd=0
	cyoteFrames=0
}

function check_wallride()
{
	if keyboard_check(vk_shift)
	{
		imposter="sus"
	}
	var i=sign(hspd)
	if i==1 var bbox=bbox_right+i else var bbox=bbox_left+i
	var colpoint=collision_point(bbox,bbox_top,obj_wall,false,true)
	if place_meeting(x+i,y,obj_wall) && move!=0 && colpoint
	{
		wallrideDir=i
		return true
	}
	
	return false
}

function walljump()
{
	airFrictionCancelFrames=maxAirFrctionCancelFrames
	hspd=wallrideJumpSpd*wallrideDir
	vspd=0
	vspd_frac=0
	moveto_jump()
}
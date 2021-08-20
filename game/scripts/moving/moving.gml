function state_move()
{
	//sprite management
	if move==0
	{
		sprite_index=spr_player_idle
		image_speed=0.25
	}
	else
	{
		sprite_index=spr_player_walking
		image_speed=0.7
	}
	
	//cyote frames
	cyoteFrames=5
	
	//set vspd to 0
	vspd = 0
	vspd_frac=0
	
	//ACCELERATION
	//if the player is holding down the move keys, accelerate
	if move != 0
	{
		//change direction
		if move!=sign(hspd) hspd=0
		
		//make sure that hspd won't grow bigger than it should
		if abs(hspd)+accSpd<=maxAcceleration
		{
			//accelerate
			hspd += (accSpd * move)
		}
		//check if hspd should be rounded up to max acceleration
		else if abs(hspd)>=maxAcceleration-accSpd && abs(hspd)<=maxAcceleration
		{
			hspd = maxAcceleration * sign(hspd)
		}
		
		//decelerate if the player is going really fast
		if abs(hspd)>maxAcceleration
		{
			hspd -= accSpd * sign(hspd)
		}
	}
	//if the player isn't holding down the move keys, deaccelerate
	else if move==0
	{
		//check if floor to 0
		if abs(hspd) <= accSpd 
		{
			hspd = 0
		}
		//otherwise, subtract acceleration
		else
		{
			hspd -= accSpd * sign(hspd)
		}
	}
	
	//JUMP
	if jump moveto_jump()
	
	//FALL
	if !onFloor moveto_fall()
}

function moveto_move()
{
	lastState=state
	canOrb=true
	state=playerStates.moving
}
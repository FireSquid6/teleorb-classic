function state_move()
{
	//cyote frames
	cyoteFrames=5
	
	//set vspd to 0
	vspd = 0
	
	//do the orb function
	throw_orb()
	
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
	canOrb=true
	state=playerStates.moving
}
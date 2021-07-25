function state_move()
{
	//do the orb function
	throw_orb()
	
	//ACCELERATION
	//if the player is holding down the move keys, accelerate
	if move != 0
	{
		//make sure that hspd won't grow bigger than it should
		if abs(hspd+accSpd)<=maxAcceleration
		{
			//accelerate
			hspd += (accSpd * move)
		}
	}
	//if the player isn't holding down the move keys, deaccelerate
	else
	{
		//check if floor to 0
		if abs(hspd) <= accSpd 
		{
			hspd = 0
		}
		//otherwise, subtract acceleration
		else
		{
			hspd -= accSpd * move
		}
	}
	
	//JUMP
	if jump moveto_jump()
	
	//DASH
	if dash moveto_dash()
}

function moveto_move()
{
	state=playerStates.moving
}
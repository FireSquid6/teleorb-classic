function state_move()
{
	//sprite management
	if move==0
	{
		sprite_index=spr_player_idle
		image_index+=0.05
	}
	else
	{
		sprite_index=spr_player_walking
		image_index+=0.2
	}
	
	//cyote frames
	cyoteFrames=5
	
	//set vspd to 0
	vspd = 0
	vspd_frac=0
	
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
	lastState=state
	canOrb=true
	state=playerStates.moving
}
function air_friction()
{
	//check if moving
	if move != 0 
	{
		//make sure that hspd won't grow
		if abs(hspd+airFriction)<=maxAcceleration
		{
			hspd += (airFriction * move)
		}
	}
	//if not moving, decelerate
	else
	{
		if abs(hspd) <= airFriction hspd = 0 else hspd -= airFriction * sign(hspd)
	}
}
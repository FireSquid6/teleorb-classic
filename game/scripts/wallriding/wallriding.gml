function state_wallride()
{
	//orb
	throw_orb()
	
	//MOVE
	if onFloor moveto_move()
}

function moveto_wallride()
{
	state=playerStates.wallriding
}

function check_wallride()
{
	return false
}
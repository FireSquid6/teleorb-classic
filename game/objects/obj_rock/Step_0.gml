if active
{
	y+=ROCK_SPD
	if place_meeting(x,y,obj_player)
	{
		with obj_player
		{
			moveto_die()
		}
	}
}
if place_meeting(x,y,obj_player) && !used && obj_player.use
{
	used=false
	switch unlock
	{
		case 0:
			global.orbUnlocked=true
			break
		case 1:
			global.dashUnlocked=true
			break
		case 2:
			global.slideUnlocked=true
			break
	}
}
states.step()
if obj_player.state != playerStates.dying && place_meeting(x, y, obj_player)
{
	with obj_player {moveto_die()}
}
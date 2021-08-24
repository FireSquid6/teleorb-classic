switch state
{
	case GIZMO_STATES.ALIVE:
		if place_meeting(x,y,obj_player)
		{
			onCollision()
			state=GIZMO_STATES.DEAD
		}
		break
	case GIZMO_STATES.DEAD:
		image_xscale-=GIZMO_FADEOUT_SPEED
		image_yscale-=GIZMO_FADEOUT_SPEED
		if image_xscale<=0 instance_destroy()
		
		break
}
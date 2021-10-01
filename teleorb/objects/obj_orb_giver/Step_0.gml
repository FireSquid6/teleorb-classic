switch state
{
	case GIZMO_STATES.ALIVE:
		if image_xscale < 1
		{
			image_xscale += GIZMO_FADEOUT_SPEED
			image_yscale += GIZMO_FADEOUT_SPEED
		}
		else
		{
			image_xscale = 1
			image_yscale = 1
		}
		
		if place_meeting(x,y,obj_player)
		{
			onCollision()
			state=GIZMO_STATES.DYING
			time = GIZMO_DEAD_TIME
			audio_play_sound(sfx_powerup,50,false)
		}
		break
	case GIZMO_STATES.DYING:
		image_xscale-=GIZMO_FADEOUT_SPEED
		image_yscale-=GIZMO_FADEOUT_SPEED
		
		if image_xscale || image_yscale <= 0
		{
			time = GIZMO_DEAD_TIME
			state = GIZMO_STATES.DEAD
		}
		break
	case GIZMO_STATES.DEAD:
		image_xscale = 0
		image_yscale = 0
		time--
		if time == 0
		{
			state = GIZMO_STATES.ALIVE
		}
		break
}
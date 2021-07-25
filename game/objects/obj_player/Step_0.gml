//setup vars
move = keyboard_check(ord("A")) - keyboard_check(ord("D"));
jump = keyboard_check(vk_space)
onFloor = tile_meeting(x, y-1, global.collisionMap)
thrown_orb = mouse_check_button_pressed(mb_left)
dash = mouse_check_button_pressed(mb_right)

//state
switch state
{
	case playerStates.moving:
		state_move()
		break
	case playerStates.wallriding:
		state_wallride()
		break
	case playerStates.jumping:
		state_jump()
		break
	case playerStates.dashing:
		state_dash()
		break
	case playerStates.falling:
		state_fall()
		break
}

//lastmove
lastMove=move
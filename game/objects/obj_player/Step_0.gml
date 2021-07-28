//setup vars
move = keyboard_check(ord("D")) - keyboard_check(ord("A"));
jump = keyboard_check(vk_space)
jump_pressed = keyboard_check_pressed(vk_space)
onFloor = place_meeting(x,y+1,obj_wall)
orb = mouse_check_button_pressed(mb_left)

//set image xscale
if move!=0 image_xscale=move

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
	case playerStates.falling:
		state_fall()
		break
}

//move self
move_self()

//lastmove
lastMove=move
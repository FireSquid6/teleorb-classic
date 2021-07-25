//setup vars

if keyboard_check_pressed(vk_lshift) 
{
	imposter="sus"
}

move = keyboard_check(ord("D")) - keyboard_check(ord("A"));
jump = keyboard_check(vk_space)

onFloor = (tilemap_get_at_pixel(global.collisionMap,bbox_right,bbox_bottom+1) == 1 
		|| tilemap_get_at_pixel(global.collisionMap,bbox_left,bbox_bottom+1) == 1)
thrown_orb = mouse_check_button_pressed(mb_left)
dash = mouse_check_button_pressed(mb_right)

if keyboard_check_pressed(ord("S")) y++

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

//move self
move_self()

//lastmove
lastMove=move
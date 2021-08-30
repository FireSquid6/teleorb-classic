//setup vars
move = keyboard_check(ord("D")) - keyboard_check(ord("A"));
jump = keyboard_check(vk_space)
jump_pressed = keyboard_check_pressed(vk_space)
onFloor = place_meeting(x,y+global.gravityDir,obj_wall)
wallgrab = keyboard_check(vk_lshift)
wallgrab_released=keyboard_check_released(vk_shift)


if global.orbUnlocked orb = mouse_check_button_pressed(mb_left)
if global.dashUnlocked dash = mouse_check_button_pressed(mb_right)
if global.slideUnlocked slide = keyboard_check(vk_lcontrol)

//set image xscale
if move!=0 image_xscale=move

//set image yscale
image_yscale=global.gravityDir

//orb
throw_orb()

//add fractions
hspd+=hspd_frac
vspd+=vspd_frac

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
	case playerStates.teleporting:
		state_teleport()
		break
	case playerStates.dying:
		state_die()
		break
}

//move self
move_self()

//lastmove
lastMove=move
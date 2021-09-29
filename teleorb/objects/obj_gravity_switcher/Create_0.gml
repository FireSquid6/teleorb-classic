event_inherited()
onCollision=function()
{
	global.gravityDir*=-1
	with obj_gravity_switcher
	{
		image_angle+=180
	}
}
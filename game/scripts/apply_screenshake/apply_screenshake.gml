function apply_screenshake(_amount,_dir)
{
	if instance_exists(camera)
	{
		camera.shake_amount+=_amount
		camera.shake_dir=_dir
		
		return true
	}
	else return false
}
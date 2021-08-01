//platform
if doPlatformChecking
{
	var yy=obj_player.bbox_bottom
	with obj_platform
	{
		if yy<y
		{
			mask_index=spr_platform
		}
		else 
		{
			mask_index = -1
		}
	}
}
function move_self()
{
	var bbox_side
	var colmap=global.collisionMap
	
	//collision check x
	if(hspd>0) bbox_side=bbox_right else bbox_side=bbox_left
	if (tilemap_get_at_pixel(colmap,bbox_side+hspd,bbox_top) !=0)
	|| (tilemap_get_at_pixel(colmap,bbox_side+hspd,bbox_bottom) !=0)
	{
		if (hspd>0)
		{
			x=x-(x mod 32) + (31) - (bbox_right-x)
		}
		else
		{
			x=x-(x mod 32) - (bbox_left-x)
		}
		hspd=0
	}

	//move x
	x+=floor(hspd)

	//collision check y
	if (vspd>0) bbox_side=bbox_bottom else bbox_side=bbox_top
	if (tilemap_get_at_pixel(colmap,bbox_left,bbox_side+vspd) !=0)
	|| (tilemap_get_at_pixel(colmap,bbox_right,bbox_side+vspd) !=0)
	{
		if (vspd>0)
		{
			y=y-(y mod 32) + (31) - (bbox_bottom-y)
		}
		else
		{
			y=y-(y mod 32) - (bbox_top-y)
		}
		vspd=0
	}

	//move y
	if global.gravityDir=1 y+=floor(vspd) else y+=ceil(vspd)
}
function tile_meeting(xx,yy,tilemap)
{
	//save position
	var xp=x
	var yp=y
	
	//move to pos
	x=xx
	y=yy
	
	//check if meeting
	var meeting=
		(tilemap_get_at_pixel(tilemap,bbox_right,bbox_top)==1)
		|| 
		(tilemap_get_at_pixel(tilemap,bbox_right,bbox_bottom)==1)
		|| 
		(tilemap_get_at_pixel(tilemap,bbox_left,bbox_top)==1)
		|| 
		(tilemap_get_at_pixel(tilemap,bbox_left,bbox_bottom)==1)
	
	//move back
	x=xp
	y=yp
	
	//return
	return meeting
}
var found_collision=false
var colmap=global.collisionMap
var bbox_x,bbox_y

if tile_meeting(x,y,global.collisionMap)
{
	//get bbox
	if tilemap_get_at_pixel(global.collisionMap,bbox_right,bbox_top)
	{
		bbox_x=bbox_right
		bbox_y=bbox_top
	}
	if tilemap_get_at_pixel(global.collisionMap,bbox_left,bbox_top)
	{
		bbox_x=bbox_left
		bbox_y=bbox_top
	}
	
	
}

//move x
x+=hspd
x=floor(x)

//move y
y+=vspd
y=floor(y)
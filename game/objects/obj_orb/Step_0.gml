var foundcol=false
var bbox_y,bbox_x,bbox_dif

//x collision
if place_meeting(x+hspd,y,obj_wall)
{
	var s=sign(hspd)
	
	//move
	while !place_meeting(x+s,y,obj_wall) {x+=s}
	
	//move player to position
	obj_player.x=floor(x)
	
	//move player out of position
	with obj_player
	{
		//figure out which bbox is in a wall
		if collision_line(bbox_left,bbox_top,bbox_left,bbox_bottom,obj_wall,false,true) 
		{
			bbox_x=bbox_left 
		}
		else 
		{
			bbox_x=bbox_right
		}
	}
	
	//set to collision
	foundcol=true
}

x+=hspd

//y collision
if place_meeting(x,y+vspd,obj_wall)
{
	var s=sign(vspd)
	
	//move
	while !place_meeting(x,y+s,obj_wall) {y+=s}
	
	//move player to position
	obj_player.y=floor(y)
	
	//move player out of position
	with obj_player
	{
		while place_meeting(x,y,obj_wall) 
		{
			y-=s
		}
	}
	
	//set to collision
	foundcol=true
}

y+=vspd

//destroy
if foundcol instance_destroy(id)
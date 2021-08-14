var foundcol=false
var bbox_y,bbox_x,xmove,ymove,bbox

//x collision
if place_meeting(x+hspd,y,obj_wall)
{
	var s=sign(hspd)
	
	//move
	while !place_meeting(x+s,y,obj_wall) {x+=s}
	
	//move player to position
	obj_player.y=floor(y)
	
	//move player out of position
	with obj_player
	{
		//figure out which bbox is in a wall
		if collision_line(bbox_left,bbox_top,bbox_left,bbox_bottom,obj_wall,false,true) 
		{
			bbox_x="bbox_left"
			xmove=1
		}
		else 
		{
			bbox_x="bbox_right"
			xmove=-1
		}
		
		//move out
		bbox=variable_instance_get(id,bbox_x)
		while collision_line(bbox,bbox_top,bbox,bbox_bottom,obj_wall,false,true) 
		{
			bbox=variable_instance_get(id,bbox_x)
			x+=xmove
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
		//figure out which bbox is in a wall
		if collision_line(bbox_left,bbox_top,bbox_right,bbox_top,obj_wall,false,true) 
		{
			bbox_y="bbox_top"
			ymove=1
		}
		else 
		{
			bbox_y="bbox_bottom"
			ymove=-1
		}
		
		//move out
		bbox=variable_instance_get(id,bbox_y)
		while collision_line(bbox_left,bbox,bbox_right,bbox,obj_wall,false,true) 
		{
			bbox=variable_instance_get(id,bbox_y)
			y+=ymove
		}
	}
	
	//set to collision
	foundcol=true
}

y+=vspd

//destroy
if foundcol instance_destroy(id)
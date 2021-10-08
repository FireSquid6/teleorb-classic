#region BAD OLD CODE
/* 
var bbox_x=-5,bbox_y=-5,bbox_x_name=-5,bbox_y_name=-5,movex=-5,movey=-5,hcol_moved=-5,vcol_moved=-5,hcol_move_type=0,vcol_move_type=0

var hcol=place_meeting(x+hspd,y,obj_orbwall)
var vcol=place_meeting(x,y+vspd,obj_orbwall)
var line_bottom=-1
var line_top=-1
var line_right=-1
var line_left=-1

angle+=4*sign(hspd)

//figure out if there is a collision
if hcol || vcol
{	
	//remove the decimal from x
	x=round(x)
	y=round(y)
	
	//check if in a wall
	var skip_collisions=false
	var corners = "no special collision"
	if place_meeting(x,y,obj_orbwall)
	{
		skip_collisions=true
		
		//figure out which corner is in the wall
		var _top_left=(collision_point(bbox_left,bbox_top,obj_orbwall,false,true)!=noone)
		var _top_right=(collision_point(bbox_right,bbox_top,obj_orbwall,false,true)!=noone)
		var _bottom_left=(collision_point(bbox_left,bbox_bottom,obj_orbwall,false,true)!=noone)
		var _bottom_right=(collision_point(bbox_right,bbox_bottom,obj_orbwall,false,true)!=noone)
		
		//if three corners are in a wall, choose the correct one
		if _top_left + _top_right + _bottom_left + _bottom_right == 3
		{
			corners = 3
			_top_left=!_top_left
			_top_right=!_top_right
			_bottom_left=!_bottom_left
			_bottom_right=!_bottom_right
		}
		
		//if only one corner is in a wall
		if _top_left + _top_right + _bottom_left + _bottom_right < 2
		{
			if corners !=3 corners = 1
			
			var dirx,diry
			hcol_moved=true
			vcol_moved=true
			
			//stupid dumb else if statement because im lazy
			if _top_left
			{
				dirx=1
				diry=1
			}
			else if _top_right
			{
				dirx=-1
				diry=1
			}
			else if _bottom_left
			{
				dirx=1
				diry=-1
			}
			else
			{
				dirx=-1
				diry=-1
			}
			
			//move out
			while place_meeting(x,y,obj_orbwall)
			{
				x+=dirx
				y+=diry
			}
		}
		//if a side is in the wall
		else if _top_left + _top_right + _bottom_left + _bottom_right == 2
		{
			corners = 2
			
			//get dir
			diry=0
			dirx=0
			if _top_left && _top_right diry=-1 else if _bottom_right && _bottom_left diry=1
			if _top_left && _bottom_left dirx=1 else if _top_right && _bottom_right diry=-1
			
			//set moved
			hcol_moved=clamp(dirx,0,1)
			vcol_moved=clamp(diry,0,1)

			//move out
			while place_meeting(x,y,obj_orbwall)
			{
				x+=dirx
				y+=diry
			}
		}
	}
	
	//horizontal collision
	var hcol_loops=0
	if hcol
	{
		movex=sign(hspd)
		if !skip_collisions
		{
			while !place_meeting(x+movex,y,obj_orbwall) 
			{
				x+=movex
				hcol_loops++
			}
		}
		hcol_moved=true
		hcol_move_type=1
	}
	else
	{
		line_right=(collision_line(x,y,bbox_right+ORB_SNAP_DISTANCE,y,obj_orbwall,false,true)!=noone)
		line_left=(collision_line(x,y,bbox_left-ORB_SNAP_DISTANCE,y,obj_orbwall,false,true)!=noone)
		if line_right xor line_left
		{
			
			if line_right movex=1 else movex=-1
			if !skip_collisions
			{
				while !place_meeting(x+movex,y,obj_orbwall) 
				{
					x+=movex
					hcol_loops++
				}
			}
			hcol_moved=true
			hcol_move_type=2
		}
		else
		{
			hcol_moved=false
			
		}
	}
	
	//vertical collision
	var vcol_loops=0
	if vcol
	{
		movey=sign(vspd)
		if !skip_collisions
		{
			while !place_meeting(x,y+movey,obj_orbwall) 
			{
				y+=movey
				vcol_loops++
			}
		}
		vcol_moved=true
		vcol_move_type=1
	}
	else
	{
		line_top=(collision_line(x,y,x,y-ORB_SNAP_DISTANCE,obj_orbwall,false,true)!=noone)
		line_bottom=(collision_line(x,y,x,y+ORB_SNAP_DISTANCE,obj_orbwall,false,true)!=noone)
		
		if line_top xor line_bottom
		{
			if line_bottom movey=1 else movey=-1
			if !skip_collisions
			{
				while !place_meeting(x,y+movey,obj_orbwall) 
				{
					y+=movey
					vcol_loops++
				}
			}
			vcol_moved=true
			vcol_move_type=2
		}
		else
		{
			vcol_moved=false
			
		}
	}
	
	//set collision variables
	if hcol_moved
	{
		if movex==1
		{
			bbox_x=bbox_right
			bbox_x_name="bbox_right"
		}
		else
		{
			bbox_x=bbox_left
			bbox_x_name="bbox_left"
		}
	}
	
	//set collision variables
	if vcol_moved
	{
		if movey==1
		{
			bbox_y=bbox_bottom
			bbox_y_name="bbox_bottom"
		}
		else
		{
			bbox_y=bbox_top
			bbox_y_name="bbox_top"
		}
	}
	
	//move the player
	with obj_player
	{
		//play sound
		audio_play_sound(sfx_orb_hit,50,false)
		
		//if the player is traveling downwards, set vspd to 0
		//This is to make speed conversion feel right
		if vspd>0 vspd=0
		
		//add speeds
		hspd+=other.hspd*0.5
		vspd+=other.vspd*0.5
		
		//move the player
		moveto_teleport()
		x=other.x
		y=other.y
		
		var xreps=0
		var yreps=0
		
		//move player bbox to orb bbox
		var mybbox
		if hcol_moved
		{
			mybbox=variable_instance_get(id,bbox_x_name)
			while mybbox!=bbox_x
			{
				x-=movex
				mybbox=variable_instance_get(id,bbox_x_name)
				xreps++
			}
		}
		
		if vcol_moved
		{
			mybbox=variable_instance_get(id,bbox_y_name)
			while mybbox!=bbox_y
			{
				y-=movey
				mybbox=variable_instance_get(id,bbox_y_name)
				yreps++
			}
		}
	}
	
	//output data
	show_debug_message(string(corners))
	
	//kill self
	instance_destroy()
}
*/
#endregion

#region NEW SICK CODE THAT USES A SICK 4 POINT COLLISION SYSTEM

var collision_top = collision_point(point_top.x, point_top.y, obj_orbwall, false, true)
var collision_right = collision_point(point_right.x, point_right.y, obj_orbwall, false, true)
var collision_left = collision_point(point_left.x, point_left.y, obj_orbwall, false, true)
var collision_bottom = collision_point(point_bottom.x, point_bottom.y, obj_orbwall, false, true)



#endregion

//move self
x+=hspd
y+=vspd

//set points
var half_width = (bbox_right - bbox_left) div 2
var half_height = (bbox_bottom - bbox_top) div 2

point_top = new vec2(bbox_left + half_width, bbox_top)
point_left = new vec2(bbox_left, bbox_top + half_height)
point_right = new vec2(bbox_right, bbox_top + half_height)
point_bottom = new vec2(bbox_left + half_width, bbox_bottom)
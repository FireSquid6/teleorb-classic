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
	if place_meeting(x,y,obj_orbwall)
	{
		//figure out which corner is in the wall
		var _top_left=(collision_point(bbox_left,bbox_top,obj_orbwall,false,true)!=noone)
		var _top_right=(collision_point(bbox_right,bbox_top,obj_orbwall,false,true)!=noone)
		var _bottom_left=(collision_point(bbox_left,bbox_bottom,obj_orbwall,false,true)!=noone)
		var _bottom_right=(collision_point(bbox_right,bbox_bottom,obj_orbwall,false,true)!=noone)
		
		//if three corners are in a wall, choose the correct one
		if _top_left + _top_right + _bottom_left + _bottom_right == 3
		{
			_top_left=!_top_left
			_top_right=!_top_right
			_bottom_left=!_bottom_left
			_bottom_right=!_bottom_right
		}
		
		//if only one corner is in a wall
		if _top_left + _top_right + _bottom_left + _bottom_right < 2
		{
			var dirx,diry
			
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
			
		}
	}
	
	//horizontal collision
	var hcol_loops=0
	if hcol
	{
		movex=sign(hspd)
		while !place_meeting(x+movex,y,obj_orbwall) 
		{
			x+=movex
			hcol_loops++
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
			while !place_meeting(x+movex,y,obj_orbwall) 
			{
				x+=movex
				hcol_loops++
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
		while !place_meeting(x,y+movey,obj_orbwall) 
		{
			y+=movey
			vcol_loops++
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
			while !place_meeting(x,y+movey,obj_orbwall) 
			{
				y+=movey
				vcol_loops++
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
		
		//if the player is still in a wall, cry about it
		if place_meeting(x,y,obj_wall)
		{
			show_debug_message("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ORB MOVE RESULTS - PLAYER WAS FOUND IN WALL !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		}	
		else
		{
			show_debug_message("****************************** ORB MOVE RESULTS - PLAYER NOT FOUND IN WALL ******************************")
		}
		
		//cry about it harder
		show_debug_message("bbox_left: "+string(bbox_left))
		show_debug_message("bbox_right: "+string(bbox_right))
		show_debug_message("bbox_top: "+string(bbox_top))
		show_debug_message("bbox_bottom: "+string(bbox_bottom))
		show_debug_message("bbox_x_name: "+string(bbox_x_name))
		show_debug_message("bbox_y_name: "+string(bbox_y_name))
		show_debug_message("movex: "+string(movex))
		show_debug_message("movey: "+string(movey))
		show_debug_message("bbox_x: "+string(bbox_x))
		show_debug_message("bbox_y: "+string(bbox_y))
		show_debug_message("hcol: "+string(hcol))
		show_debug_message("vcol: "+string(vcol))
		show_debug_message("xreps: "+string(xreps))
		show_debug_message("yreps: "+string(yreps))
		show_debug_message("hspd: "+string(other.hspd))
		show_debug_message("vspd: "+string(other.vspd))
		show_debug_message("hcol_moved: "+string(hcol_moved))
		show_debug_message("vcol_moved: "+string(vcol_moved))
		show_debug_message("hcol_moved_type: "+string(hcol_move_type))
		show_debug_message("vcol_moved_type: "+string(vcol_move_type))
		show_debug_message("line_left: "+string(line_left))
		show_debug_message("line_top: "+string(line_top))
		show_debug_message("line_bottom: "+string(line_bottom))
		show_debug_message("line_right: "+string(line_right))
		show_debug_message("hcol_loops: "+string(hcol_loops))
		show_debug_message("vcol_loops: "+string(vcol_loops))
	}
	
	//kill self
	instance_destroy()
}

//move self
x+=hspd
y+=vspd
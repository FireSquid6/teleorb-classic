var bbox_x=-5,bbox_y=-5,bbox_x_name=-5,bbox_y_name=-5,movex=-5,movey=-5,hcol_moved=-5,vcol_moved=-5

var hcol=place_meeting(x+hspd,y,obj_orbwall)
var vcol=place_meeting(x,y+vspd,obj_orbwall)

angle+=4*sign(hspd)

//figure out if there is a collision
if hcol || vcol
{	
	x=floor(x)
	y=floor(y)
	
	//horizontal collision
	if hcol
	{
		movex=sign(hspd)
		while !place_meeting(x+movex,y,obj_orbwall) {x+=movex}
		hcol_moved=true
	}
	else
	{
		var line_right=collision_line(x,y,bbox_right+ORB_SNAP_DISTANCE,y,obj_orbwall,false,true)
		var line_left=collision_line(x,y,bbox_left-ORB_SNAP_DISTANCE,y,obj_orbwall,false,true)
		if line_right || line_left
		{
			
			if line_right movex=1 else movex=-1
			while !place_meeting(x+movex,y,obj_orbwall) {x+=movex}
			hcol_moved=true
		}
		else
		{
			hcol_moved=false
		}
	}
	
	//vertical collision
	if vcol
	{
		movey=sign(vspd)
		while !place_meeting(x,y+movey,obj_orbwall) {y+=movey}
		vcol_moved=true
	}
	else
	{
		var line_top=collision_line(x,y,x,y-ORB_SNAP_DISTANCE,obj_orbwall,false,true)
		var line_bottom=collision_line(x,y,x,y+ORB_SNAP_DISTANCE,obj_orbwall,false,true)
		
		if line_top || line_bottom
		{
			if line_bottom movey=1 else movey=-1
			while !place_meeting(x,y+movey,obj_orbwall) {y+=movey}
			vcol_moved=true
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
			show_debug_message("******************************** KILL ME NOW ******************************")
			
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
			show_debug_message("hcol_moved"+string(hcol_moved))
			show_debug_message("vcol_moved"+string(vcol_moved))
		}
	}
	
	//kill self
	instance_destroy()
}

//move self
x+=hspd
y+=vspd
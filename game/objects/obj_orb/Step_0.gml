var foundcol=false
var s,bbox_x,bbox_y,bbox_x_name,bbox_y_name

var hcol=place_meeting(x+hspd,y,obj_orbwall)
var vcol=place_meeting(x,y+vspd,obj_orbwall)

angle+=3*sign(hspd)

//figure out if there is a collision
if hcol || vcol
{	
	//move
	if hcol
	{
		x=floor(x)
		y=floor(y)
		s=sign(hspd)
		while !place_meeting(x+s,y,obj_orbwall) {x+=s}
	}
	
	if vcol
	{
		y=floor(y)
		x=floor(x)
		s=sign(vspd)
		while !place_meeting(x,y+s,obj_orbwall) {y+=s}
	}
	
	//set to collision found
	foundcol=true
}
if foundcol
{
	//get the dir to move
	var movex=sign(hspd)
	var movey=sign(vspd)
	
	//get the correct bbox to move to and the name
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
		
		//move player bbox to orb bbox
		var mybbox=variable_instance_get(id,bbox_x_name)
		while mybbox!=bbox_x
		{
			x-=movex
			mybbox=variable_instance_get(id,bbox_x_name)
		}
		
		mybbox=variable_instance_get(id,bbox_y_name)
		while mybbox!=bbox_y
		{
			y-=movey
			mybbox=variable_instance_get(id,bbox_y_name)
		}
		
		//check if player is still in a wall
		if place_meeting(x,y,obj_wall)
		{
			//figure out why the player is stuck in a wall
			
			//move accordingly
		}
	}
	
	//kill self
	instance_destroy()
}

//move self
x+=hspd
y+=vspd
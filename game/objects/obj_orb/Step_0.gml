var foundcol=false
var s

var hcol=place_meeting(x+hspd,y,obj_orbwall)
var vcol=place_meeting(x,y+vspd,obj_orbwall)

angle+=3*sign(hspd)

//figure out if there is a collision
if hcol || vcol
{	
	//move
	if hcol
	{
		s=sign(hspd)
		while !place_meeting(x+s,y,obj_orbwall) {x+=s}
	}
	
	if vcol
	{
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
	
	var playerposx,playerposy,playerxbbox,playerybbox
	
	//get the correct bbox to move to
	if movex==1 
	{
		playerposx=bbox_right 
		playerxbbox="bbox_right"
	}
	else 
	{
		playerposx=bbox_left
		playerxbbox="bbox_left"
	}
	
	if movey==1 
	{
		playerposy=bbox_bottom
		playerybbox="bbox_bottom"
	}
	else 
	{
		playerposy=bbox_top
		playerybbox="bbox_top"
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
		
		//snap the player
		while variable_instance_get(id,playerxbbox)!=playerposx {x+=movex}
		while variable_instance_get(id,playerybbox)!=playerposy {y+=movey}
	}
	
	//kill self
	instance_destroy()
}

//move self
x+=hspd
y+=vspd
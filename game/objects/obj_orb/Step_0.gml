var foundcol=false

//x collision
if place_meeting(x+hspd,y,obj_wall)
{
	while !place_meeting(x+sign(hspd),y,obj_wall) {x+=sign(hspd)}
	hspd=0
	foundcol=true
	obj_player.x=x
	obj_player.y=y
}

x+=hspd
x=floor(x)

//y collision
if place_meeting(x,y+vspd,obj_wall)
{
	while !place_meeting(x,y+sign(vspd),obj_wall) {y+=sign(vspd)}
	vspd=0
	foundcol=true
	obj_player.x=x
	obj_player.y=y
}

y+=vspd
y=floor(y)

//destroy
if foundcol instance_destroy(id)
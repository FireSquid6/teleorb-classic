var foundcol=false

//x collision
if tile_meeting(x+hspd,y,global.collisionMap)
{
	while !tile_meeting(x+sign(hspd),y,global.collisionMap) {x+=sign(hspd)}
	hspd=0
	foundcol=true
	obj_player.x=x
	obj_player.y=y
}

x+=hspd
x=floor(x)

//y collision
if tile_meeting(x,y+vspd,global.collisionMap)
{
	while !tile_meeting(x,y+sign(vspd),global.collisionMap) {y+=sign(vspd)}
	vspd=0
	foundcol=true
	obj_player.x=x
	obj_player.y=y
}

y+=vspd
y=floor(y)

//destroy
if foundcol instance_destroy(id)
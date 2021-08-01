//get colmap
var layid=layer_get_id("ts_collision")
global.collisionMap=layer_tilemap_get_id(layid)
#macro TILE_SIZE 16

//place walls
doPlatformChecking=false
layid=layer_get_id("lay_collision")
if layer_exists(layid)
{
	var width=room_width div TILE_SIZE
	var height=room_height div TILE_SIZE
	
	var row=0
	var column=0
	var xx,yy,tile,inst
	
	while row!=height
	{
		if column>=width
		{
			row++
			column=0
		}
		
		xx=column*TILE_SIZE
		yy=row*TILE_SIZE
		
		tile=tilemap_get_at_pixel(global.collisionMap,xx,yy)
		
		//set tile
		switch tile
		{
			case 0: //nothing
				break
			case 1: //wall - sprite should be a generic wall
				instance_create_layer(xx,yy,"lay_collision",obj_wall)
				break
			case 2: //orbwall - only blocks orbs, doesn't kill them on impact
				instance_create_layer(xx,yy,"lay_collision",obj_orbwall)
				break
			case 3: //playerwall - only blocks player, orbs go through
				instance_create_layer(xx,yy,"lay_collision",obj_playerwall)
				break
			case 4: //platform
				instance_create_layer(xx,yy,"lay_collision",obj_platform)
				doPlatformChecking=true
				break
			case 5: //nothing
				break
			default: //spikes
				if tile>=6
				{
					inst=instance_create_layer(xx,yy,"lay_collision",obj_kill)
					inst.image_index=tile-6
				}
				break
				
		}
		
		column++
	}
}

//place player
if instance_exists(obj_playerSpawn)
{
	var xx,yy
	with obj_playerSpawn
	{
		if spawnpoint==global.spawnpoint
		{
			xx=x
			yy=y
		}
		instance_destroy()
	}
		
	instance_create_layer(xx,yy,"lay_player",obj_player)
}
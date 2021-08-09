#macro TILE_SIZE 16

#region INDEX LEVEL
var room_name=room_get_name(room)
global.currentLevel=string_char_at(room_name,10)
global.currentLevel=real(global.currentLevel)
global.currentBranch=string_char_at(room_name,12)
global.currentBranch=real(global.currentBranch)
global.currentRoom=string_char_at(room_name,14)
global.currentRoom=real(global.currentRoom)
#endregion

#region SETUP LEVEL
if string_char_at(room_name,4)=="l"
{	
	//get colmap
	var layid=layer_get_id("ts_collision")
	global.collisionMap=layer_tilemap_get_id(layid)
	layer_set_visible(layid,global.debug_mode)

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
					if tile>=6 && tile!=21
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
}
#endregion

#region LIGHTING
renderer=new BulbRenderer(c_black,BULB_MODE.HARD_BM_ADD_SELFLIGHTING,true)
freeRenderer=true

//create occluders
with obj_wall
{
	occluder=new BulbStaticOccluder(other.renderer)
}

//create lights
with par_light
{	
	light=new BulbLight(other.renderer,sprite,image,x,y)
	light.xscale=xscale
	light.yscale=yscale
	light.angle=angle
	light.blend=blend
	light.alpha=alpha
}

#endregion
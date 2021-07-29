//get colmap
var layid=layer_get_id("ts_collision")
global.collisionMap=layer_tilemap_get_id(layid)
#macro TILE_SIZE 16

//place walls
layid=layer_get_id("lay_collision")
{
	var width=room_width div TILE_SIZE
	var height=room_height div TILE_SIZE
	
	var row=0
	var column=0
	var xx,yy,tile
	
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
			case 1: //wall - sprite should be a generic wall
				instance_create_layer(xx,yy,"lay_collision",obj_wall)
				break
			case 2: //playerwall
				instance_create_layer(xx,yy,"lay_collision",obj_playerwall)
				break
			case 3: //orbwall
				instance_create_layer(xx,yy,"lay_collision",obj_orbwall)
				break
			case 4: //kill
				instance_create_layer(xx,yy,"lay_collision",obj_kill)
				break
			case 5: //player kill
				instance_create_layer(xx,yy,"lay_collision",obj_killPlayer)
				break
			case 6: //orb kill
				instance_create_layer(xx,yy,"lay_collision",obj_killOrb)
				break
		}
		
		column++
	}
}
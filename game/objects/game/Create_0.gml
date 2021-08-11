//draw loading
draw_set_color(c_black)
draw_rectangle(0,0,room_width,room_height,false)
draw_set_color(c_white)
draw_text(0,0,"NOW LOADING (this shouldn't take long, if it is something is broken)")

#region GLOBAL VARS
global.debug_mode = false

#endregion

freeRenderer=false


#region INDEX ROOMS
var i=room_first
var level,branch,rm,tilemap,layid,surf,buff,fname,grid
global.lightbuff_name_list=ds_list_create()
while room_exists(i)
{
	var room_name=room_get_name(i)
	var digits=string_digits(room_name)
	
	if string_length(digits)==3
	{
		//index the room
		level=string_char_at(digits,1)
		level=real(level)
		branch=string_char_at(digits,2)
		branch=real(branch)
		rm=string_char_at(digits,3)
		rm=real(rm)
		global.room_array[level][branch][rm]=i
		
		//setup lighting
		room_goto(i)
		grid=ds_grid_create(room_width div TILE_SIZE, room_height div TILE_SIZE)
		surf=surface_create(room_width,room_height)
		buff=buffer_create(1,buffer_grow,1)
		layid=layer_get_id("ts_lighting")
		tilemap=layer_tilemap_get_id(layid)
		
		//decide which tiles need fading
		
		//draw the tilemap
		surface_set_target(surf)
		draw_tilemap(tilemap,0,0)
		surface_reset_target()
		
		//write lighting to file
		fname="lightbuff_"+string(level)+"_"+string(branch)+"_"+string(rm)+".cbt"
		buffer_get_surface(buff,surf,0)
		buffer_save(buff,fname)
		
		//add the fname to a list
		ds_list_add(global.lightbuff_name_list,fname)
		
	}
	
	i=room_next(i)
}

#endregion

#region LOAD SAVE
//if a file exists, load the data
if file_exists("file.savedgame")
{
	//get struct
	var buff=buffer_load("file.savedgame")
	var str=buffer_read(buff,buffer_string)
	var struct=json_parse(str)
	
	//load data
	global.spawnpoint=struct.spawnpoint
	global.slideUnlocked=struct.slideUnlocked
	global.dashUnlocked=struct.dashUnlocked
	global.orbUnlocked=struct.orbUnlocked
	global.currentBranch=struct.currentBranch
	global.currentLevel=struct.currentLevel
	global.currentRoom=struct.currentRoom
}
//if no file exists, start a fesh file
else
{
	//set default vars
	global.spawnpoint=0
	global.slideUnlocked=false
	global.dashUnlocked=false
	global.orbUnlocked=false
	global.currentBranch=1
	global.currentLevel=1
	global.currentRoom=1
}
#endregion

if DEVELOPER_MODE room_goto_next() else room=room_get_index(global.currentLevel,global.currentBranch,global.currentRoom)
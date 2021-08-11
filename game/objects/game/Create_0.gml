#region GLOBAL VARS
global.debug_mode = false

#endregion

freeRenderer=false

#region INDEX ROOMS
var i=room_first
var level,branch,rm
while room_exists(i)
{
	var room_name=room_get_name(i)
	var digits=string_digits(room_name)
	
	if string_length(digits)==3
	{
		level=string_char_at(digits,1)
		level=real(level)
		branch=string_char_at(digits,2)
		branch=real(branch)
		rm=string_char_at(digits,3)
		rm=real(rm)
		global.room_array[level][branch][rm]=i
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
	str=base64_decode(str)
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
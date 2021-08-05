#region INDEX ROOMS
var i=room_first
var level,branch,rm
while room_exists(i)
{
	var room_name=room_get_name(i)
	
	if string_char_at(room_name,4)=="l"
	{
		level=string_char_at(room_name,10)
		level=real(level)
		branch=string_char_at(room_name,12)
		branch=real(branch)
		rm=string_char_at(room_name,14)
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

room_goto_next()
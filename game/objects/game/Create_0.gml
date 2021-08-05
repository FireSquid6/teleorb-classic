room_goto_next()

//if a file exists, load the data
if file_exists("file.savedgame")
{
	//get struct
	var buff=buffer_load("file.savedgame")
	var str=buffer_read("file.savedgame",buffer_string)
	var struct=json_decode(str)
	
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
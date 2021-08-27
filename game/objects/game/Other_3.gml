//save current data
if !DEVELOPER_MODE
{
	var savedata = 
	{
		spawnpoint : global.spawnpoint,
		orbUnlocked : global.orbUnlocked,
		dashUnlocked : global.dashUnlocked,
		slideUnlocked : global.slideUnlocked,
		currentLevel : global.currentLevel,
		currentBranch : global.currentBranch,
		currentRoom : global.currentRoom
	}

	//translate the array to json
	var saveString=json_stringify(savedata)

	//store the array in a buffer
	var saveBuffer=buffer_create(32,buffer_grow,1)
	buffer_write(saveBuffer,buffer_string,saveString)

	//save the buffer
	buffer_save(saveBuffer,"file.savedgame")
}
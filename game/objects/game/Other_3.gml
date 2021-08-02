//initialize the array
var saveArray=array_create(0)

//save unlocked items
var unlocks =
{
	orb : global.orbUnlocked,
	dash : global.dashUnlocked,
	slide : global.slideUnlocked
}
array_push(saveArray,unlocks)

//save current room
var roomdata =
{
	currentLevel : global.currentLevel,
	currentBranch : global.currentBranch,
	currentRoom : global.currentRoom
}
array_push(saveArray,roomdata)

//translate the array to json
var saveString=json_stringify(saveArray)

//store the array in a buffer
var saveBuffer=buffer_create(32,buffer_grow,1)
buffer_write(saveBuffer,buffer_string,saveString)

//save the buffer
buffer_save(saveBuffer,"SAVE.json")
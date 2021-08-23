#region GLOBAL VARS
global.debug_mode = false
global.modui_debug = false
lastLevel=0
lastRoom=0
lastBranch=0
paused=false

//pause ui setup
canvas=new modui_canvas()
var guiscale=4

//music enable
var element=new modui_button_sprite(spr_music,0,0,0)
with element
{
	add_method(sound_settings_on_init,MODUI_EVENTS.INIT)
	add_method(sound_settings_on_update,MODUI_EVENTS.UPDATE)
	image_xscale=guiscale
	image_yscale=guiscale
	change_bbox(x,y,x+((sprite_get_width(sprite_index)*guiscale)-1),y+((sprite_get_height(sprite_index)*guiscale)-1))
}
canvas.add_element(element)

//sound enable
element=new modui_button_sprite(spr_sound,0,sprite_get_width(spr_sound)*guiscale,0)
with element
{
	add_method(sound_settings_on_init,MODUI_EVENTS.INIT)
	add_method(sound_settings_on_update,MODUI_EVENTS.UPDATE)
	image_xscale=guiscale
	image_yscale=guiscale
	change_bbox(x,y,x+((sprite_get_width(sprite_index)*guiscale)-1),y+((sprite_get_height(sprite_index)*guiscale)-1))
}
canvas.add_element(element)


#endregion

//play sound
audio_play_sound(mus_spacetrivia,25,true)

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
if file_exists("file.savedgame") && !DEVELOPER_MODE
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
	global.orbUnlocked=true
	global.currentBranch=1
	global.currentLevel=1
	global.currentRoom=1
}
#endregion

room=room_get_index(global.currentLevel,global.currentBranch,global.currentRoom)
if DEVELOPER_MODE room=room_next(room_first)
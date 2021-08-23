#region GLOBAL VARS
global.debug_mode = false
global.modui_debug = false
lastLevel=0
lastRoom=0
lastBranch=0
paused=false

//pause ui setup
canvas=new modui_canvas()
var guiscale=4 //scale of the GUI
var padding=30 //padding away from the edge
var audio_space=25 //space between audio controls
var box_space=30 //space between boxes
var box_pos=250

//music enable
var element=new modui_button_sprite(spr_music,0,padding,padding)
with element
{
	add_method(sound_settings_on_init,MODUI_EVENTS.INIT)
	add_method(sound_settings_on_update,MODUI_EVENTS.UPDATE)
	image_xscale=guiscale
	image_yscale=guiscale
	snap_bbox_to_scale()
}
canvas.add_element(element)

//sound enable
element=new modui_button_sprite(spr_sound,0,(sprite_get_width(spr_sound)*guiscale)+padding+audio_space,padding)
with element
{
	add_method(sound_settings_on_init,MODUI_EVENTS.INIT)
	add_method(sound_settings_on_update,MODUI_EVENTS.UPDATE)
	image_xscale=guiscale
	image_yscale=guiscale
	snap_bbox_to_scale()
}
canvas.add_element(element)

//BOXES
function format_box_scribble(_element)
{
	_element.starting_format("fnt_lcd",c_black)
	_element.align(fa_center,fa_middle)
	_element.transform(1.75,1.75,0)
	return _element
}

//back to game
element=new modui_button_sprite(spr_gui_box,0,padding,box_pos)
with element
{
	add_method(draw_scribble_end_draw,MODUI_EVENTS.POSTDRAW)
	image_xscale=4+guiscale
	image_yscale=4+guiscale
	scrib_x=x+(sprite_get_width(sprite_index)*0.5)*image_xscale
	scrib_y=y+(sprite_get_height(sprite_index)*0.5)*image_yscale
	scribble_element=scribble("BACK TO GAME")
	scribble_element=format_box_scribble(scribble_element)
	snap_bbox_to_scale()
	cx=bbox_left+25
	cy=bbox_top+25
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
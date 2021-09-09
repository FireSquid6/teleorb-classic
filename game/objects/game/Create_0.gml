if !(ds_map_exists(global.__scribble_font_data, "fnt_lcd")) scribble_font_add("fnt_lcd")

#region PARTICLES
//rock hit trail
var p=part_type_create()
part_type_shape(p,pt_shape_pixel)
part_type_size(p,5,5,-0.2,0)
part_type_life(p,50,60)
part_type_speed(p,2,3,0,0)
part_type_color2(p,make_color_rgb(150,150,150),make_color_rgb(200,200,200))
global.pt_rockHit=p

#endregion

#region GLOBAL VARS
global.debug_mode = false
global.modui_debug = false
lastLevel=0
lastRoom=0
lastBranch=0
paused=false

minutes=0
seconds=0
frames=0

display_set_gui_size(display_get_width(),display_get_height())

#endregion

#region LOAD SAVE
//if a file exists, load the data
if file_exists("file.savedgame")
{
	global.canContinue=true
	
	//get structe
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
	global.game_modifier=struct.game_modifier
	global.music_modifier=struct.music_modifier
}
//if no file exists, start a fesh file
else
{
	global.canContinue=false
	
	//set default vars
	global.spawnpoint=0
	global.slideUnlocked=false
	global.dashUnlocked=false
	global.orbUnlocked=true
	global.currentBranch=1
	global.currentLevel=1
	global.currentRoom=1
	global.game_modifier=0
	global.music_modifier=0
	
	if DEVELOPER_MODE
	{
		global.music_modifier=1
	}
}
#endregion

#region BEST TIME
if file_exists("besttime.savedgame")
{
	hasBestTime=true
	var buff=buffer_load("besttime.savedgame")
	var str_besttime=buffer_read(buff,buffer_string)
	var json_data=json_parse(str_besttime)
	best_minutes=json_data.minutes
	best_seconds=json_data.seconds
	best_frames=json_data.frames
}
else hasBestTime=false

#endregion

#region PAUSE SCREEN SETUP
//canvas
canvas=new modui_canvas()
#macro guiscale 4 //scale of the GUI
#macro padding 30 //padding away from the edge
#macro audio_space 25 //space between audio controls
var box_space=30 //space between boxes
var box_pos=250 //y pos of the box
#macro box_scale 8
var audio_y=(display_get_gui_height() - (sprite_get_height(spr_music)*guiscale)) - padding

//music enable
var element=new modui_button_sprite(spr_music,0,padding,audio_y)
with element
{
	add_method(sound_settings_on_init,MODUI_EVENTS.INIT)
	add_method(sound_settings_on_update,MODUI_EVENTS.UPDATE)
	add_method(play_click,MODUI_EVENTS.PRESSED)
	image_xscale=guiscale
	image_yscale=guiscale
	snap_bbox_to_scale()
}
canvas.add_element(element)

//sound enable
element=new modui_button_sprite(spr_sound,0,(sprite_get_width(spr_sound)*guiscale)+padding+audio_space,audio_y)
with element
{
	add_method(sound_settings_on_init,MODUI_EVENTS.INIT)
	add_method(sound_settings_on_update,MODUI_EVENTS.UPDATE)
	add_method(play_click,MODUI_EVENTS.PRESSED)
	image_xscale=guiscale
	image_yscale=guiscale
	snap_bbox_to_scale()
}
canvas.add_element(element)

//delete
var xx=display_get_width()-((sprite_get_width(spr_trashCan)*guiscale)+padding)
var yy=display_get_gui_height() - ((sprite_get_height(spr_trashCan)*guiscale)+padding)
element=new modui_button_sprite(spr_trashCan,0,xx,yy)
with element
{
	image_xscale=guiscale
	image_yscale=guiscale
	snap_bbox_to_scale()
	normal_index=0
	selected_index=1
	pressed_index=2
	add_method(change_image_index,MODUI_EVENTS.UPDATE)
	add_method(reset_game,MODUI_EVENTS.PRESSED)
	add_method(play_click,MODUI_EVENTS.PRESSED)
}
canvas.add_element(element)

//BOXES
//back to game
element=new modui_button_sprite(spr_gui_box,0,padding,box_pos)
with element
{
	add_method(unpause,MODUI_EVENTS.PRESSED)
	add_method(play_click,MODUI_EVENTS.PRESSED)
	element=format_box(element)
	scribble_element=scribble("BACK TO GAME")
	scribble_element=format_box_scribble(scribble_element)
}
canvas.add_element(element)


//restart room
var height=sprite_get_height(spr_gui_box)
var pos=box_pos+(((height*box_scale)+box_space)*1)
element=new modui_button_sprite(spr_gui_box,0,padding,pos)
with element
{
	element=format_box(element)
	scribble_element=scribble("RESTART ROOM")
	scribble_element=format_box_scribble(scribble_element)
	add_method(room_restart_better,MODUI_EVENTS.PRESSED)
	add_method(unpause,MODUI_EVENTS.PRESSED)
	add_method(play_click,MODUI_EVENTS.PRESSED)
}
canvas.add_element(element)


//exit game
pos=box_pos+(((height*box_scale)+box_space)*2)
element=new modui_button_sprite(spr_gui_box,0,padding,pos)
with element
{
	element=format_box(element)
	scribble_element=scribble("SAVE AND EXIT")
	scribble_element=format_box_scribble(scribble_element)
	add_method(game_end,MODUI_EVENTS.PRESSED)
	add_method(play_click,MODUI_EVENTS.PRESSED)
}
canvas.add_element(element)

//GAME PAUSED Text
paused_text=scribble("- GAME PAUSED -")
paused_text.transform(4,4,0)
paused_text.starting_format("fnt_lcd",c_white)
paused_text.align(fa_center,fa_middle)

#endregion

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


//set volumes
set_audio_volumes()

room=rm_title_screen
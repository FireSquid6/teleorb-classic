title_canvas=new modui_canvas()
level_select_canvas=new modui_canvas()
speedrun_canvas=new modui_canvas()

var element
var gui_width=display_get_gui_width()
var gui_height=display_get_gui_height()
var box_pos=gui_height * 0.12
var box_spacing = gui_height * 0.06
var audio_y=(gui_height - (sprite_get_height(spr_music)*guiscale)) - padding

//TITLE CANVAS
//new game
element = new teleorb_ui_button_template(spr_gui_box, 0, padding, box_pos + box_spacing, "NEW GAME")
title_canvas.add_element(element)

//continue
element = new teleorb_ui_button_template(spr_gui_box, 0, padding, (box_pos * 2) + (box_spacing * 2), "CONTINUE GAME")
title_canvas.add_element(element)

//speedrun 
element = new teleorb_ui_button_template(spr_gui_box, 0, padding, (box_pos * 3) + (box_spacing * 3), "SPEEDRUN")
title_canvas.add_element(element)

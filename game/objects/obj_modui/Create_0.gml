canvas=new modui_canvas(MODUI_DRAW_TYPES.GUI)
var element=new modui_button(spr_box,1,50,50)
element.add_method(makered,MODUI_EVENTS.SELECTED)
canvas.add_element(element,0,0)
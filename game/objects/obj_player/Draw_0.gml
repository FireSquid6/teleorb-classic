draw_self()
draw_text(x,y-32,string(move))
draw_text(x,y-42,string(hspd))

draw_set_color(c_aqua)
draw_line(bbox_left,bbox_top,bbox_right,bbox_top)
draw_line(bbox_right,bbox_top,bbox_right,bbox_bottom)
draw_line(bbox_left,bbox_bottom,bbox_right,bbox_bottom)
draw_line(bbox_left,bbox_top,bbox_left,bbox_bottom)
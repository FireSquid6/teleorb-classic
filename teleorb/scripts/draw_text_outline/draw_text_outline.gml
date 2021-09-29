function draw_text_outline(_x,_y,_text,_textColor,_outlineColor,_outlineThickness) 
{
    var xx=_x
    var yy=_y 
    var text=_text 
    var tcolor=_textColor 
    var ocolor=_outlineColor 
    var thickness=_outlineThickness
    var i=1
    
    draw_set_color(ocolor)
    repeat _outlineThickness
    {
        draw_text(xx-i,yy,text)
        draw_text(xx+i,yy,text)
        draw_text(xx,yy+i,text)
        draw_text(xx,yy-i,text)
        i++
    }
    
    draw_set_color(tcolor)
    draw_text(xx,yy,text)
}
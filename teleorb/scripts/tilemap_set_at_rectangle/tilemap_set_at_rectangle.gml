function tilemap_set_at_rectangle(x1,y1,x2,y2,tilemap,tiledata,size) 
{
    var row=0
    var column=0
    var lastrow=(x2-x1) div size
    var lastcolumn=(y2-y1) div size
    var xx,yy
    
    while (row!=lastrow)
    {
        if column>=lastcolumn
        {
            column=0
            row++
        }
        column++
        
        xx=x1+(column*size)
        yy=y1+(row*size)
        
        tilemap_set_at_pixel(tilemap,tiledata,xx,yy)
    }
}
function BulbOccluderFromTilemap(tilemap,size,renderer)
{
    //tilemap - the tilemap id returned from layer_tilemap_get_id("layer_name")
    //size - the grid size of the tile in pixels
    //renderer - the renderer the occluder will be added to 
    
    //setup occluder
    var occ=new BulbDynamicOccluder(renderer)
    occ.x=0
    occ.y=0
    occ.xscale=1
    occ.yscale=1
    
    //get width and height in cells
    var cwidth=(room_width div size)
    var cheight=(room_height div size)
    
    //setup local variables
    var row=0 //the current row the loop is checking for a tile
    var column=0 //the current column the loop is checking for a tile
    var xx,yy //x and y pixel position the loop checks for
    
    //bot and right
    var bottom,right
    
    //loop
    while (row!=cheight)
    {
        //check column is over the width in cells
        if column>=cwidth
        {
            row++ //start checking the next row
            column=0 //reset column
        }
    
        //get x and y in pixels
        xx=column*size
        yy=row*size
        
        //check tilemap
        if tilemap_get_at_pixel(tilemap,xx,yy)!=0
        {
            //get bottom and right
            bottom=yy+size
            right=xx+size
            
            //xx and yy will always represent the top left corner of a tile
            //add edges if no tile on the edge
            if tilemap_get_at_pixel(tilemap,xx,yy-size)==0 occ.AddEdge(xx,yy,right,yy) //top
            if tilemap_get_at_pixel(tilemap,xx+size,yy)==0 occ.AddEdge(right,yy,right,bottom) //right
            if tilemap_get_at_pixel(tilemap,xx,yy+size)==0 occ.AddEdge(right,bottom,xx,bottom) //bottom
            if tilemap_get_at_pixel(tilemap,xx-size,yy)==0 occ.AddEdge(xx,bottom,xx,yy) //left
        }
    
        //add to column
        column++
    }
    
    //return
    return occ
}
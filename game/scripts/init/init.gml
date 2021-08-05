#region PARTICLES
//Wallslide trail
var p=part_type_create()
part_type_shape(p,pt_shape_pixel)
part_type_size(p,5,5,-0.2,0)
part_type_color2(p,c_white,make_color_rgb(200,200,200))
part_type_direction(p,90,90,0,0)
part_type_speed(p,4,4,0,0)

#endregion
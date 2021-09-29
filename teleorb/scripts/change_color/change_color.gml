//events
function change_color_init()
{
	selectColor=c_red
	normalColor=c_white
}

function change_color_update()
{
	image_blend=normalColor
}

function change_color_selected()
{
	image_blend=selectColor
}
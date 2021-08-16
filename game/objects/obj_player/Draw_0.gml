draw_reset()
draw_self()
if state=playerStates.teleporting
{
	draw_sprite_ext(spr_player_teleporting,other_image_index,otherx,othery,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
}
function throw_orb()
{
	if !thrown_orb && canOrb && orb instance_create_layer(x, y ,"lay_orb", obj_orb)
	canOrb=false
	thrown_orb=true
}
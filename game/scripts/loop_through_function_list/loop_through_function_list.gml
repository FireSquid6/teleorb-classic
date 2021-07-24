function loop_through_function_list(_list)
{
	//break
	if ds_list_size(_list)<1 return 0
	
	//loop
	var size=ds_list_size(_list)
	var i=0
	repeat size
	{
		size=ds_list_size(_list)
		var func=ds_list_find_value(_list,i)
		func()
		i++
	}
	
	//return
	return true
}
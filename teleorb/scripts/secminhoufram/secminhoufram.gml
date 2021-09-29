///@function					minsecfram(minutes, seconds, hours)
///@description					turns minutes and seconds into frames
///@param {real}	seconds		amount of seconds to be turned into frames
///@param {real}	minutes		amount of minutes to be turned into frames
///@param {real}	hours		amount of hours to be turned into frames
function secminhoufram(_sec,_min,_hou)
{
	var _time=(_sec*room_speed)+(_min*(room_speed*60))+(_hou*(room_speed*3600))
	return(_time)
}
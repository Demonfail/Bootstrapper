/// @desc Returns the state of a package, using the E_BOOTSTRAPPER_STATE macro
/// @param package_name

var _package_name = argument0;

var _state = E_BOOTSTRAPPER_STATE.NOT_FOUND;

if ( ds_map_exists( global.bootstrapper_finished_map, _package_name ) ) {
	
	var _finished = global.bootstrapper_finished_map[? _package_name ];
	if ( _finished ) {
		_state = E_BOOTSTRAPPER_STATE.COMPLETE;
	} else {
		_state = E_BOOTSTRAPPER_STATE.QUEUED;
	}
	
}

return _state;
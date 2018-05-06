/// @desc Returns the state of a package, using the E_BOOTSTRAPPER_STATE macro
/// @param package_name

var _package_name = argument0;

//  Make sure we have the necessary data structures in place for scripts to interface wit
__bootstrapper_create_data_structures();

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
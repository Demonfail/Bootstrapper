/// @desc Returns the current phase number for a script: 1 = first time called by oBootstrapper
/// @param script

var _script = argument0;
var _script_name = script_get_name( _script );

//  Make sure we have the necessary data structures in place for scripts to interface wit
__bootstrapper_create_data_structures();

//If this script hasn't been queued yet, return 0
if ( !ds_map_exists( global.bootstrapper_queue_map, _script_name ) ) return 0;
return global.bootstrapper_queue_map[? _script_name ];
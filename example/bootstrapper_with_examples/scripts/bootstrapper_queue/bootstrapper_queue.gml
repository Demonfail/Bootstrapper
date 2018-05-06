/// @desc Queues a script (by priority) for the bootstrapper to execute in the future
/// @param package_name
/// @param script
/// @param priority

var _package_name = argument0;
var _script       = argument1;
var _priority     = argument2;

//  We store the script by name string, so let's grab that first...
var _script_name = script_get_name( _script );

//  Make sure we have the necessary data structures in place for scripts to interface wit
__bootstrapper_create_data_structures();

//  Output some debug info if required (see __config_bootstrapper)
if ( BOOTSTRAPPER_VERBOSE ) {
	if ( !ds_map_exists( global.bootstrapper_queue_map, _script_name ) ) {
		show_debug_message( "bootstrapper: Script \"" + _script_name + "\" of \"" + _package_name + "\" queued with priority <" + string( _priority ) + ">" );
	} else {
		show_debug_message( "bootstrapper: Script \"" + _script_name + "\" of \"" + _package_name + "\" queued with priority <" + string( _priority ) + "> (requeued)" );
	}
}

//  Store this script+priority for access via bootstrapper_resolve()
ds_priority_add( global.bootstrapper_queue_pri, _script_name, _priority );

//  If this isn't the first time we're queueing this particular script, don't overwrite the phase counter
if ( !ds_map_exists( global.bootstrapper_queue_map, _script_name ) ) global.bootstrapper_queue_map[? _script_name ] = 0;

if ( ds_map_exists( global.bootstrapper_finished_map, _package_name ) ) {
	
    //  If the package has already been queued and declared as "finished" then throw an error cos we're about to unfinish the package.
	if ( global.bootstrapper_finished_map[? _package_name ] ) {
		show_error( "WARNING: \"" + _package_name + "\" is executing script \"" + _script_name + "\" after the package has been declared finished.", false );
	}
    
} else {
	
    //  If this package hasn't been seen before, add it to the bootstrapper's list
	ds_list_add( global.bootstrapper_package_list, _package_name );
	
}

//  If we're queuing this script, make sure the finished state for the package is set to <false>
global.bootstrapper_finished_map[? _package_name ] = false;
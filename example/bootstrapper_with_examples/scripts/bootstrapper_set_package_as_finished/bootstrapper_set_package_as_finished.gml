/// @desc Sets a package's state to "finished"
/// @param package_name

var _package_name = argument0;

//  Make sure we have the necessary data structures in place for scripts to interface wit
__bootstrapper_create_data_structures();

//  Check to see if we're trying to set the finished state of a package that's not been mentioned before
if ( !ds_map_exists( global.bootstrapper_finished_map, _package_name ) ) show_error( "WARNING: Package \"" + _package_name + "\" is not recognised.\n ", false );

show_debug_message( "\"" + _package_name + "\" set as finished" );
global.bootstrapper_finished_map[? _package_name ] = true;
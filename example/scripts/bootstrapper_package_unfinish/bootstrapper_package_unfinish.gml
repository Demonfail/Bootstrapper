/// @desc Resets a package's state to unfinished/working
/// @param package_name

var _package_name = argument0;

//  Make sure we have the necessary data structures in place for scripts to interface with
__bootstrapper_create_data_structures();

if ( BOOTSTRAPPER_VERBOSE ) show_debug_message( "Bootstrapper: \"" + _package_name + "\" set as UNfinished" );
global.bootstrapper_finished_map[? _package_name ] = false;
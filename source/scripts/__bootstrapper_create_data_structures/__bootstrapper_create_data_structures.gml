//  The execution order is uncertain when using gml_pragma( "global" ) - GM is fickle, and devs might reorder things anyway.
//  We only initialise if we haven't done so already in another script.

if ( !variable_global_exists( "bootstrapper_resolve_started" ) ) { //Only perform one check for the sake of efficiency
    if ( BOOTSTRAPPER_VERBOSE ) show_debug_message( "Bootstrapper: Global variables initialised." );
    global.bootstrapper_script_queue       = ds_queue_create();
    global.bootstrapper_phase_map          = ds_map_create();
    global.bootstrapper_finished_map       = ds_map_create();
    global.bootstrapper_suppress_phase_map = ds_map_create();
    global.bootstrapper_resolve_started    = false;
    global.bootstrapper_complete           = false;
}
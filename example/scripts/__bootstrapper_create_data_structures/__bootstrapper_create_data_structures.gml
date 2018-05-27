//  The execution order is uncertain when using gml_pragma( "global" ) - GM is fickle, and devs might reorder things anyway.
//  We only initialise if we haven't done so already in another script.

if ( !variable_global_exists( "bootstrapper_resolve_started" ) ) { //Only perform one check for the sake of efficiency
    
    show_debug_message( "---------------------------------------------------------------------------------------------------------" );
    show_debug_message( "  " + BOOTSTRAPPER_INFO );
    show_debug_message( "---------------------------------------------------------------------------------------------------------" );
    if ( BOOTSTRAPPER_VERBOSE ) show_debug_message( "Bootstrapper: Global variables initialised." );
    
    global.bootstrapper_script_queue       = ds_queue_create();
    global.bootstrapper_phase_map          = ds_map_create();
    global.bootstrapper_finished_map       = ds_map_create();
    global.bootstrapper_suppress_phase_map = ds_map_create();
    
    global.bootstrapper_resolve_started    = false;
    global.bootstrapper_complete           = false;
    
    global.bootstrapper_instance_count     = 1;
    global.bootstrapper_instances_created  = ds_map_create();
    
    return true;
    
}

return false;
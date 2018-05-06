//  The execution order is uncertain when using gml_pragma( "global" ) - GM is fickle, and devs might reorder things anyway.
//  We only initialise if we haven't done so already in another script.
if ( !variable_global_exists( "bootstrapper_queue_pri"    ) ) global.bootstrapper_queue_pri    = ds_priority_create();
if ( !variable_global_exists( "bootstrapper_queue_map"    ) ) global.bootstrapper_queue_map    = ds_map_create();
if ( !variable_global_exists( "bootstrapper_finished_map" ) ) global.bootstrapper_finished_map = ds_map_create();
if ( !variable_global_exists( "bootstrapper_package_list" ) ) global.bootstrapper_package_list = ds_list_create();
if ( !variable_global_exists( "bootstrapper_priority"     ) ) global.bootstrapper_priority     = 0;
if ( !variable_global_exists( "bootstrapper_resolving"    ) ) global.bootstrapper_resolving    = false;
if ( !variable_global_exists( "bootstrapper_complete"     ) ) global.bootstrapper_complete     = false;
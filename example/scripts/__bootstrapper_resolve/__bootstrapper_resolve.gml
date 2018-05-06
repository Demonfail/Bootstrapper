global.bootstrapper_resolving = true;

if ( ds_priority_empty( global.bootstrapper_queue_pri ) ) {
	
	//  Check to see if all the packages have declared their initialisation complete
	var _complete = true;
	var _size = ds_list_size( global.bootstrapper_package_list );
	for( var _i = 0; _i < _size; _i++ ) {
		if ( bootstrapper_get_package_state( global.bootstrapper_package_list[| _i ] ) != E_BOOTSTRAPPER_STATE.COMPLETE ) {
			_complete = false;
			break;
		}
	}
	
	if ( _complete ) {
		
		//  Clear up our data structures, we don't need these any more
		ds_priority_destroy( global.bootstrapper_queue_pri );
		ds_map_destroy( global.bootstrapper_queue_map );
		global.bootstrapper_queue_pri = undefined;
		global.bootstrapper_queue_map = undefined;
		
		//  Let's start the game :D
		show_debug_message( "bootstrapper: Initialisation process complete! Now proceeding to room \"" + room_get_name( room_next( room ) ) +"\"." );
        global.bootstrapper_complete = true;
        
        if ( room == room_last ) {
            show_error( "ERROR: bootstrapper wants to move to the next room, but this is the last room.\nbootstrapper will now spontaneously self-destruct.\n ", false );
            instance_destroy();
        } else {
		    room_goto_next();
        }
		
	}
	
} else {
	
	//  Make a note of the highest priority. Devs may want to use this to make complex multi-phase loaders if they really want
	global.bootstrapper_priority = ds_priority_find_priority( global.bootstrapper_queue_pri, ds_priority_find_max( global.bootstrapper_queue_pri ) );
    
	//  Then we actually pull out the script to execute, and remove it from the priority queue
	var _script_name = ds_priority_delete_max( global.bootstrapper_queue_pri );
    
    //  Scripts are stored as a name string so we need to turn that back into an index
	var _script = asset_get_index( _script_name );
    
	if ( ds_map_exists( global.bootstrapper_queue_map, _script_name ) ) {
		//  Increment this script's phase counter
		global.bootstrapper_queue_map[? _script_name ]++;
	} else {
		//  Scripts are added to the priority queue at the same time as the map. This should never fire
		show_error( "ERROR: Script \"" + _script_name + "\" is not present in phase map.\nThis is a weird error! Please contact the admins of the GameMakerDiscord GitHub organisation\n ", false );
	}
	
	if ( !script_exists( _script ) ) {
		//  Catch human error...
		show_error( "Script \"" + _script_name + "\" (queued with priority <" + string( global.bootstrapper_priority ) + ">) doesn't exist.\nPlease check all occurances of \"bootstrapper_queue()\" for errors.\n ", false );
	} else {
		//  ...otheriwse run the code!
		script_execute( _script );
		if ( BOOTSTRAPPER_VERBOSE ) show_debug_message( "bootstrapper: Executing script \"" + _script_name + "\" (iteration=" + string( iterations ) + ")" );
	}
	
    //  If we're using the debug output, make a note of some details of the last script that was executed
	if ( BOOTSTRAPPER_SHOW_DEBUG ) last_script = "\"" + _script_name + "\", phase=" + string( global.bootstrapper_queue_map[? _script_name ] );
    
    //  If the dev wants to see all the details of initialisation, let 'em have it! (see __config_bootstrapper)
	if ( BOOTSTRAPPER_VERBOSE ) && ( ds_priority_empty( global.bootstrapper_queue_pri ) ) show_debug_message( "bootstrapper: Script queue is now empty." );
	
}
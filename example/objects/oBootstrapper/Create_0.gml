iterations = 0;
last_script = ""

//  Make basic start-up checks (see __config_bootstrapper)
//  This can be turned off if specific custom behaviours are needed
if ( BOOTSTRAPPER_STARTUP_CHECK ) {
	if ( instance_count > 1 ) {
		show_error( "ERROR: oBootstrapper is not the only instance in this room (\"" + room_get_name( room ) + "\").\nPlease create a new empty room at the top of the \"Rooms\" resource section.\n ", false );
	} else if ( room != room_first ) {
		show_error( "ERROR: This room (\"" + room_get_name( room ) + "\" is not first.\nPlease create a new empty room at the top of the \"Rooms\" resource section.\n ", false );
	}
}

show_debug_message( "bootstrapper: Initialisation process started..." );
//  Please read "Making A Package" in __readme_bootstrapper()

//  Step 4) "Any further operations must occur inside scripts queued into the bootstrapper"
//  
//  Example D waits for Example C (instance-based) to finish before executing code.
//  This is achieved by this script queuing (line 22) itself whilst Example C has not finished.
//  
//  !!! Wait loops should be avoided where possible !!!



//  We get the state of the package called "Example C"
var _state = bootstrapper_get_package_state( "Example C" );
if ( _state == E_BOOTSTRAPPER_STATE.NOT_FOUND ) {
	
	//  If Example C hasn't been queued at all then show an error message
	show_error( "Example D: ERROR: Example C package not found.", true );
	
} else if ( _state == E_BOOTSTRAPPER_STATE.COMPLETE ) {
	
	show_debug_message( "Example D: Example C has completed..." );
	
	//  Step 5) "The package must declare itself finished once the initialisation process for that package has finished"
    bootstrapper_set_package_as_finished( "Example D" );
	
} else {
	
	//  If Example C has been started but is not yet complete, requeue this script
	bootstrapper_queue_wait( "Example D", __example_d_init_loop );
	
}
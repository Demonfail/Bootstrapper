//  Please read "Making A Package" in __readme_bootstrapper()

//  Step 1) "The package must use gml_pragma( "global", ... ) to execute a primary script"
gml_pragma( "global", "__example_c_init()" );

//  Step 2) "The primary script must only define variables essential to the package's operation"
//  Example D has no variables to define :)

//  See example B for more information on using queuing and script phases.
var _phase = bootstrapper_get_phase( "__example_c_init" );
switch( _phase ) {
	
	case 0: //Phase 0 is the phase executed on boot
	    
        //  Step 3) "If further processing is needed, the primary script may queue a script into the bootstrapper"
		bootstrapper_queue( "Example C", "__example_c_init" );
        
	break;
	
	case 1: //Phase 1 is the first phase executed by the bootstrapper
        
        //  Check if our dependency has finished loading (you can specify more than one dependency as additional arguments)
        if ( !bootstrapper_check_dependencies( "Example D" ) ) {
            
            //  ...if the dependency hasn't finished loading then we tell the bootstrapper to use this script again.
            //  Using bootstrapper_wait() prevents the bootstrapper from incrementing the phase counter.
            //  This means this phase will be executed again when this script is called by the bootstrapper.
            bootstrapper_wait( "Example C", "__example_c_init" );
            
            //  ...and then we abort all further operations
            exit;
        }
        
        show_debug_message( "Example C: Example D has finished - now finishing too." );
        
		//  Step 4) "The package must declare when the entire initialisation process for that package has finished"
		bootstrapper_package_finish( "Example C" );
		
	break;
	
	default:
        //  If there's a bug somewhere, a script may accidentally be called too many times
        show_error( "Example C: Phase (" + string( _phase ) + ") not supported", false );
	break;
	
}
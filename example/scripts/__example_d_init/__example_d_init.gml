//  Please read "Making A Package" in __bootstrapper_readme()
//  
//  Example D demonstrates the proper procedure for dealing with dependencies, specifically, waiting for
//  dependencies to finish loading. bootstrapper_check_dependencies() is used.
//  See Example B for more information on using queuing and script phases.

//  Step 1) "The package must use gml_pragma( "global", ... ) to execute a boot script"
gml_pragma( "global", "__example_d_init()" );

//  Step 2) "The boot script must only define variables essential to the package's operation"
//  Example D has no variables to define :)

var _phase = bootstrapper_get_phase( "__example_d_init" );
switch( _phase ) {
	
	case 0:
	    
        //  Step 3) "If further processing is needed, the boot script may queue a script or create a job instance"
		bootstrapper_queue( "Example D", "__example_d_init" );
        
	break;
	
	case 1: //Phase 1 is the first phase executed by the bootstrapper
        
        //  Check if our dependency has finished loading (you can specify more than one dependency as additional arguments)
        if ( !bootstrapper_check_dependencies( "Example B" ) ) { //(This script can take multiple arguments for multiple dependencies)
            
            //  ...if the dependency hasn't finished loading then we tell the bootstrapper to use this script again.
            //  Using bootstrapper_wait() prevents the bootstrapper from incrementing the phase counter.
            //  This means this phase will be executed again when this script is called by the bootstrapper.
            bootstrapper_wait( "Example D", "__example_d_init" );
            
            //  ...and then we abort this script
            exit;
        }
        
        show_debug_message( "Example D: Example B has finished - now finishing too." );
        
		//  Step 4) "The package must declare when the entire initialisation process for that package has finished"
		bootstrapper_package_finish( "Example D" );
		
	break;
	
}
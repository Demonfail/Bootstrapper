//  Please read "Making A Package" in __bootstrapper_readme()
//  
//  Example C demonstrates how to use script queuing and script phases to allow a package to
//  initialise variables and perform operations in multiple stages. Not every package will
//  need this feature but it is highly useful nonetheless.



//  Step 1) "The package must use gml_pragma( "global", ... ) to execute a boot script"
gml_pragma( "global", "__example_c_init()" );

//  Step 2) "The boot script must only define variables essential to the package's operation"
//  Example C has no variables to define.

//  It is sometimes necessary to have multiple stages in a package's initialisation.
//  The bootstrapper supports this with an internal "phase" counter for every script that's queued.
//  Queuing a script means that script will be executed again and the "phase" number is incremented.
//  Access to the phase counter is through bootstrapper_get_phase(), as below:
var _phase = bootstrapper_get_phase( "__example_c_init" );
switch( _phase ) {
	
	case 0: //Phase 0 is the phase executed on boot
	    
        //  Step 3) "If further processing is needed, the boot script may queue a script or create a job instance"
        //  Let's requeue this script so that we run the script again, but with _phase=1
		bootstrapper_queue( "Example C", "__example_c_init" );
		
	break;
	
	case 1: //Phase 1 is the first phase executed by the bootstrapper
        
        global.example_value++;
		show_debug_message( "Example C: global.example_value=" + string( global.example_value ) + " (should be 2)" );
        
		//  And requeue once again for _phase=2
		bootstrapper_queue( "Example C", "__example_c_init" ); 
		
	break;
	
	case 2: //Phase 2 is the second phase executed by the bootstrapper
		
        global.example_value++;
		show_debug_message( "Example C: global.example_value=" + string( global.example_value ) + " (should be 3)" );
		
		//  Step 4) "The package must declare when the entire initialisation process for that package has finished"
		bootstrapper_package_finish( "Example C" );
		
	break;
	
}
//  Please read "Making A Package" in __readme_bootstrapper()

//  Step 1) "The package must use gml_pragma( "global", ... ) to execute an initialisation script"
gml_pragma( "global", "__example_b_init()" );

//  Step 2) "The initialisation script must only define variables essential to the package's operation"
//  Example B has no variables to define :)

//  It is often preferable to have multiple stages in an initialisation to tidy up scripts.
//  bootstrapper supports this with an internal "phase" counter for every script that's queued.
//  Requeuing a script means that script will be executed again and the "phase" number is incremented.
//  Access to the phase counter is through bootstrapper_get_script_phase(), as below:
var _phase = bootstrapper_get_script_phase( __example_b_init );
switch( _phase ) {
	
	case 0: //Phase 0 is the phase executed on boot
	    
        //  Step 3) "If further processing is needed, the initialisation script may queue a script into the bootstrapper"
		//  __example_a_init_second() is queued with a priority of <1000> (see __example_a_init_first)
		//  This code queues an execution of __example_b_init(), before __example_a_init_second()
		bootstrapper_queue( "Example B", __example_b_init, 1001 );
		
	break;
	
	case 1: //Phase 1 is the first phase executed by the bootstrapper
        
		//  Step 4) "Any further operations must occur inside scripts queued into the bootstrapper"
		show_debug_message( "Example B: global.example_a_value=" + string( global.example_a_value ) + " (should be 0)" );
		
		//  Queue this script again at priority=1001, just after __example_a_init_second() is executed
		bootstrapper_queue( "Example B", __example_b_init, 999 ); 
		
	break;
	
	case 2: //Phase 2 is the second phase executed by the bootstrapper
		
		show_debug_message( "Example B: global.example_a_value=" + string( global.example_a_value ) + " (should be 1)" );
		
		//  Step 5) "The package must declare itself finished once the initialisation process for that package has finished"
		bootstrapper_set_package_as_finished( "Example B" );
		
	break;
	
	default:
        //  If there's a bug somewhere, a script may accidentally be called too many times
        show_error( "Example B: ERROR: Phase (" + string( _phase ) + ") not supported", false );
	break;
	
}
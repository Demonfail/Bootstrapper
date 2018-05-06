//  Please read "Making A Package" in __readme_bootstrapper()

//  Step 1) "The package must use gml_pragma( "global", ... ) to execute an initialisation script"
gml_pragma( "global", "__example_c_init()" );

//  Step 2) "The initialisation script must only define variables essential to the package's operation"
//  Example C has no variables to define :o

//  See Example B on how to use script phases
switch( bootstrapper_get_script_phase( __example_c_init ) ) {
	
	case 0:
        //  Step 3) "If further processing is needed, the initialisation script may queue a script into the bootstrapper"
		bootstrapper_queue( "Example C", __example_c_init, 1000 );
	break;
	
	case 1:
		//  Step 4) "Any further operations must occur inside scripts queued into the bootstrapper"
        
		//  Create an instance. This is often termed a "job" instance.
		//  This object has an alarm that, after 120, declares the package initialisation as finished.
		instance_create_depth( 0, 0, 0, oExampleC );
	break;
	
}
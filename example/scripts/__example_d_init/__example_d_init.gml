//  Please read "Making A Package" in __readme_bootstrapper()

//  Step 1) "The package must use gml_pragma( "global", ... ) to execute a primary script"
gml_pragma( "global", "__example_d_init()" );

//  Step 2) "The primary script must only define variables essential to the package's operation"
//  Example D has no variables to define :o

//  See Example B on how to use script phases
switch( bootstrapper_get_phase( "__example_d_init" ) ) {
	
	case 0:
        //  Step 3) "If further processing is needed, the primary script may queue a script into the bootstrapper"
		bootstrapper_queue( "Example D", "__example_d_init" );
	break;
	
	case 1:
		//  Create an instance. This is often termed a "job" instance.
		//  This object has an alarm that, after 120 steps, declares the Example D package as finished.
        //  You can't create instances in the boot phase so we have to delay creation by queuing a script.
		instance_create_depth( 0, 0, 0, oExampleD );
	break;
	
}
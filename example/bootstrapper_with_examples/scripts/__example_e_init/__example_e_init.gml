//  Please read "Making A Package" in __readme_bootstrapper()

//  This script emulates the behaviour of Example B, but without comments
//  This is how a package might commonly look

gml_pragma( "global", "__example_e_init()" );

var _phase = bootstrapper_get_script_phase( __example_e_init );
switch( _phase ) {
	
	case 0:
        bootstrapper_queue( "Example E", __example_e_init, 1001 );
	break;
	
	case 1:
		show_debug_message( "Example E: global.example_a_value=" + string( global.example_a_value ) + " (should be 0)" );
		bootstrapper_queue( "Example E", __example_e_init, 999 );
	break;
	
	case 2:
		show_debug_message( "Example E: global.example_a_value=" + string( global.example_a_value ) + " (should be 1)" );
		bootstrapper_set_package_as_finished( "Example E" );
	break;
	
	default:
        show_error( "Example E: ERROR: Phase (" + string( _phase ) + ") not supported", false );
	break;
	
}
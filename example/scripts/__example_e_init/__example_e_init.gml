//  Please read "Making A Package" in __readme_bootstrapper()

//  This script emulates the behaviour of Example D, but without comments.
//  This is how a package might commonly look.

gml_pragma( "global", "__example_e_init()" );
 
var _phase = bootstrapper_get_phase( "__example_e_init" );
switch( _phase ) {
	
	case 0:
		bootstrapper_queue( "Example E", "__example_e_init" );
	break;
	
	case 1:
        if ( !bootstrapper_check_dependencies( "Example D" ) ) {
            bootstrapper_wait( "Example E", "__example_e_init" );
            exit;
        }
        
        show_debug_message( "Example E: Example D has finished - now finishing too." );
		bootstrapper_package_finish( "Example E" );
	break;
	
	default:
        show_error( "Example E: Phase (" + string( _phase ) + ") not supported", false );
	break;
	
}
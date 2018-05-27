gml_pragma( "//global", "__example_d_init()" );

var _phase = bootstrapper_get_phase( "__example_d_init" );
switch( _phase ) {
	
	case 0:
        bootstrapper_queue( "Example D", "__example_d_init" );
	break;
	
	case 1:
        if ( !bootstrapper_check_dependencies( "Example B" ) ) {
            bootstrapper_wait( "Example D", "__example_d_init" );
            exit;
        }
        
        show_debug_message( "Example D: Example B has finished - now finishing too." );
		bootstrapper_package_finish( "Example D" );
	break;
	
}
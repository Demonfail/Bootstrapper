gml_pragma( "//global", "__example_c_init()" );

var _phase = bootstrapper_get_phase( "__example_c_init" );
switch( _phase ) {
	
	case 0:
	    bootstrapper_queue( "Example C", "__example_c_init" );
	break;
	
	case 1:
        global.example_value++;
		show_debug_message( "Example C: global.example_value=" + string( global.example_value ) + " (should be 2)" );
        
		bootstrapper_queue( "Example C", "__example_c_init" ); 
	break;
	
	case 2:
        global.example_value++;
		show_debug_message( "Example C: global.example_value=" + string( global.example_value ) + " (should be 3)" );
		
		bootstrapper_package_finish( "Example C" );
	break;
	
}
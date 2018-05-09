gml_pragma( "global", "__template_init()" );

switch( bootstrapper_get_phase( "__template_init" ) ) {
    
    case 0:
        bootstrapper_queue( "Template", "__template_init" );
    break;
    
    case 1:
        if ( !bootstrapper_check_dependencies( "A Dependency" ) ) {
            bootstrapper_wait( "Template", "__template_init" );
            exit;
        }
        
        bootstrapper_package_finish( "Template" );
    break;
    
}
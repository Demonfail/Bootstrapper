gml_pragma( "global", "__template_init()" );

switch( bootstrapper_get_script_phase( __template_init ) ) {
    
    case 0:
        bootstrapper_queue( "Quaternions", __template_init, 10000 );
    break;
    
    case 1:
        bootstrapper_set_package_as_finished( "Quaternions" );
    break;
    
}
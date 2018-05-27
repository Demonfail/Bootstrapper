gml_pragma( "//global", "__example_a_init()" );

global.example_value = 1;
show_debug_message( "Example A: global.example_value=" + string( global.example_value ) + " (should be 1)" );

bootstrapper_package_finish( "Example A" );
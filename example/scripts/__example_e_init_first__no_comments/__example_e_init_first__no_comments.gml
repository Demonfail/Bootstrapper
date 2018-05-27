gml_pragma( "//global", "__example_e_init_first()" );

global.example_e_value = 0;

bootstrapper_queue( "Example E", "__example_e_init_second" );
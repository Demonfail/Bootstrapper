//  Please read "Making A Package" in __bootstrapper_readme()

//  Step 1) "The package must use gml_pragma( "global", ... ) to execute a primary script"
gml_pragma( "global", "__example_f_init_first()" );

//  Step 2) "The primary script must only define variables essential to the package's operation"
global.example_f_value = 0;

//  Step 3) "If further processing is needed, the primary script may queue a script into the bootstrapper"
bootstrapper_queue( "Example F", "__example_f_init_second" );

//  Step 4) --> __example_f_init_second()
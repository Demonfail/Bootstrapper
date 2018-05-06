//  Please read "Making A Package" in __readme_bootstrapper()

//  Step 1) "The package must use gml_pragma( "global", ... ) to execute an initialisation script"
gml_pragma( "global", "__example_a_init_first()" );

//  Step 2) "The initialisation script must only define variables essential to the package's operation"
global.example_a_value = 0;

//  Step 3) "If further processing is needed, the initialisation script may queue a script into the bootstrapper"
bootstrapper_queue( "Example A", __example_a_init_second, 1000 );

//  Step 4/5) --> __example_a_init_second()
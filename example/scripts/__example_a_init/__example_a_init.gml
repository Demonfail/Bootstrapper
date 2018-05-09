//  Please read "Making A Package" in __readme_bootstrapper()

//  Step 1) "The package must use gml_pragma( "global", ... ) to execute a primary script"
gml_pragma( "global", "__example_a_init()" );

//  Step 2) "The primary script must only define variables essential to the package's operation"
global.example_value = 1;
show_debug_message( "Example A: global.example_value=" + string( global.example_value ) + " (should be 1)" );

//  Step 3) "If further processing is needed, the primary script may queue a script into the bootstrapper"
//  For simple packages, we don't need to do any more operations. We can ignore step 3.

//  Step 4) "The package must declare when the entire initialisation process for that package has finished"
bootstrapper_package_finish( "Example A" );
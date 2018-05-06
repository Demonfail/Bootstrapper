//  Please read "Making A Package" in __readme_bootstrapper()

//  Step 1) "The package must use gml_pragma( "global", ... ) to execute an initialisation script"
gml_pragma( "global", "__example_d_init()" );

//  Step 2) "The initialisation script must only define variables essential to the package's operation"
//  Example D has no variables to define :P

//  Step 3) "If further processing is needed, the initialisation script may queue a script into the bootstrapper"
bootstrapper_queue( "Example D", __example_d_init_loop, 1000 );
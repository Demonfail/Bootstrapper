//  Please read "Making A Package" in __bootstrapper_readme()

//  Step 1) "The package must use gml_pragma( "global", ... ) to execute a boot script"
gml_pragma( "global", "__example_e_init_first()" );

//  Step 2) "The boot script must only define variables essential to the package's operation"
//  Example E has no variables to define.

//  Step 3) "If further processing is needed, the boot script may queue a script or create a job instance"
bootstrapper_queue( "Example E", "__example_e_init_second" );

//  Step 4) --> __example_e_init_second()
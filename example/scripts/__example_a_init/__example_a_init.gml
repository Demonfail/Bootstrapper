//  Please read "Making A Package" in __bootstrapper_readme()
//  
//  Example A demonstrates how to set up an initialisation script for a simple package.
//  This kind of package would usually be for a library of scripts that require a limited number of
//  global variables to be initialised. Even if your library has no need to initialise global
//  variables at all, it still needs to execute bootstrapper_package_finish() so that other
//  packages can tell that your package has been installed.



//  Step 1) "The package must use gml_pragma( "global", ... ) to execute a boot script"
gml_pragma( "global", "__example_a_init()" );

//  Step 2) "The boot script must only define variables essential to the package's operation"
global.example_value = 1;
show_debug_message( "Example A: global.example_value=" + string( global.example_value ) + " (should be 1)" );

//  Step 3) "If further processing is needed, the boot script may queue a script or create a job instance"
//  For simple packages, we don't need to do any more operations. We can ignore step 3 in this case.

//  Step 4) "The package must declare when the entire initialisation process for that package has finished"
bootstrapper_package_finish( "Example A" );
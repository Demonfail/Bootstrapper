//  Please read "Making A Package" in __readme_bootstrapper()

show_debug_message( "Example F: __example_f_init_second() executed." );
global.example_f_value = 1;

//  Step 4) "The package must declare when the entire initialisation process for that package has finished"
bootstrapper_package_finish( "Example F" );
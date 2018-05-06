//  Please read "Making A Package" in __readme_bootstrapper()

//  Step 1/2/3) --> __example_a_init_first()
//  Step 4) "Any further operations must occur inside scripts queued into the bootstrapper"
show_debug_message( "Example A: __example_a_init_second() executed." );
global.example_a_value = 1;

//  Step 5) "The package must declare itself finished once the initialisation process for that package has finished"
bootstrapper_set_package_as_finished( "Example A" );